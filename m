Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE8E3462C1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 16:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100720.192062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOivj-0001fO-Ey; Tue, 23 Mar 2021 15:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100720.192062; Tue, 23 Mar 2021 15:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOivj-0001f2-Be; Tue, 23 Mar 2021 15:26:51 +0000
Received: by outflank-mailman (input) for mailman id 100720;
 Tue, 23 Mar 2021 15:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOivh-0001ex-N0
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 15:26:49 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 995d882b-a488-4b4c-9cda-8054e4e5b5c6;
 Tue, 23 Mar 2021 15:26:48 +0000 (UTC)
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
X-Inumbo-ID: 995d882b-a488-4b4c-9cda-8054e4e5b5c6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616513207;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=K3jiB8Jq8Ewe0wuUKuznGRdgxgyNjqysvIbPIwPkeHo=;
  b=ODv8zzlmhvYukOe5R2D6bggz1/couFBjar0S3kbhjlLOn78t33EvuEYp
   8XI+8X2LTGl/1UmigPLvr5G8vXIOFF/vZNG8koJB1mYvFPV1al2Sid4wS
   NCEY0pZCtSNxkp1abCgevrJFSjycv17KzeHo0XFU54ffLOKN4CT8UyNdi
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IUOLf2P+w7dqzumy+4siTHwLrFm38JVKwl4cGX/efiZz6S/s4XpUw11uBjiI4Bx1mXrJiAwwRT
 ohQMQGaiUNJM2BK4dRSWeF/qZ1E365sbnXWPCA3fqyaXdlCB2K7Nlj+iYoBOGBU+uoqQysvup+
 0hJE1DWy24y71gRQGPCGlOTfbIT+BrpNpD5pnlK56aOe0kZgbpt58ocjFoyi8hyMy07No6dQfv
 EDiFOc95Tfz7wnhgjbbUd2U5QSueCZ8jrGAQH8BH3ira8C+hTMpEFsgo4gN6R6XUJWTlVzYSXb
 6R8=
X-SBRS: 5.2
X-MesageID: 40294574
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jSDoq6HcRiRG7Z7SpLqFG5HXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrSxrnlaJdy48XILukQU3aqHKlRbsSi7fK7h/BP2nF9uBb3b
 p9aKQWMrfNJHVzkMqS2maFOvk6xt3vys6VrMfYi0xgVAR7L5xnhj0JaDqzNm1TaE14CYEiFJ
 yaj/A3wAaIXXgMdMy0Cj0kcoH41r72vanraxIHGBIrgTPm5V+VwYX3HBSC0hAVXykn+8ZGzU
 H/nxHk/aLmivmny3bnvFP71Yhcm9fq17J4daixo/USQw+Mti+YIL5PdpfHlzAzreGp5j8R4a
 bxiiZlBetfwTf8emm0pDHkxgXv1i0/gkWSt2OwsD/YjuHSAB48FspdlaJVGyGpmnYIjZVH/4
 9gm0KfqpZNAhvLkE3Glqj1fiAvrGWYiz4Gs4co/gVieLpbUpB9h8gj2XkQN5E6ECfz+OkcYZ
 RTJfCZ3tl6WxendXzD11MfuOCEbzAIMTqtZFMNgcCR2yg+pgEE82IogPYSmXoN7/sGOuJ5zt
 WBNqxpkYdHRdMNYZR8A/8cQdC2Bnale2O3DF6v
