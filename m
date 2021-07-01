Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A443B9111
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 13:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148630.274664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyujK-0007HM-1i; Thu, 01 Jul 2021 11:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148630.274664; Thu, 01 Jul 2021 11:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyujJ-0007EX-U8; Thu, 01 Jul 2021 11:19:37 +0000
Received: by outflank-mailman (input) for mailman id 148630;
 Thu, 01 Jul 2021 11:19:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRek=LZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lyujI-0007ER-3R
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 11:19:36 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4acf82cb-6e15-41ed-b175-bdd9967fd515;
 Thu, 01 Jul 2021 11:19:35 +0000 (UTC)
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
X-Inumbo-ID: 4acf82cb-6e15-41ed-b175-bdd9967fd515
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625138375;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=QNk+aQRxXzhpWD8DJgJK2eEl3dKt+LtyV24JvxMfyak=;
  b=J0vFS9WGa17ivU79sY7N0f60OuAh59eh1vrgXZQ2yw3TQUuIOHUQqMdQ
   wgqkTLmyyhZrHQJJgNjjw/leXaT6vG7yFGY1Vj/wHbhZF/9CbNfXYP2/e
   gapjQ9fh6tDekApqX2SFqdMbjgZn8bbHV2+TOhtXMGpJccTWHMoT2N++i
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PqilrLgr1TMgFGVyEJrz/LHvpEtxIAuTvH7IISt0frdnVyLRolnwk8kW2WL2xIXaFQ9zG5DTCc
 pfOFX5lDTo1ZFj+BKSw/bIrdjW9UE9ELyZ+rmcnrTk3SZiM7yDlNC5BoLglBhMrXrGUih4O5WG
 5YkhZAq2vTYZTlr/YoVZOs/Ve/v3iUZNHgJ0nbLcnnBLwo6rAgbK9mchyvc4R2bu2GUz4h+jpX
 BPNye/QGX5Hp739xO7IjBmnGCMCScWHO6OnZ4JeYZlWIGgml5vu7VCqgM71qOtzR2/gg+/uDUo
 mPo=
X-SBRS: 5.1
X-MesageID: 47359628
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Wb35+ansY0b5XNqHBc2tMp76svnpDfPaimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVoMkmsiqKdhrNhQYtKPTOWxVdASbsC0WKM+UyZJ8STzJ876U
 4kSdkFNDSSNykIsS+Z2njALz9I+rDum8rE9ISurQYZcegpUdAF0+4QMHfqLqQcfnghOXNWLu
 v42iMKnUvaRZxBBf7Ld0XtEtKz6+HjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0ihj5/T/c2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1QcPhb2jf0RCWYsBHt0w7v3HIF8Hn502KVhnPlvIjQWC86I9Apv/MbTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uPp2Y4m+J7tQ0ebWInUs4VkWUjxjIQLH9ZdxiKr7zPUd
 MeTf003cwmM29zNBvizy9SKLXGZAVAIv+EKnJy8fB9nQImxUyR9HFos/D3qE1wvK7Ve6M0k9
 gsDZ4Y4o2mbvVmJ56VV91xDPdeNAT2MFvx2TWpUCra/ec8Sirwl6I=
X-IronPort-AV: E=Sophos;i="5.83,313,1616472000"; 
   d="scan'208";a="47359628"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLVPvGC/+I4u7z3fPaFbPGIhSxMLIKQBzOeIOryKStZy4xuvQ7/GEgiMg9G4eqcMK/HbPNUMraIJWc+b4IxYfxIrsSXYKrugIujkqCA629M5SSryAesxhzn08QSJ52QHo4WCarrP53zEkQDk7/vS0eh4eUCh9DPkviIN8dOHjrYzXymCLFxXR96SjTphsO8/PA5Mq3R9+r9emG6iCoCN7/ytZEmAelBn6r3iwCKRWac/RtXT4hhNHhMIsfjxHJd6yaSahiOTBVAZ0kmPQyquB7HhmJ2F5538l+fdMlRzH/d1v9MoHu9Bug5JH0jmdWiQDrg3RbpNabrAmT4ww96DUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNk+aQRxXzhpWD8DJgJK2eEl3dKt+LtyV24JvxMfyak=;
 b=G6jRGKX2UBwoczsfrYgdjrwb/bsaATk7QFBEKUMhn4gMPlOAFDgNyWk/hFZDNTU2f9LNlFxXfAwXW7FETEt8SsQEpzKE10jden9/UEZk7tGYwymvHdngniUNV9TslZ3i6CpBP7l0C9PNmfPjSYyjcnuXIitFhKGSlqW1YaJoRCc3XNdXn2r0n1iQfi56bZySOZtTdrqFQTVCCqOzoAL/qskrT9wuBso16I8BneB9eu6m6FIderZnF/yC4z92lpDkbrJpGRZCjPqfM6dTYkaJeoiDGrw1h6Vfq0OMUhTQAPV6vX1X8jekifoDfMGqelJZisq/GqB9nfO6Vm0bxv5jGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNk+aQRxXzhpWD8DJgJK2eEl3dKt+LtyV24JvxMfyak=;
 b=r1q7EkHk4cHhXbaanPLT5JZuq/1PqCnjsFpD4ozokQGDO8EAlUC75MjwWQfSrBNfPBB3fAf5O9myCaePgM95TfFrjllP2C9v+wjY7S1zKAroo0TqJH2NyPG5yP+FL6jUM/iQ3r4Z9dtuWO3oo/UnkNpr3GOFEV28iqAMnsHg9ws=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
