Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F7E3A66E5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 14:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141413.261216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslzH-0005rs-6f; Mon, 14 Jun 2021 12:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141413.261216; Mon, 14 Jun 2021 12:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslzH-0005p5-2r; Mon, 14 Jun 2021 12:46:43 +0000
Received: by outflank-mailman (input) for mailman id 141413;
 Mon, 14 Jun 2021 12:46:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lslzG-0005ov-Fo
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 12:46:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d066a8cc-fa51-4fdb-87a0-31c513bcde15;
 Mon, 14 Jun 2021 12:46:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-PY6P7p6AO1-Ohb7iU8Lq5g-1; Mon, 14 Jun 2021 14:46:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Mon, 14 Jun
 2021 12:46:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 12:46:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0050.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 12:46:37 +0000
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
X-Inumbo-ID: d066a8cc-fa51-4fdb-87a0-31c513bcde15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623674800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sp0QWqMxrfWuXDLB7Yla+HCYh3ElKC2v7yyxRTEoow0=;
	b=d2hvYctsVDfTZm7uonU5wUzD+tvbIFGZGZexiwBjS3iZbgdV9WM28yf07jt4Yqe9hiyiPB
	spIBqyFqxLUwPG5K1qFBu7rFczlxf4mRN+3SITXAPQRFC9wo0F18cwOei+G0BkrfXoC1Xz
	/Kk7G5nsJajzGenHAdrxCQncRGt8EtE=
X-MC-Unique: PY6P7p6AO1-Ohb7iU8Lq5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTrXtgYxDuHfYcGyHJkYzRMsKGdI0bKmn0fZ8T4/EDACoCwf0PaAKSycoVoqWMrEYh9N1HBpYHP4DbDbcoeddBcnvFcy4k1XUMLsiDzgHCrSR6ki5WmblSN0p85JEGGBTQ0MOsG8HGRgPOFBPOMh7B4D0m5yTPiYNS4Q1eT4J0cFfuv7oQpT4rps8Vxd0gksYkcWNnZEDfTCSUC+VLyn1TbYXwCbDVTHuRlxyaafbGBBFBSfsy93UjqoYMOEmu2p1BxvAL9JonYNYr9WqMqxRnR0ZcwJz28sheWrg9kIdPUciEATsUUPrBCGI/OX7KwytQInpGNMvvtQACyVBm4Z+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sp0QWqMxrfWuXDLB7Yla+HCYh3ElKC2v7yyxRTEoow0=;
 b=STvqHVuUmNY2+mt261IJOCwwpu5/GlHCQRmVNfIxPml8f360Z2MTBSDn9TOoNBnNzsyMq52VxcWA/XErF6som1BPBMxYvsn5OVkIXVYRXY4EWyXAT6ogX6pA6yaHHAztQ7iNui5Qv0Zz9fW0i9+kvFiQRFrLBvRXp6wfscsA2tGCJybdy3D40Ay29C40p4lxrLVweUhsmPJHQLjd+CskiHTVCyNyfpI4yErHfdQLE2zgMtSEfRkNdiFGnFbfUke4Aib7WfE9BcBrX0Se9JsBDlEiIo8wuPk8ADEkTEWyJ4kBnVy6J2Xyid7OGtMRkFnXOAFVF6S6zutTKOVX6TYPgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/5] x86/platform: Permit reading the TSX control MSRs via
 XENPF_resource_op
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Edwin Torok <edvin.torok@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
 <20210611163627.4878-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <44de7fb0-ee20-0d54-5417-9964593b9e0d@suse.com>