X-IronPort-AV: E=Sophos;i="5.81,272,1610427600"; 
   d="scan'208";a="40294574"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NrfDkXTRTDD5b2dUY9Wb4uokYr8DNJ73CSSicbLL8tl24xGaCxYN70iDQIkyC7FzNg+dAIyAPFdmKm9md9t+i8wwoCMrtY2PhdFoifX2sqQiABNSbTBkU4wYM57K+o3gSA1D08LtkFQHK+TejWeIiuj0xGbgCw5KzAe6jmhmY4uPuA/jQgViWn49s1SeAFQmfjhGXgmuEBSc5giXU6GLgbUlZVvdJPKos/vs6QvuM7YoeULpWWMary8wlnkgh0dWsKOiaxvpqJhMeS+bcjYsseeYREyI1AOvaIT+Ev+jvE2viI0ZLG/zakfILNWzIKkFZ0W0wKAQSeSQ7/ZXLdL1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jy3yDcKswrFvrBEobQc0Ogq4HkkDpnep69HnFYT0CiE=;
 b=CuB3pBPfoyw6oiWU+0w+AVXd0SJErrDVxyzUdOzngkuoxw0hAoW7PAVzmJ5zo2Pii4EWJrQNrNlXa7PyN+EcbmfnJvQ5C0KsUAE+zDVsEwYkc9UrGh6lUxc032Ml/oGZ7JUfidsZ0vNP9FUWT4BW1Xky0gjwcPBvomEBkOKxMlq9nLj87YYrcYx96tw+Zo9UKZ55WtJoNKyWCiWTomwomhr54yTBsBdzkyrJyUXFhvOHt4uHejEdohguSqGg27h88OSByB1zQVCeeG3Ly5U11OfSwIHh7wjsaRGkQL5/oPiU5hugKddimIu86LQ+VGRzZh1KfTSwCUjSQusnQArnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jy3yDcKswrFvrBEobQc0Ogq4HkkDpnep69HnFYT0CiE=;
 b=Dcdjy8Scnb6DTQnnrvoJRvo6E5J7lciPRfWfmWuM71M8v5VMkudw3SUVN2TpilxxZAeuYgjQRhtA0xFlO5clscQM9Uxj1QzRnr2+QdhCSAisIcxeFxk56sMETMiM6i3FTNSIp7/0AlHcl6ggiki17O8c842UuJVuBJkwEX+hF6E=
Date: Tue, 23 Mar 2021 16:26:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <committers@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?RnLDqWTDqXJpYw==?= Pierret
	<frederic.pierret@qubes-os.org>, <xen-devel@lists.xenproject.org>,
	<community.manager@xenproject.org>
