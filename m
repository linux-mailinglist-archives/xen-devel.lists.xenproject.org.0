Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B633064DA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 21:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76397.137845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rEK-0007oV-9v; Wed, 27 Jan 2021 20:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76397.137845; Wed, 27 Jan 2021 20:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rEK-0007o6-6f; Wed, 27 Jan 2021 20:15:56 +0000
Received: by outflank-mailman (input) for mailman id 76397;
 Wed, 27 Jan 2021 20:15:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csCD=G6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4rEI-0007nx-Jf
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 20:15:54 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efe0522c-2695-4882-9c77-3931e31c4df1;
 Wed, 27 Jan 2021 20:15:52 +0000 (UTC)
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
X-Inumbo-ID: efe0522c-2695-4882-9c77-3931e31c4df1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611778552;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zs5hlTZLVO/5sJ/SkvUDFkRpO2ve4gNei2qVxDLRWpY=;
  b=RD6AVfigQ2HQVYDQTToIwf+ViH3w4L5Ab0/fp7d55gxapl515vCqIrkT
   3IwNUb8CeWq3VVQFfOdXWD8SyTSaPqpSvYY0xDLftuA8seUofDC7dDcru
   4i14/CycKGbJOds/nmanvQi6SwCPkdAOsVgRIFigWkNl7ztRG/8SZxJ5o
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7pHzepfejCo0F5NUOpy8fdM25tnqkd6GggDfkYNz2nUTQW6c7iTvIP8BBhEJHeUTrEtOUAX5ea
 VNR2iUrJErez31nj5FaAUypSIOj6ATgrjollUT47tQHT+TTeh5WqjhBCPe29uhTyjwMq8R3Lvq
 ZbXBRFiq4h4MEKPoaWczVA1zzWkUM59M2zh+0AwhinNDNyCZIkty6E8bX5I459/LgaD0OWinfw
 TNcSuxEqe0mSsx7G+4YPU1QnAAMNRJ7JRSNzOF3UWz7ous/cqbpBPTYutPgxwUdsj353zoyMFi
 O+c=
X-SBRS: 5.2
X-MesageID: 35958551
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,380,1602561600"; 
   d="scan'208";a="35958551"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejUto9QdQT0ukJxMhYVsy7aTFp1PCZNli5swmmsg3oh6j8zuyMzi3eealqqdD3asWo+HqoiYsqJT3iz5dFBnakY97M1YsP4h79C/SIPMP0cwMSWF/Wv0lw7X9fp5T3N0ezem9QlwzFU1HQrvVa/D4Jnq/EzTwuPuFEctOaXFf2lvI5XKoR9x/mHISlYOHy+FiulWYOS6ejLRC5k8llj9siGQDoAeW7Q5OpQzbC5rM/7V06CYFCkWYLo+ui1pyYEYGvsmSTQ3NgVHlIjAr123Vdmruds1y072FZJ7RwjPzBZoTRmIJeibp3E3GZezAWzDBa3vlUJ6hJ9MNBgV0MKwfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zs5hlTZLVO/5sJ/SkvUDFkRpO2ve4gNei2qVxDLRWpY=;
 b=MJIkO4nCZ1CyZ+HPC57oeUfUljP+XWynN34cHzvE2FnFUHXo81xYkUvFE/6RCstwj5IcHJ8eBqPFXKNcjzWIlao5cnlMcZnDwLfjmARhUZoM5hkw9fU2AAPNnowHRfp9yxid4hGTcXt16C+VT6Ov+V1RJ8rQrb3Itf61VFD9uQdqOPDECTlIJLE1UjjJLPgNewfTydWp714CdHhP7FCRptte/s0Xqe6t6CH+xkmCm1YlnLXLysCHiLuK7Svv6Kp0wfMsEeIiwjIwMmC+FLu/7hApmhqgtHdxhgTP7gKH8pj/tOop1sNk4eA7rednxP5lVtot9SbWBSMLWGasulQcWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zs5hlTZLVO/5sJ/SkvUDFkRpO2ve4gNei2qVxDLRWpY=;
 b=Yxnv5vZUsQqc7XKUsqStG6sTBptFzovduJnEuYZHv8kELbOmQ8bt1iR7kaqne/GXP5u0HgOT3tNgNdaRbl34djMi+QqmrMYyGcsQq8waX/uTgvDB8xlMB2/PJlAaEsNyN7K+Jfyi75kojvXQZPsxgBeWe0NzpKQyZPRjLG8G+H8=