References: <20210701125623.593fe3ae.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: XEN_SYSCTL_cpu_policy_hvm_default truncates leaf count
Message-ID: <20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
Date: Thu, 1 Jul 2021 12:19:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701125623.593fe3ae.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0461.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdae81e4-c57d-4dd2-ba8c-08d93c82185c
X-MS-TrafficTypeDiagnostic: BY5PR03MB5078:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5078DE3E38FB1C8851D502EBBA009@BY5PR03MB5078.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HLPSbBFfc5GuCT2D6+ShGQcV65qBligUPvR5dh0nvLa8oEenFzdRU3EKhzmBXPdc9zNiSaZ1lCBWSjvGe+C2nB6zYz3344niWIX4ninMZ6+u5AaWNhni1o+ihQpMCvj1LJflGknis0c6y0wGIG8DH2h8SBKE15PYNGdYbFgWkum6VsMOYO9eDeh3kxE/bwfk5LnPMSv3SbhMneE7EfiV6Cplsz5+Fm0BTAH2MHidH1PMqnrtEWZHjkGbHtxreFjdLL+AxH34kalO4QK+P1lO2k6+CTDWBhUTfyuINHnlM2RvtrvgMWi1jtk9wqQ3kahE9493GrX6ez8SNYl7v8koD+TgvM87s8e0I1VBQkqLcgNEnAJb/WLhg41S624wTS3zhOYcTWBDFbklbQ6C9VSMFSwoa75V3iAj2rhAS00LOOJbOTb/+P+dbIbBLiEekKr9Vo0onaQptFJULVvsi7/QYBqo3rCoe0T1S876ISwabGHt1Ugk3uxUGwJiv9qFiTBPvNzsTxvhDbeGKwTMr2f9z22rzagaCmPHLOfkenPKOeGQeZJfd5OegTnYg47Q093Tz/9NDRZIKF+fwIdc/TRcWJCGmDFucmcVeVqwKYNyd0LkRW8u1JkVYyIdsE7qXsfX33gkSugUmzDuPizV0PPUQtVm4U8dA3XnwKUBpgFBx8oCqnL6CSotOpueZ6nol0TYgrP0HCGllgtYDDR/+FMHfEirx8jPtM0yvZYeSpB6B1NK92NQzy1DivnLa+7CMi4k
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(8936002)(956004)(6666004)(31696002)(2616005)(186003)(16526019)(16576012)(8676002)(86362001)(316002)(31686004)(66556008)(66476007)(36756003)(5660300002)(66946007)(83380400001)(26005)(478600001)(53546011)(6486002)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?1mqasmpYFXQjRP17cqCC0DEbipN8BHSjBOtsAvU6xH+3DHY7rDOctxYK?=
 =?Windows-1252?Q?ijpfHvKhSiHJej2eM3MF10fuAzPOhx8fgcZWlrflTvWyoj4Lrcbgf62N?=
 =?Windows-1252?Q?v/iMQbjSXreQQqz/OSlq0LQLUz4QMDQvR4pgRLQWlTYqlIsxdVuhMAdB?=
 =?Windows-1252?Q?fcGnEKD6OGC9DaDyez9NI76YcbGFcNzQGaWO8MYAnugVykGaDlTFn/oK?=
 =?Windows-1252?Q?FCLz5lmpYo8YL1Lows5GI7Sfd8jD1q2sLjn7z5zpPlXtiM9QpS1GTLDn?=
 =?Windows-1252?Q?3jcFHD42f9MWlH3FmEHyR7KoJnYxd7VYV8CBuN3fmzCfCWIcO289iT9h?=
 =?Windows-1252?Q?PQ03rCpa17NrXAyEkRaPnvR6GtkbyCK6ASOwZPvJICOT90QBwr+x9xU+?=
 =?Windows-1252?Q?LSH/LZRYNLzODTH+RuRv96bXUabDoLRWdnvNdNkZhJtJyoAB2ymHNxb6?=
 =?Windows-1252?Q?l4KqYUpqHqd+j1RrKET8mWyd6L3PYq5tN5CUBDEpCUgdjN213tKOA5LE?=
 =?Windows-1252?Q?NqI/3NJF4vzNuD30Rvcu5isHZTu2f5N+xQkSdKYRdNqBRTkO6vv2DTyA?=
 =?Windows-1252?Q?JZbEEMaLe1n2gamxlUIT6oQwkWB75Y/nKzo+d306B70WNFf2uVGxreXZ?=
 =?Windows-1252?Q?9oJ/rIB+HSPW2jzh5WKsG7tnAuS9rDXKHS5ddVVpjNNKEMIZxnk6sHsX?=
 =?Windows-1252?Q?tl7ItK9tEWs5rEdzDRCW+dlUT95Nn4ppAzptiCXXEFGHQjg1clSXaXC5?=
 =?Windows-1252?Q?RbhMNJm2xHJqQXhtR3oQSJeVMTvmKvVYSxF3AupU0V188HYhEyau35Mu?=
 =?Windows-1252?Q?Tlv4cjzgNEo92foswatWIMvbCmDAzb0Z1umqEA6P6fSBVbeRnpUw4igC?=
 =?Windows-1252?Q?aDrznjakEpLVBKQs3AqT7aqR6oToOxiyYF48NYbol+Ko4mf0MZsaYnzE?=
 =?Windows-1252?Q?OhvtyVETQHC3CzRMTArVT5NS84oCsAkkXeGMtgWXPZyL/JPDgQdtXr09?=
 =?Windows-1252?Q?4/lwstqVgZ/0n+UrKWJD4HzAs2AjR6r5Q6GHc9vsGCFPByGrQco7fWM2?=
 =?Windows-1252?Q?v89d6dY9CmCtqEP6uje7REeI8Cz4qdc14dgPd6H5fJT008fOzPd8h/5l?=
 =?Windows-1252?Q?3AfDRPKXTHvYJK3gDfR1Hz9aZI5QnOjcmdLJpOLyPiRLOqLxHXb8UOXT?=
 =?Windows-1252?Q?HsPGPBRnwI6Aai+ppto3UWMhOcdpHE0pVKt2A7XLHDJpERoL0nCNN7pN?=
 =?Windows-1252?Q?TneVZRwHGX9jt/aVsd//VpTCcCbYv8nbJ5E2PigSJ5KrTtneRo8VPUvp?=
 =?Windows-1252?Q?C9ciwFVyrFxVRm5rCreDHKErfhjTqSFW5mNUsbDkpScHjeaUGK8fodpw?=
 =?Windows-1252?Q?wKtSSlt1/rYlKkva1oYyxJGsPjmxJ26NBIKEAHdixWljBvl+KZ35QkaP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdae81e4-c57d-4dd2-ba8c-08d93c82185c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 11:19:30.3600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZItATBG/H11RrX+qDqMB3qJZOcqulfQie7JvDUItxnd7V1NIEQiP3ByjHWXglQHBtg7nlMUv5JUAdlZasJV7nuOZY/lciRX852i4lPs9Liw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5078