Subject: Re: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow
Message-ID: <YFoIrExXI96BSduD@Air-de-Roger>
References: <24666.1682.595069.435575@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24666.1682.595069.435575@mariner.uk.xensource.com>
X-ClientProxiedBy: PR3P191CA0056.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df6bfdb3-9062-496b-aeb9-08d8ee10108e
X-MS-TrafficTypeDiagnostic: DM6PR03MB5339:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5339F2DA87D958DB624D3A768F649@DM6PR03MB5339.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/l8KBoJPIednvgWtSwqATV3F7///xxEwZiXBD79xVIjK1+5g3oMO0geDQq9ieNtApXQAiYf6in5MUrp17dCGjFXmJl1MN/8UVDYr15vS/qPQsBr7VJGEf05UZpGtjgGMHPWzH8kr9Sc4FeEtbYqFi/30ppzdIiGpD65Cr6v9vniXqBH2T8Eh8oka6lijbW0zAQSF5d3Yy5gwyMheNgZ2CvVtXqtqzsGmsqW8Ru3E64poOLput08Z4D20/uSNowYke5dCtiCmeq8E7MYBDpPJH1VhvdB/MkYUgAA05f2h1095G7uYHq5zbTOU1GCtfoHQzDhYAbbk+losXco5tIcOcv7XaZipXLV4WDBV/16tve30NptwgMfcOojrCJT7rgA1UZM5FJdB7wFsjvkrUVTVdXoDYgdgGPZNgN+GKnyRJy0b/uCALWKCdSlCaTvFPf7jwnFSQgnrRrIOTPAmrYaRfCGMmKLKvDv6ZCGvfgafeQus95fL0wu6ZCoCKSxWO8FYyEUP0anYNAuSBPb5pXLRjSW8zdcDIWiqRcDY+9qXaHj6kyQBx13VaB8NaJ8x3D20wfH6luHIZE3nzOidDUiaHUKCM+nYi080BUeGSki6PgEQ2yVFRYqYQvkEbUr1qF73Aqwc+7ugyGpwqLUSNxGnHCtZoqyzHsZPfkyjyhJ4sW5lsypBjjYPdvZJWfmSIxpNDTq2z01hJMYia/AwW88dz9Zrxa0fzetYVmsrH+CxDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(366004)(376002)(346002)(396003)(39860400002)(6916009)(26005)(478600001)(16526019)(186003)(38100700001)(85182001)(316002)(8936002)(6496006)(8676002)(5660300002)(966005)(4326008)(956004)(6666004)(6486002)(66556008)(66476007)(33716001)(2906002)(66946007)(9686003)(83380400001)(86362001)(54906003)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ajRTemtrZHFFRUl3TWE4Mm9sb1Q2VFJ6WTRKMWt0QkgzL3N2WDl5OUlHUHE5?=
 =?utf-8?B?cnZVWlduZU5vUDJVU2x1NGd5M1BUdlpIakwyRWZSbFRNNXJqWkl0ZFBzbnNx?=
 =?utf-8?B?TDB3NUMxWC93eUNhakhnZFo0L2xURVROZU1OSkViamdhWDV6RWlzQ3BKZTFN?=
 =?utf-8?B?V0hKcDNzMnI2ZGtWWmVRbUdEalhIN0s2SmM2b2hqUGpUcEpycEJ3RktoTlVv?=
 =?utf-8?B?VDBUcGlncll6T3czTW5VbHpneW16OHFVYWVaRFJHQ09rc0N1RUs3TWRDazNx?=
 =?utf-8?B?OTY0RFpESmtiR3Z0bm1ENGh0ek1XWExHek5qOHBHQXZLQjRtcVhhcDdTQThQ?=
 =?utf-8?B?Z1cxMS9LeU9sSitmYWludEtrWW9MSGFmbE1KbkpTaS9kcTBPa09LQkk4Qzcz?=
 =?utf-8?B?NkpMZDlNS3lzL1pkNEZIaUp5WmE5ZmlzUDNzN0FkQzBRK28yRkkxVFlySzNy?=
 =?utf-8?B?aU5yNk1YalJtcVB2ZU5PN29oc21kOXFXbG9nWDJGVUgrRGJsaEtqdFR2TTlt?=
 =?utf-8?B?Umt6MmVqUElmUVVtVldrOGMwL0NhLzhSbmMyaFdSM0VVZmxUeEprTWpiOVZ0?=
 =?utf-8?B?eXFVYVFIbkFyZzJINGtSVGlFanJKbUpYMDl0ZkdPaUwzNTR3eVUvV20zN3lI?=
 =?utf-8?B?UEdwcHY2RWphcVVNdkE4dkF5Rm02anJaNWhuWWRDeDBHQkdjVTJSNm9hamtO?=
 =?utf-8?B?RnhxZ1FJekVvd3BPMGZVTFdaR3hrTEJ4N0hSYUFQTElUemoveWtDS1FGc2Ju?=
 =?utf-8?B?NlhMNVV0U3FGS0pRN2c0ZHdoQTBrUXJhZ25La3pldkR0ZE9OUFhpOHFUMU1Q?=
 =?utf-8?B?WDBaZEIzMkIyY3RmbGVINy9iei81Ui9QVlIwZ3g5V1Npb2I4bGxkcXY0NVFr?=
 =?utf-8?B?ZEkrSTBSQ0k0YnpFaUlxdGFkNG4xcUErRTM4NkZtYUswbG9oc011US9KSGRi?=
 =?utf-8?B?ZW9SRFd3WTJ4VGlmQWk4RnhuTUgweFlaNDBPdTFYOUtaTGJGbEJOUWNpME8w?=
 =?utf-8?B?UzBWV2NLS245WmxFWFZVamhRbEpLY3BoU0FvdUQ1bXZSa3N1Z0RQZTJxQW1V?=
 =?utf-8?B?Mm1JTndLVEp0TDZMcWdHSFFSRHN2d1NTL0lBb2dUVEEwb3VSbzFEMWhhYmFk?=
 =?utf-8?B?ZEI0ZndKQXd0NitoWW95c1pnTlhob0EvQUZFT2l5RHpFK3VTZnZGbFFXSFFv?=
 =?utf-8?B?WGRHVlJ3RDlPQXZTT2lqd2J1RHpiM0NrRDlJSjArd1hsL2pMVUVCZkxLODh3?=
 =?utf-8?B?Z2NPdWVFazdPakR6TDZpWS9vRFdnczBzSm9iRnJUZzVtZXFZREZPc0hoQ2s2?=
 =?utf-8?B?Q2oxN2h5SW43dDBkSFZuSzNtUmduS1FvaEIzSCtkY0h0eVpqUzcxeE50OElO?=
 =?utf-8?B?Z2J3N0ZPajZxV2grczBHSVQ2WHI2bnNSallLbk5PZ1EwSjRrY2ZMcXI5bjYw?=
 =?utf-8?B?K1ZRK2hoOEYzdkZ1d0l3MCt4RDlKWTBCTlB3bzByWjVZeTRBWGZyWWxxUzZ3?=
 =?utf-8?B?cWg1QmE0NEdnVjRDaDhmRWJaUTBoM1R3NWtNUXl3bUtLME1XdDNIRmdBeVlK?=
 =?utf-8?B?Y3JCYjNDMUtzWlJrd2Y5Y250N3dXNFp0Zms4Ulptbmg2VWpWMXM2RUhXdDFQ?=
 =?utf-8?B?aG9sVFBSVURKdTNZTHBnOUJ1b1dlU0NnOExDSXhNNkEyTTNXZ2ZzYVRlYm9H?=
 =?utf-8?B?ZzkwSHdPODJRSTJjaUwwenpUVWR4SFRROWtPUVZBUWV2azhmWUR4c1pxMFpH?=
 =?utf-8?Q?TRAdfk6kSvWwYOSwgb9KLolkzZaA613U+tehYRT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df6bfdb3-9062-496b-aeb9-08d8ee10108e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 15:26:43.9699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5lf+kOWP1fcMCXWSgqKYqtJySukFr2POMkFchxDN+RuRIK9cV+pxsogDTr0jhcmfs6TdegWafNdPAHzv2f2TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5339
