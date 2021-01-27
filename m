Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54866305684
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75846.136684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4gpO-0002z9-86; Wed, 27 Jan 2021 09:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75846.136684; Wed, 27 Jan 2021 09:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4gpO-0002yk-4I; Wed, 27 Jan 2021 09:09:30 +0000
Received: by outflank-mailman (input) for mailman id 75846;
 Wed, 27 Jan 2021 09:09:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xld=G6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4gpM-0002yf-B7
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 09:09:28 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6287210f-c41e-4735-ab11-11bf2025092f;
 Wed, 27 Jan 2021 09:09:27 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6287210f-c41e-4735-ab11-11bf2025092f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611738567;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HeVMECPq+Gn8ITMlzB10O35rkOwKWbDsNtoTljZith4=;
  b=D0+Qn0+RU/PklGIQtu0f9u5TTJmEd2cmax8ZksktR/HHVZZyKz/8koX+
   QkltPfpyQlqtXdupVyFndHHdaAKxAFyyDEFym/fKoIULjDYFRPZ0uV/Qm
   nLwBWIV50c4miQgOuxmlffrWZr/jpIdqWPulO1/MQBwBhtb8iKwbT8/Tu
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: doOnWZM79JEa3gyhWaDDF1SDxS2jdJ2bzlQsvfdrnkXLbLKdKc47V8W3+fnY6Lw2d6fB5oUj/V
 HygGJlZXDblyB+ZuTpl8NCQzgn6CZzbNdugUdbhyy9+skaM4Zh0UHxwVd6Ed32NmTY639j/H56
 olB7maBIBfaAzvCTgTIzlv1Z5QI3uF5k0jVSSoPIWArHIBJFRpwqm2JReC2UtRp5JvUuIYnh9F
 mXf5CfSjPmLlzQBit1Z9GfXxQmoLOWDW7w9Wu378m857B95pT85gCCzO79hO8Qt7e98Y51JzbM
 Vps=
X-SBRS: 5.2
X-MesageID: 37259527
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,378,1602561600"; 
   d="scan'208";a="37259527"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuDgC+4ipczb2v4sbDRZjA8yFHLsIWMg+FBaGIVMazjOF9YMj9YnDm+aoZsbBCm2Vfq7K/Op9W41YyJeJkJ6eZNbrwUoNoecdW+mCe8ZlD4JQbr5v+LEeJw/IL+Psfpg5bCwcnNK64OPDws4JnsZTkRKGQ4XQPwmCFARccLgCp/lXpTkbMgUwjcbW5hJkdhhIH/RKht9d9kfRumzOqngpo795gXX5JsBL6f0tMpQw8n51JrEImWyUVefjQaJT6NECpfv1p4OT616m6O5SD11NhrMNlRqY4084QQF8ntpfeFwZW3niDgtK6srxA8mNNCZtUoAQqfRgb0Cn05oseBdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7giLQG4ZYMwVqw0u3iuEAobhRVQySknrrHjbptAEWA=;
 b=SzLn/4lGM+57LxnUUjkz+uP5PBK8jq8FacUdV2qAaHuOUs2HQJC5Os1NLtQrihvP0Lg+BfOV9U1Mpb6N0YdF0g//h4Mk0Jy9s4xRawIzMDL+KsOZs6HIHqfFtDKQ0Z0+ju2fTzmOSo2nxEVpnsUZzrMSIFFZ0L7LY9QqzVtLX9BRTs2PAaGkDlXGdYsnRIYGUyZ/UXGM6q6GkeHImNBiyC2sEQTVICYZBhGoqHMhGDUp1haWJYhoh872UG4aUxJx5l4Sl7SazzZ6jIZLrIVrErs8JA6hWU+S2dhvs3j0Eg7LKRtTKP0UW/YpnuM1CgmVdPG60LoFgPLiBbMEJd6LWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7giLQG4ZYMwVqw0u3iuEAobhRVQySknrrHjbptAEWA=;
 b=ili0V7pwaBc5wKDtWen7U4xajsQ4lKeYmlMel0qdhG1Swb5GhNnXNTRYnV4sS5Cq0Gw28iEEGYCXQ3P2UlORIOIHGMAii1YiqkS1E5p4ClmeOYdnzHtgN1pyWLidD0MdXL5OjKl7PgpZ8aYbwbJ58xn/ym4J0dtBms2vpttPXPs=