X-OriginatorOrg: citrix.com

On 01/07/2021 11:56, Olaf Hering wrote:
> For some reason migration of HVM domUs from pre-4.14 to staging is broken=
.
>
> It seems xc_cpuid_apply_policy gets nr_leaves=3D119 from XEN_SYSCTL_get_c=
pu_policy.
> Later XEN_SYSCTL_cpu_policy_hvm_default truncates this value to 31.

119 is the maximum number of leaves to cover sizeof(struct cpuid_policy).

But no CPU hits both Intel and AMD max leaf, so we can unambiguously
represent the policy with fewer than 119 leaves.=A0 31 is the count of
leaves with data in, on this particular system.

> As a result x86_cpuid_copy_to_buffer returns -ENOBUFS. It would copy up t=
o 51 leaves in my testing.
>
> I suspect commit 34990446ca91d9e201ff17bd4e3f43bfe3ad308e just revealed a=
 logic error somewhere.
>
> What is supposed to happen in libxl__srm_callout_callback_static_data_don=
e when XGR_SDD_MISSING_CPUID is set?

One of the many totally broken things about Xen migration was that the
guests CPUID data never used to be part of the stream.=A0 It was always
reinvented from scratch on the destination host.

This had fun properties such as the CPU's family/model/stepping changing
underfoot (I'm still amazed that VMs didn't complain more about this -
windows would happily install a new HAL driver and call itself done),
and less fun properties where some features just disappeared totally due
to changes in xc_cpuid_apply_policy() logic.

Starting in 4.14, after I'd added a "please get the guest's view of
CPUID" hypercall, the CPUID settings the VM saw move in the migrate
stream with it.

XGR_SDD_MISSING_CPUID is the signal of "this is a pre-4.14 VM with no
CPUID data", which means "you need to reinvent CPUID as the toolstack in
4.13 would have done".

This *ought* to be "grab default, edit a few details, send back to
Xen".=A0 Where is the 51 leaves coming in?=A0 Do you have cpuid=3D lines in
the xl cfg file?

~Andrew