X-OriginatorOrg: citrix.com

On Tue, Mar 23, 2021 at 03:17:38PM +0000, Ian Jackson wrote:
> I think things are looking in reasonable shape.
> 
> I intend to branch off the 4.15 stable branch tomorrow.  I will then
> turn off debug on that branch.  There will be a commit moratorium in
> force for much of the afternoon while the branching is done -
> commmitters please check your mail or irc.
> 
> Any outstanding patches that have a release-ack but have not yet been
> committed should go in ASAP, and certainly by Friday.
> 
> I have reviewed my list of blockers and the conversation that followed
> and there are just three areas that are still of concern to me:
> 
> * io-apic issue on Ryzen 1800X
> 
>    Related Qubes issue tracking this:
>    https://github.com/QubesOS/qubes-issues/issues/6423
>    Information from
>      Jan Beulich <jbeulich@suse.com>
>      Andrew Cooper <andrew.cooper3@citrix.com>
>      Frédéric Pierret <frederic.pierret@qubes-os.org>
> 
>   Are we likely to get a fix in the next few days ?
> 
>   I think it may be time to reconcile ourselves to not fixing this,
>   and deciding on a suitable plan B.  Do we need to put something in
>   the release notes, or SUPPORT.md, or implement a mitigation of some
>   kind ?
> 
> * Subject: Re: xenstore_lib.h and libxenstore API/ABI problems
> 
>    In the last mail in that thread, I wrote:   
> 
>    | I suggest, instead, that we:
>    |
>    | In 4.15:
>    |
>    |  * Retain the current soname, but:
>    |  * Delete the tdb internals from the header file and cease to export
>    |    those symbols.
>    |  * Rename the expanding_buffer and sanitise_value functions, to
>    |    properly namespace them, and move them to a private header.
>    |
>    | This is of course technically a breach of the ABI stability rules but
>    | for the reasons I [give above] I don't think it will cause anyone any
>    | trouble.
> 
>    I don't think I have seen any patches in this area.  I'm concerned
>    that this is getting late.  I suspect we may have to punt this to
>    xen-next.
> 
>  * Release notes (feature list), SUPPORT.md.  This is on my plate,
>    although George is helping with the feature list (thanks!)

So there's also the series from Andrew to allow Solaris to boot
without resorting to use the 'msr_relaxed' option:

https://lore.kernel.org/xen-devel/20210316161844.1658-1-andrew.cooper3@citrix.com/

This has been R-A:

https://lore.kernel.org/xen-devel/24658.7471.309734.168120@mariner.uk.xensource.com/

But AFAICT it's missing a repost with some minimal adjustments?

If we don't get this in we should document on the release notes that
Solaris guests will likely require 'msr_relaxed=1' option added to the
configuration file in order to work.

Thanks, Roger.