Subject: Re: [PATCH v2] libs/foreignmemory: Implement on NetBSD
To: Manuel Bouyer <bouyer@netbsd.org>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-6-bouyer@netbsd.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d7298f24-1146-0995-b9fd-fb0ecb601f26@citrix.com>
Date: Wed, 27 Jan 2021 20:15:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210126224800.1246-6-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0324.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::24) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14439c74-39d4-460b-64e9-08d8c3005626
X-MS-TrafficTypeDiagnostic: BYAPR03MB3605:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3605F3C6E63E1BF5FE13B1C8BABB9@BYAPR03MB3605.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q1qA34e9rPJyziiVwHYkjPoHQPxcc7JT1KwxfXBJGFvzJezyESYvhdrha1+LBzMf2p0TH7tkyn6qwpv03NLzmsqoDazH+qKgC/YH16vk4z7+iakXNjK2AFkBw54+66qTM50DsNS246kYWauUQr1l6Xvoo2xdtut01Ui8r+hoTGCa0p7+w4XGyrrMidvu3xoTb8viC56mnon/lRCraqjc7qZVi0DFzRk8eleejBbyXD3BUvhhYlEjwRuTg0QJfRmQ4jpI/9VULfB8qW7GTxj5lDu+5Va/uTYoQe7aZdGud91hOcN43nHA95h7gK7LbuVnsrsFSvoUymUS9n0383PWKaJs8MKn7sJZgnqc7CfS0uGcRIBP24NCW8gB/J8leOmBjG3/8+LvS3gbEhPwU969x+zzn35mFof4AP86/xbGjo5fNhQsWQPMaPSZjqOvfaIkO974nttl1yWwno6cTn+okQ1coL49IAw3y2f3q/rpr4J6xlRP9gF14NCpk95rSHtNj1EDbdjWGYmOQxYC+HV9Tlf8xgc2z+6VfmtD8fPTp18VRECDjQ8hWb7T3eWEHZ/VCNKVGR0vofCuMCbWvaasslze3sOb9wEFA+ZFHESkGL5JsGbVpRHafrZGfq1+CI0xxi5M8V5TDyLxhd3u6I/3BFz5e7mK4N9Kjg1vo+MxsCe88rIRDORiirJGYba9hvdJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(53546011)(6486002)(966005)(5660300002)(4744005)(478600001)(86362001)(36756003)(6666004)(16576012)(8676002)(4326008)(54906003)(956004)(2616005)(2906002)(66946007)(26005)(186003)(31686004)(8936002)(66476007)(66556008)(16526019)(31696002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eWxRY3U4VkMrb2c3eHJQWDFRZ1h1ZlkrMmppY2ZoN3JZYmZJdzlLTkVML0pr?=
 =?utf-8?B?SVIvcm5wZkV6Uml5S3B3UndpNkoyOHdtSWlvRGtUWE55a29EMFFUamVTeEJp?=
 =?utf-8?B?QjBTVDRVU01nVjF1Q0NlaVRhcFYrdFJQSzhTZ2ZsT0N4SkhQenZkTndPTVlU?=
 =?utf-8?B?UlpUeE5HNnU5OTFkYmNUODBFazg5MkVRWUhCb0xlMDhIYWxoY3BSM0dUOG50?=
 =?utf-8?B?OWdBSlRnS1RtYmpsYjMwSSs0TGhBTkgvNjYzQUg2UDNiQ3lOR0prTW5jSmpM?=
 =?utf-8?B?WHc2M1BpdGFzVnhMVms1ekczZ0I4d1U4SmUwTXR2eHdPUFFVa2d1d2VRTUV6?=
 =?utf-8?B?N1NwT2kxV3hoMGNuOWNhVG5ma0RETGhqTGZpeW05NmVpTUtWQ3pBem53bGd1?=
 =?utf-8?B?a0pnaUpmc2ZlbTJqRTBpN0o4eWRCRXBGRkx6azJ6ZGVQdG41NFVMWkN3UVdx?=
 =?utf-8?B?ZG5NV2VOWW5WMTFvakpKMTI0eXVTZG5LUzhxNXV2QktMY0RYSnhla1N2TTN5?=
 =?utf-8?B?azhjdkZmZy9GNE9CbVMxVEFla3ZuQzBrc3RIUmJ0WFhhekJJdHpaL2h2cHIr?=
 =?utf-8?B?a2djNFdCTDRPWjcyTzU5cEl4bGhGZG43N2paR1VOY2Q4Q0VDcldXK1FEd0hy?=
 =?utf-8?B?b0pwTW5hKyttbU5iRlZ6Y01qN2IycFBQUzk5ak1La0VnalM2WUJMRXRzTGJ4?=
 =?utf-8?B?VWtENmhTRmtMbzRRVnBYUkxFaWVWbzExQzEyak1VTG5FQWF4L2F6SmdvQ0FK?=
 =?utf-8?B?MncvRDFZMU96MkRva3UrdkRqQmo3Q3lVWmxXZ1JOTGNuU3RCV21ncG5iMEE0?=
 =?utf-8?B?NnR6Q0VydzZ2SHRFMGEyK0ZNdFRqTnNHVlRoTVRramFKbzlzZWRHdk1ZZVZM?=
 =?utf-8?B?dGRNQzNZZWNxVXFaZDk1K0VrUWhJeG5tdm05QTBPd0pZelZFME9ZMHZnTzVy?=
 =?utf-8?B?dHNuWDdNTEd2aHM3Nk1EaXU3d1FORkUwbUtyUzlyeHdPRUVYdVdDdE5LUEVK?=
 =?utf-8?B?RVJscUkrSVlCdmd1dGRMWUpMSzBlT3dlQng3OElZcDd3L0E5MzYybkZGWGpk?=
 =?utf-8?B?SEtkaHpMNm1RQzBjOGNvalMzVy9mMEpGQmhYbUpucFpEbHpkakdtelhySGl3?=
 =?utf-8?B?clozeVdvQy9EV0I2aG5VYWpKUDFneXNpVUJTeGx6OGNIU2l0N3MvQTNPekFw?=
 =?utf-8?B?UnJtM21mbjFoMFlObGtpY0xLUnVtR1F0RWtIRldoMzU4TUUrK0NCWDVxM1Qw?=
 =?utf-8?B?RFY0dG9TQ1pFWkwvOWFSSUhKYzZDMlMwVW9pT0x0bTZUclpsS1FFUXFJQ3pK?=
 =?utf-8?B?SHNnQnkzM3lKWXRTNVljUTJlQ09KRG0vN2diTmN4MW81QjJOWisvRzlnR05O?=
 =?utf-8?B?cytIdUhMNkh6MEJJQ21vZlZXMVhBNjlDbWhGbDl6emNoTGJ2dzZDRGk3Ymtz?=
 =?utf-8?B?WExJV1FNWDBTYXZSblc2ZWZzMHY2MGpvT1daM1NBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14439c74-39d4-460b-64e9-08d8c3005626
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 20:15:48.7447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUKoVlijAN6wuvxlguBUmwsMxdDADiLVwWcSg+KDtp4PCiOBrNvMjUcKxBib3jBL1hWhqoIfoouhx9bN6dOwPL932bL6aQqIwLabUVCOlrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3605
X-OriginatorOrg: citrix.com

On 26/01/2021 22:47, Manuel Bouyer wrote:
> Implement foreignmemory interface on NetBSD. The compat interface is now used
> only on __sun__
>
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Just as a note.  I've also got a bugfix for this library (as well as
every other level of the stack), which will need an incremental change
in osdep_xenforeignmemory_map_resource().

See
https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=3768453802baece85140e579814af9c27f70d99a
for the details, but you may also need to bugfix the kernel side of the
IOCTL if you borrowed the FreeBSD copy to begin with.

What is probably easiest is for this patch to be committed first, then I
will rework the resource size fix() to make the same delta to NetBSD's
copy as Linux/FreeBSD.

~Andrew

