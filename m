Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF922F1A39
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 16:54:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65001.115012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyzWG-0007Sn-DZ; Mon, 11 Jan 2021 15:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65001.115012; Mon, 11 Jan 2021 15:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyzWG-0007SO-AN; Mon, 11 Jan 2021 15:54:12 +0000
Received: by outflank-mailman (input) for mailman id 65001;
 Mon, 11 Jan 2021 15:54:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kyzWF-0007SJ-3n
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:54:11 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 420fe73f-c77d-4449-bc42-df4bc186472d;
 Mon, 11 Jan 2021 15:54:09 +0000 (UTC)
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
X-Inumbo-ID: 420fe73f-c77d-4449-bc42-df4bc186472d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610380449;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EYGe5MN6pUDUeBzNEo53RRyGCrMx7hiVx5X1BkJMF74=;
  b=eBevGMDjSnBs3rMRxeAzyQhxya8vDahZIYe2vOBv/UiXqryzFDoboatT
   AKMdigk7ahNmPsjRrYiQAuRSn3mbIqWfURyORXoGk6ybPa6qkJRxU8zud
   M7x5i2hpJsGcUffq52wYpOzyNo7m+RDeusBAJyuI0aj5qUrxCFJe9ufyA
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NSofXCeq8HvvIsRmIRPGxEzNdZoq9oOOvZ5wfdBD8Hi+Gz7E3325qMMwSTgr2WTDmK1DQW9HBx
 I/S4dSyNTaoRqHWKA9v2J39x+SB6eACw9MclTTow4//Ln/Cl0BmB8Kv8mgBab1KButLNUXWn/S
 JGRfbNEcUc3QyKVkXZCaz6+Kbx5BvYpADQYCnrvbfU5DutfiEaYfQO2YpSOGAiGBje9rpt7rDz
 azBZORthS7pJt+gsw/0PJzLo4LvSalVjJ3Vln7aqdbunXpg9LHv4t7dmecgoP9dXaQL8Xqdksi
 JaA=
X-SBRS: 5.2
X-MesageID: 34836270
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="34836270"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCWmJewluCm7frydy+HNCy0RxOGONM9yX83sP9jp7wD3O1PU69yAtL0rLYXxOmCIDb3DKNj0takS+Mr8wIlQXCvyFK0cVXc3AMb8ndZbMEBJAwoHQkO0geRjxKUxFbUi9LKP5Xxcr+u+13X2WkChgCnf1THZH5YRhSHT1I3LuKl9UQ60agfJbScIorx9D9my55HG9WpXWNAOFBBhJAwT41s53TEKCM6dgODOEHpoeyVy5lL09ZQ9JJSPvoH1QaeBIVxI6fAIAnq2itb+HnUjZDqb+K7B/domHMaluFq59MnugLjQ22ABXBOTVoW7pJ652ZSustLKaydA06qi5X1HHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qw04JksdwfVOt54kfZ+MsW10b2wmLmGYgPdR2s9bAgo=;
 b=b573lk0fVEEw+yaG5hxnHNKxLfOvWDhqtVINpPFVePwMorGKqce8jetAuWLiLBykR+NiFEfppYUP0TwO4laJIPDxNx9QbXensLNMQPxlU8uAL5NCyBh2FfQLMSwxSpHDMcL/lIddMxE5wMm/PxZSENvcjgWi1ljpKDyPaRaD1/XbKzvaF+CuHYAc7cQS1yJmNLUffWf61IzoMuMqQM3rxR4Ww7Qs6Il80ynPP5A3pJumKn6uZXiScHKd/BXOZdVe47iGkyEvK/pW1mFcoqno8xeUmTrveTXG+cI7cWTacvxRWXm72id0880TVZDzoDr/zIZaP6wl2vTtSy5Y4uvasQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qw04JksdwfVOt54kfZ+MsW10b2wmLmGYgPdR2s9bAgo=;
 b=OXhnfbHDvsMnMotzVsrH/dWh0ZY+DPvvxXnS8p2mYZpzjX7Dz+n5keR8YF/sPRkkKQfOpL+XjWL9tEGJTdkIV/claxpS9yWdnGUS9+nFVCgqAUWFcav8euvPBQHWUfsH9CTBQ1jedjzivQOvPZwPRkye1i6WEqvP0ygqxXtfirA=
Date: Mon, 11 Jan 2021 16:54:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<amc96@cam.ac.uk>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Ian
 Jackson <iwj@xenproject.org>, =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?=
	<michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 05/11] tools/foreignmem: Support querying the size of
 a resource
Message-ID: <20210111155400.vnwrktf5hzat72rt@Air-de-Roger>
References: <20200922182444.12350-6-andrew.cooper3@citrix.com>
 <20210111152657.30868-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210111152657.30868-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0321.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52ea9de7-614f-4045-f310-08d8b6491fdf