Date: Mon, 14 Jun 2021 14:46:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210611163627.4878-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0050.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd8ebda8-38c9-4a0b-f061-08d92f327387
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3390E562713B8863564C17D1B3319@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:428;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	84zvowRRf9hrze0XkDs35O6IeQKLXqvIVIJh0tq0tQkU197NYOtiNpsu1sUb3JjiyhRTQCKUAyEo/z1/BowJ6XDrG+FAaJy2i4cKS2RMNvaIyHUusPJlQYGdD6MlNQaMWct2IwuvZ4msDfqep0g8flAQip10gb66vlgJurbtLh+8WWq5jt5jL1Acr+QKk8tGbosZBDavDZca7Y1n3+aLrGw0wvYuU++atBY9QTfgGFXnG2ouyGHHc5JukuNMAnLRWTNqCfp1DSGJZaCsSM1zi6AmmjZhIMl34lr5yrDbuVvDij60zqcQ8Qwn5oIpuorFDTk9Hkvj+iolC5ABVxMbJidWJjvFBS/3yCs0cyYu72tmYGC03OP3RQ/IzdOKGa5xRzlv/eKzl6aV3y+WTzIMBZHpwLJaO3WUpf6DPnWVC6Egks2uGWPq1dTLZhMAZWohKgD0gLXgdZAS7oFA4ulm/8bAt7Ul7V9ANRiAs1SpowskBE2ESi7gZk4mMekg9SFT+w5ZwIRconrtnSLJgr2Ht9ih1l4rmiWfTOZkSAHxL1vhGwtesmkZsCA/77uq4lD2onrP1M626o7Lt4X/0fq/WZVaHSA7aZkFVMB+0HDbgYB+9lHZk74O7gC2d4wY+fQF02eJi3Q8fDzBGA6IUb1D0f4I969j6lpwugl0dtJtWwMp3uZABv17vF8+U+VK/st8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(366004)(39860400002)(376002)(54906003)(38100700002)(8676002)(86362001)(2906002)(316002)(16576012)(6486002)(5660300002)(478600001)(2616005)(36756003)(16526019)(31686004)(66476007)(66556008)(6916009)(66946007)(8936002)(31696002)(4326008)(558084003)(53546011)(26005)(186003)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUEzS0wxTFI1THdiemF1OTNFZDZYekFldUZjMlpSNXdjY3BWcU5hK0NRNGVC?=
 =?utf-8?B?VkFYOU9EQm9EaHRibjMrTGxNOEZxeDBsYy9SRGlIS2FiNTJJZ2RUcWpqVzho?=
 =?utf-8?B?dGVrSkRxd1hrc29uZThyNUtyS2ZCYW40bWtSVEh3YnlRR0VUYzBNdWFoQTJa?=
 =?utf-8?B?YW41akE3WEpDdUZ3Uk01T044cHhmYlBPM3dBZWpFZjZSZ0RlMUJrU0RvZVlP?=
 =?utf-8?B?LzZFM0h1S09TZmE2d2tmSlliY2h6RXcydmo2VGhjNDFtVmZvbm9pL3gzNC9i?=
 =?utf-8?B?LzlNajcveDVtaGwvaVdubHZ0WVRPM0JpQUo1NzVmSVduMmEzNHQrL2psMEV4?=
 =?utf-8?B?TkxFbGY0dzF2REw0ZGJQd3VpL0ovWW9mNXdRTHg4c1IyYWlCTmU1UGtpWGdF?=
 =?utf-8?B?cHdXcFo0TjdxZWp4R0FsTzNLTDFXbkVoYUdQVWhpSHVGMi9JcGFIT0pPVS84?=
 =?utf-8?B?WE5yZmlIVEpoK3QrWWtHOXUrSjRUOW5xdkVNd1BPSTVBSlh4UTBMdVhyVHda?=
 =?utf-8?B?eGhJSFIrcEZ5MDdZNlIzUjZvamtKUDZNK0tYRFU4aVN1Ynhqbm9CTnRGQ3hm?=
 =?utf-8?B?N0lncmRvVitLQnZUM2gwZ1ZnZUtMZnpuRUJORFBsYWtnQjdSeHFMMHRNaURn?=
 =?utf-8?B?YUN5ZlRvb29MMnJEcS9pa0FmV0lyMzNmL2Y5cEsvSkoxUjNBVEllRmNCUVdy?=
 =?utf-8?B?eFhGRng2aVNsc0lRNy82NnBleGZIdi92T2tiWXZSM1BQc0haK0x2K2NuUkxX?=
 =?utf-8?B?KzF2L0hpVTc0U25wVUY4Q3pqOGNFWG44Znp6SUFqWS9PbnBsOWwrRVlqSEhR?=
 =?utf-8?B?ZEFaZjhZem1rZ2lFOWJvWDVodUNVWDBKR0R1T0dtbmxPRlNTdVBvTkFNQW5D?=
 =?utf-8?B?eHdkRDNsSFRnTk5ySGo2L2c4OUxSVE0zVitoWkZWVDA1YzV4TjFhMGJvVWN2?=
 =?utf-8?B?M0VITW5UNEVCS2k1c09qL3c3bmgweEFtNndkVzBPWmtaUUVZQXgyeC9MN2R5?=
 =?utf-8?B?eWhnMEZWRzFYRDF5TzN5OCtUQkl1YUYzR0FOVmR1VlJ3NnRwcVFCYlZZOWZI?=
 =?utf-8?B?WGl2Y0pDOXg1SEFKODlodEplRzNpN282dGozZFlSZXlOTG9vaTBKbU9jMUVP?=
 =?utf-8?B?VHVzaW9DM3p6cUhoTXlxdzlkY2NqMVNXa0VhNFdmYVZHNW92dU1VWkF3Vm9I?=
 =?utf-8?B?YWNaanNhZ3crSVhrYUxpS2RHWWgvQnZhMjd6Mys1M0IvanEyQnhEblZNRkFx?=
 =?utf-8?B?MnZ5V0NVWEorakJLcW9HN1dQOWdxZnFNL0lIQ3NiYzljcmxSZnB1OEdiVkwz?=
 =?utf-8?B?T2tvbkZuZmVzeVF2R2JOSDh1QXFmQVIzMUQyS3V5cXl1dTBpY0ZnNWV3TXhH?=
 =?utf-8?B?VWJtcm1sVlljdHhucHFkRlB5SzlsenU3d00wM2J2VnVEbEF0Q1p0elNuMXdO?=
 =?utf-8?B?VElhMTZIUndSbWVSZ25qS1hjQ25VV0VMbjNoTThQOGR0ZCtBRnB4a2o5NHl2?=
 =?utf-8?B?dVk2UTBvNGU3MVFqSVZPQjd5bTlKZ1cyWUVRZ3cyVDRBaUtOMWp0TUxqdU04?=
 =?utf-8?B?cUdrMTNOQ1p3SDRpQ2RnRkNITjdPaVBvYnRmWmpoa1NJWVRkZFFqUTBhejRi?=
 =?utf-8?B?UmpRWWdzTFlLUFZMdUFPSHZNMGplSW54MUZzdEt6bFBobW9RSnRDWWp3UEth?=
 =?utf-8?B?Y1BYeFVlbXJEa3VPYjdDR1RROGVXemtURkFxS2djOUl3aG9nMjliQ1ZiTkhY?=
 =?utf-8?Q?To5FJ5JfMYHKOL3YCdz+J3gABukCDCuSjBwNOU3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8ebda8-38c9-4a0b-f061-08d92f327387
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 12:46:38.3604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjwPldcekurlfcxzbOxxCzQo5R57Lf9BlJPaB/vW17XCPxqGP3wgE4RzHj97o9ld39j2k3eScO9yhkAd0zC0vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

On 11.06.2021 18:36, Andrew Cooper wrote:
> We are going to want this to write some tests with.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