Date: Wed, 27 Jan 2021 10:09:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jens Axboe
	<axboe@kernel.dk>, <xen-devel@lists.xenproject.org>, Bjorn Helgaas
	<bhelgaas@google.com>
Subject: Re: [PATCH] xen-blkfront: Fix 'physical' typos
Message-ID: <20210127090917.bkwa2c6h5py3uffa@Air-de-Roger>
References: <20210126205509.2917606-1-helgaas@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126205509.2917606-1-helgaas@kernel.org>
X-ClientProxiedBy: PR0P264CA0226.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9e557f8-9538-4410-fc88-08d8c2a33c74
X-MS-TrafficTypeDiagnostic: DM6PR03MB4298:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4298CF4CC91193A1F5FAFFFE8FBB9@DM6PR03MB4298.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+7oY69J1LuiPtpHXOHkjQOpK7RlfiH3ZTbI2qsyk1iz2nLokvZpaZ5n8U7RQ8AIxwxFGo0UrLzcgv4ZJDOwEzsi7WBJ4Ghr5p/EOHNoTX6jgrnHPsXt4M6X05spvYg0UArD1l5/KMZk4xvgzmA5t58boxK3UuNf5aX2cnpo/hzvKcR6Ziaqg7agNlt7GxgfoBenMx4UjETrKaCbrTa+26WhhuVrYvdTrv6WnZc9ERFGZ07DWx/1JBc1Ki4Cz8iodYiwA9h1KCDpgajcZryzZNvGriVgScfoQ2s+o9FShBq4MYUUTgBWYDUcBOJuV/e7XcLX520hynUBtXdn7eqm5YkCIYkunUr5VZSWRvPeb/obdulLF4Uiw7n1T2GlgyfD2DsDelSpGpx/fGg4Vqswb0Cu38XMrhut7JaSxYxNHM/2h+/pLsccYVFoRUsf4XujD8ptSop/WywdDCt2qGQ/3HX3Swj3EQhlTT4Hd099hFGcSyb2ExnxUi4qDZLtciIShu8KyMdhK5Q8G9wRwtfkYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(396003)(136003)(366004)(346002)(8676002)(2906002)(6496006)(85182001)(1076003)(86362001)(478600001)(186003)(54906003)(26005)(6666004)(5660300002)(4326008)(6916009)(558084003)(66476007)(6486002)(66946007)(33716001)(8936002)(9686003)(16526019)(316002)(66556008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K043UmNOQUJNaklHS044L0I4ZlZBNE5UdlJFNHpUL1hMZ0hXbHlzWk1rbHNu?=
 =?utf-8?B?UUhnQThYWGFWUE90U1luZHpQVGFRM2N0b1dXVUxDd1lzU0ZYcUhNN0NkdS9D?=
 =?utf-8?B?RHU4dFUvb2hyWGpGaGt2Z214UWhUVEw0NWgyOWJkWnVET0VJeUtGRlN6TlVI?=
 =?utf-8?B?NVZ2Y2ZMa1FaY2d3Ykg5SW0wZmhJQUpMclBJbW1QNHNyU09rWEQ0aW5VTGY2?=
 =?utf-8?B?a1hhTnFTTy8xT1BqOWhCYUk4N2xGRjRhU05yd0YxdU1BaTQ0MFA2SlAvbDFu?=
 =?utf-8?B?QXpxUXJCSHg3UFBUaGV3V2ZpY3ozT1lnNTE3ZUQyeDBvVkQwN2VWdkZjelRI?=
 =?utf-8?B?bEk3Nzd0L0QxT21yeGNEZ0NnRmcrcFRUMUVMaGJHeitHNS80WnVZQWIvN3pt?=
 =?utf-8?B?WldnejZmVjYvbGhUY0M4dkxueVFnUVliUjNTNDZLanFzMnNuVnBOcFNkaHY4?=
 =?utf-8?B?bGlMM3orWEtUZ0c1MlkzU28zSTVvRzhsZ1JCK3F6dW9TaWpnQ0h4bE5COFBv?=
 =?utf-8?B?YjdvRU9CbGVZa3o5Q3duWXVwaGhlSlJHZ1hMYkwrb2xmNHpLOEJZWjFyaDIx?=
 =?utf-8?B?VGpNTGQ4aHNTT0pqenZBYjRuN25QYmYxU1Y1aWJsUTd3REdNOEQwS05qR2Vr?=
 =?utf-8?B?MjlEdE0yWjdaWG4rR0lVcDYwTVgvRkg5SzZjOEN5d1pLRnd2T3c4dzB3eFNT?=
 =?utf-8?B?WUZ2Q0ZxNGFiOWc2RVBhaVVsZEE1QWVOVlFiVUdNdHNrK2YxTFRybkhFcjBU?=
 =?utf-8?B?bVd2b05sdjR3Vzh2WW9mbDY1RXpxZWlNT1l2MDhHMVBjM1ZPRGFUSTZPV2RY?=
 =?utf-8?B?YlhSZGZ4Z3ZWdTZrUFFxQ05iMW94TXVTQWZ3Mi9HK3AwREZRSUVVeDlZb2hX?=
 =?utf-8?B?TG1zR2FYNVBlNjVjVnlLaEEwQ3dtMlYrRmN0OUQrdkVXSCtTVk85Z05NbWpD?=
 =?utf-8?B?MksrekM1cWNzU3c2MjVScHROUFV6dlEzRkJKSWQ1aUtrZkg3K2R1OVNQaGN4?=
 =?utf-8?B?RWFqMGxTVlNiY29uaGxzZTBPWmxMN3FweUVzVWpNeVAyZlVkb3RyRlpTSEh2?=
 =?utf-8?B?WWRvbEF3SlZqYWpqdDhVU1V2dGdBeFBZQmxZZXhKUDZSc3N0T0lvV0krd1VM?=
 =?utf-8?B?akp0Y2RRZGx2bkJlOHBDRnozTWpxaFh6UG0xZjlneSszYTJUR2c4ZWlTMHZT?=
 =?utf-8?B?WmxINFZseDZzRG0xR2JVTmpCR2RSejZLbERYR1NxZ1c1UGpmclhncytsQUI5?=
 =?utf-8?B?Y0txUFYxZnBKMEpFVnBHbjR3WGxUR3UrZWJ6Vk90N2JWSzh0YTJYaGdxT3Z3?=
 =?utf-8?B?S0R1NklJcWttU0dvOFZYdnRaaEJqaXhWSVZwc1pSMUlTS2kvczBOL0xvcVJO?=
 =?utf-8?B?c3ZMajE2cjR2ZzlHTlFsT1FoZ1ZBd1BiMFNJT0orcU52QTlKcm9zVXdYVXRn?=
 =?utf-8?B?NmtaWXZHSmxXZWJpNHhVMWhVYkZlVm9ZK2lzVm1nPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e557f8-9538-4410-fc88-08d8c2a33c74
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:09:22.3827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3TWLzaYkqPEJWojgmIW/0j34Udv6XqwBqU819WgBieWPgy/z07Vp92ImX8QRJesFnwjSx6SRia2wA3D5fh3lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4298
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 02:55:09PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Fix misspelling of "physical".
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