X-MS-TrafficTypeDiagnostic: DM5PR03MB3146:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3146B282870FEDF68439614A8FAB0@DM5PR03MB3146.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4BqZehgaSuN5y9/O22QrMtWl8B3TqcXWlG9cF6BLXCs7yvZ9/ulhfhI1NsMX576kHQxUyu4x5HKHN/kf69P3pyHmt/l97jK9FucBvk0Go0f8/ers4GqJFY802e/+1eFq7hXx0PueHhqSAFkelSfcZDj+Xebe2lwjQYmaDKN4r/LL9gBjIYZHsMt+DjKczWEfVI7iwozq3mVV6PVxvT0Nz/MHeQ2KjuFS6WYfbdrUijLKKXBPemXORhUGevPSH2OeS1ATgKYJ05n98W+tm8DqUW6oqVnpmfjmqHwVShGlgl/PqDPsYKpCqrSGiPeEnTZMdG9M51nJw2YUJGHKTDrdFRVghGFO6dTmedZDAStrgjfDStEMPKk2ucsZgJQZ37IhhCMu3kOBkPMiHcyO9E3xzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(136003)(346002)(366004)(396003)(39860400002)(956004)(1076003)(6486002)(316002)(8936002)(2906002)(83380400001)(5660300002)(6666004)(9686003)(86362001)(4744005)(16526019)(66556008)(6636002)(6862004)(8676002)(4326008)(26005)(54906003)(186003)(6496006)(66946007)(85182001)(478600001)(66476007)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K2U1am1YWk5oQktmV095NnQwMGphWDJMY1VXWFZGaGdIZSs1eGMzV1RienNR?=
 =?utf-8?B?TWY5NU40eFJEQ21udU5xTjNHaE1PcGhMNmZVd2JrazkyUHpjY1BTalFYT3dw?=
 =?utf-8?B?djZIcXdPT29pMXBpUE5PZWxhUFVXQk5oR1RWVVBhdmozOVlxQU15a3V6bnRT?=
 =?utf-8?B?Z1BscGpZbU14MXZKeWJHVGo2SnRTVGljQnl6MUt5WDRPa0J4N0FxU0VDSUVj?=
 =?utf-8?B?QnNHYU1kSVdrOU1sZGM2K0JFTmJnMS9PMGNRYjMyaVhEWWd0VVdaa0RIb0xU?=
 =?utf-8?B?aVRpUk9YNFJNRU01dlVHLzR2UlQwSmVIQmd6NEJOSzJaTjFzQ2tqS0Q2TElx?=
 =?utf-8?B?MnAraUtGMktwdkxFL2IxYVZlcng0czk5MXdiVC9ESWZhRVYycGgydTg5emJY?=
 =?utf-8?B?Z3JVdVRkQkFXRzMrSUlqb042K01XNnRSdkxFSllKeWN3Yk82RW56QUlQcFo1?=
 =?utf-8?B?ZlZHTnhjQnEwQ3hucTBXbno2Y3lpVUdlZVBkVFVqSzRGb1duQzFieEVCMWI3?=
 =?utf-8?B?emZmNzRHTkdDNHV5T0lYekdoMG01Q2FCTlc2QytRWE9SOTA0NzR6NnJWZ0Fl?=
 =?utf-8?B?dmpjbitHdDB2ZkZjVFI1WE5HcXZyRElUMFcwTk9FK0Vvdi9nNjcwR3p5b1dI?=
 =?utf-8?B?eENyNkluSnRqcGkvV1g3RFd0bFhlN0cxeDBQT3pyMk9idnVUYi9xemtSTmVI?=
 =?utf-8?B?d1JRQjVKTzhRVFNxVnlHMnZ2bklKUmd5S2ZlWElpNDladDN3OXVKUEdZMGlo?=
 =?utf-8?B?K2NJOC9ia0ZBb0xlTC9ON04wcEVHV2JCUTh6ODEveXV4SHExd3hjbGx2cDlz?=
 =?utf-8?B?R0dLUWxqeUZPMUcrRkVQWk9OMmFYY2M3Z2RyNEdNaGNFMVZhQnplM2pIK0N0?=
 =?utf-8?B?RmZPTDhrOUFMWjRsUVR5UzVHNGhsOWJsSUNDTnlRT29YRFdBcUZsNjdoY3ZK?=
 =?utf-8?B?YmtQQzlROVBONXRYSjFPSHFqTkxiVWpPeVNpUDRyQXBlYWh4M0ptYkJnZnFu?=
 =?utf-8?B?OHlOVHI5V3FLRXBFWDBHb084czU1ODUzdXhsWW1mVFdsSGFRL0ZyaUlqYnVP?=
 =?utf-8?B?N1U2em04Y3dDNGxJcGNubWl3cURzWERkTmFicU1NQjF1ZW16MFhhazVWOWNQ?=
 =?utf-8?B?aTQ1KytKK0ozNVVZaGxBZ1hLcFN0M1lHRHhHblVqSm8wZmJBRFp6dXBJUHc4?=
 =?utf-8?B?UFVJbW5GZ014TlZYVFJhTHJ5bXd6QTJXZWpERUlJcWI1OGpkLytxMlhmRmJ2?=
 =?utf-8?B?TUZjTnoxRVJVU3I1WnFTb1JXaVdpZnRFSmFDZ2JiTGk5OG5MZHZheEhieUlj?=
 =?utf-8?Q?chTbta3OpXfTl8iIvzGzbAjawh84Phy56D?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 15:54:05.6065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ea9de7-614f-4045-f310-08d8b6491fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpOHWGYtHW9SwdJ+/aVKKEfMSyNUIgk5PqF2+Kdlg4DOzewX6GSMVqOEsq4sJjBYkAmBub0NHRSoQzDlGAXSVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3146
X-OriginatorOrg: citrix.com

On Mon, Jan 11, 2021 at 03:26:57PM +0000, Andrew Cooper wrote:
> With the Xen side of this interface fixed to return real sizes, userspace
> needs to be able to make the query.
> 
> Introduce xenforeignmemory_resource_size() for the purpose, bumping the
> library minor version.
> 
> Update both Linux and FreeBSD's osdep_xenforeignmemory_map_resource() to
> understand size requests, skip the mmap() operation, and copy back the
> nr_frames field.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

