Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B303587D8
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 17:07:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107406.205337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUWFB-00056h-RP; Thu, 08 Apr 2021 15:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107406.205337; Thu, 08 Apr 2021 15:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUWFB-00056I-MJ; Thu, 08 Apr 2021 15:06:53 +0000
Received: by outflank-mailman (input) for mailman id 107406;
 Thu, 08 Apr 2021 15:06:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3iLd=JF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lUWF9-00056D-Tv
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 15:06:52 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1db68523-bdd4-4d1c-8c5c-0ba8d7586c99;
 Thu, 08 Apr 2021 15:06:50 +0000 (UTC)
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
X-Inumbo-ID: 1db68523-bdd4-4d1c-8c5c-0ba8d7586c99
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617894410;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=uGGZDYG3lXU3aBLUSepRxFN2FZDljYeu/rPn95gFnhE=;
  b=UX26oM1MQ1OYRqg2GkRFHrib+b0bXJv50CXONqzYN8lI0toyp7jXoBLA
   SoTfAguoif02dBQSrqnmMXemFZIBY0HMC+q8bEk69qd3uXcXkJaGGwz59
   oL/QkM341CJL9IsYdAJIdnnAOlhE/lYy8lx2HtU60rpRirJyLH0ik+yq5
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /je1AXmk2CpMdN3X02QpJsZtPjjr7Nx2bt/SoUs0cOEqgp5B+kRDqB1Fi4PyNJ3BKn4xcMruY2
 XPPvvh4EXJWLlk8x9oTP1NDbJOycmXzVwmrLp4SOz9Eosp+MimuP0pvV/ONYcKqthJr2l9vfsw
 Gy5bSFLdyjYmkLaMBVJh+OAKK4wpYQH0MWUzdQ+bZQ5dkdIV6Vir6baLKMrj1FTf9e/J4pY+hc
 DciDxAG6FOh4B3jQtFRjgyED0ajfVhZHgsd6GlzX0ao7zi3hxGKkPFZrrDFZZj+nflzraIR+Kq
 rRw=
X-SBRS: 5.2
X-MesageID: 41168157
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BgGWvqtFHGQoUHUCe4AbtHxm7skCpIMji2hD6mlwRA09T+Wxi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybde6+AqXYuKdg/gpWeuMcVe/ZLvqgeQfxHW28x88e
 Nbc6Z4AMDtFlQSt6zHySSxDtpI+ra62Y+yg+O29RlQZCVLT40l0AtjEAacFSRNNWx7LL40Do
 CV6MYChxfIQwV1Uu2BCnMIX/fOqrTw/fqLXTc8CwM68w7LtDu06dfBeCSw5AsUUD9E3N4ZgA
 r4ujH+j5/Dj9iLjiXy+kWWxJRQldvnxLJ4dbGxo/lQEBrAoEKFYIxgXpeLoTw6pvq+gWxa7O
 XkklMbEOlYr1/XY2GpsTvhsjOQrwoG2jvZ5nKzxVvlvMDjSzoxB6N69PxkWyqc0WUMlpVY8s
 twrgWknqsSNzzstmDBwuKNcBdQmk+9sRMZ4JUupk0aa6QyQvtst4AFlXkldqsoLWbBx60MNv
 JhN83Y7OY+SyLhU1np+lNix9GhRR0Ib267a3lHvsSU1g5fl2xiw30Zw9QCnmwB+IhVceg929
 j5
X-IronPort-AV: E=Sophos;i="5.82,206,1613451600"; 
   d="scan'208";a="41168157"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HT8Dmultv7mxzDJpuSVY6GsN8eyL+VxX5AVJ5FCgKRvM4d/DjzFhtKaAekzi/nsaomYgDUOgs567r+vARvXPGI41/87fyFAngUIx2We4Jr+xIfOVY0LFbbXjIweWbKbspYp5yAnaupwd8SlHEZ8jNBKNDGvfjcgnq+5KLt2CKmSCscuSbh7C8bIrNNEnxXDfr8EuHM5yEow/2g7WK8om8HtwYLg2tUEWlwRD+uKOlmPAO2sCxpryd9gDodtc0hpOAobyQACpUwVbVb22TCta4FZN4iz0450VbPdqUV0t7aH3xlQW5ay4srPTHZjZ9MdLSOhSBGOLN8ZLsixAAN+KQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CgU6nSaT69CiB5OK9+hxYwcWyQhI/cL9kFgpaJrnj8=;
 b=mgoUIdfICHkkQC8UwIiHKKrvjutM8gNNVGp+lKcmuV5VLOtZSDdgNk/yv7muXB98GQ9SQmEGBpgXGyqllXPkpEpmBRjRtJZQKX7js4038ta0dGRnQdRJtk1PuoPmOOxXWZYOBM7sqg23KJ3kZlceH6YZ+dK3iF9Y8n4lk8bJBy3q6T1mocwDcwyYpuyTFDL7IFDGazA9OZddFEcLcm58DYMv1S2Zg0VablMjO2TqRCsCkBQTmBriDSaz9+3n3ug07tTKWaZ6W0BIkI9eLEpNrNkPFTVbnwGweHYIM7tDqWb6Wexh3+YDWqFiQyLb3jItJZNmzPdrzTBMuR+hNYszBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CgU6nSaT69CiB5OK9+hxYwcWyQhI/cL9kFgpaJrnj8=;
 b=J3EdC4coE8THRqfOGLTPG2SjAu3Gc7uGo4YktpBPZc7UeYQa/T0xu6m7dSZEe+Sga2DxN7jfVo4pp7FD2nhTLgiTTYLKsk4pxU1AUXlh9uXCKWl/XbkdiwOSp6gKy0GsO86+hcK0+X1JgTl48DeavnxzrXR2piQzdhxcddCMoTQ=
Date: Thu, 8 Apr 2021 17:06:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 06/11] x86/hvm: allowing registering EOI callbacks for
 GSIs
Message-ID: <YG8cAXkXCArrKnpD@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-7-roger.pau@citrix.com>
 <a57f0f75-341d-e6e1-823c-2083184a8f08@suse.com>
 <YG78hECMfLSB6Aao@Air-de-Roger>
 <8d088ae2-e8a7-7818-5ee8-5ed95ac260c1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d088ae2-e8a7-7818-5ee8-5ed95ac260c1@suse.com>
X-ClientProxiedBy: MR2P264CA0047.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::35)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ad04bcc-5ece-48ac-d700-08d8fa9fed47
X-MS-TrafficTypeDiagnostic: DM6PR03MB4603:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB460313BB238474C96D9714338F749@DM6PR03MB4603.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sql6d7Gby9cNLP7Lf1NyH+bESRnmuh9rXvgnOLa+vGiwLtQRAXee/osEnrGXF94TCV0G20T73ntQvQlH27a6mDlVP+zrY76k7i/suPV9iJ/1MZIot/FHN4s2BHNCXmwXZk6xXDJ9vIObNwwX8Tmj4sSw/cmfLxPCj72v+vftWj9+CpIM6kNKzYjRh2HFZOWvir8+wfvgFtiLIQjesbAQ5TFhaYhq2nsPI4cUHPQSRWZbEpLjAR8VRw/Mq+ARsySKP58N47jd+djEI8HNEfymd19Od9YwCuyzVvVQ8xu5rjKvOiq7m/VkREnnc8vy6A6XlgvP0Fabth0YccXrFDO1u74ShxPE4hVEuKtkjZQYpbM0T2iAuza3QU6BRXHo5Ok/qRGLC+3djhHov2fzWl3BtGlEZOF/aWYDefnRS/ZhaZWk8b7otbzCb06zaOHNgak0BuRMvJ+HYGAMO01d0Rtgpq+/hF9g/gkOmqz8wiR4xWTqy19/x/olBArsCdSqA6si6k45dCgqHgcbm7zPfRDX1j2sOejoBzORFVksFq8smeb8dv9RDSZFRCzIdTqOYlbQgvbnHznPyhIObNx6R7e48SND2ZcE1d4utOF9OQSVs4MIwmz/nyYZnheo+ok8W9AEyoOugTN2ISRdiZtoP4p31ZzdAxjX+kUUR3BUbQ3Qkm8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39860400002)(396003)(366004)(346002)(376002)(66556008)(85182001)(6666004)(186003)(16526019)(26005)(66946007)(5660300002)(66476007)(54906003)(6916009)(33716001)(53546011)(316002)(4326008)(6496006)(6486002)(83380400001)(8676002)(478600001)(8936002)(38100700001)(2906002)(956004)(86362001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djg3YjAzSXROdW8rSUpqQjJrMFd5UVF3SzZWalZQTzJNQnpQODRuc1I0UmM0?=
 =?utf-8?B?QnpUQ1FBdVVOQVMyZk1wRVZNdFg5R0JnQjc0Nmw0Yk9wZGRyN3Z0R1haNlBI?=
 =?utf-8?B?K28wYkowbDdPYXVDOHA2UWU0U3V6YmlzZW85ZE1DYTdiRTlKRzlVVHNNS1B2?=
 =?utf-8?B?VkNIYmUzQ2tpZGpDaWg5bXRhOEdzQzhQMTZiRzJWTDRTSzh5TERIT2JqcVh5?=
 =?utf-8?B?M0hXTE5zRm5jdUFzZldjUEpzbUhGdGJjcEt3ZXdkRnMwdFROMzNrRm4yajhB?=
 =?utf-8?B?bXhwT3lRZ3dha3JYMXJCNXNHUCt3MS9TN1paRHhYWWFzUUZBRk5rOWhERWZH?=
 =?utf-8?B?QjAvUVJaQXJPTnRETm5zZzlFVG1iQ0t3aTdoQ1RkaDEwTzVSWXZNRnZoTG1q?=
 =?utf-8?B?WG1pS3dyTFVrcy9QaHBsV1BuSFZmbDZKOXVWblIzS1N5S0JzKzkxekRtN3N4?=
 =?utf-8?B?NFRzZ1F0SXFNYU5mcXZvc3UzVkEwRDEvM0JWTTBtcnBDSHoxMmMzY0lBSTE0?=
 =?utf-8?B?b3pTaGVaSEF4ODBCbHVWWUsrR2NxMmREU29wdi8rc0hZYklGeDNwalB4RFU1?=
 =?utf-8?B?T3dJZFpFWGZsZVpuWU5sb0FuNkhtQnNZbkJSeDhkMUlzUkxPQm9Mdyt2U2ZR?=
 =?utf-8?B?NnRycTBOTDdSekNxNDJqSTJqdndlMWk5NUVOcm1yVmxoV3hUaVR5VkNsM0JF?=
 =?utf-8?B?ZnlnUVdhUzZFLythMG5xMVBDOER0aGlCM0w3MHN6cUxhenBjMUlYVlVOaWJm?=
 =?utf-8?B?bG15aXBtZmZVVzd6dXcrUjlLdTFsbVRTZFB3YWExZkQrUmtNQ0tsQWxwMHhJ?=
 =?utf-8?B?SklWUFQ2THRBQjVNSXl4eWRodndwdkhDZFlEbXdGM1ZUY2FmZGlCWk9lcUN3?=
 =?utf-8?B?K3ZGQXFoVlhxNzRGaU5DeUpCQjd5dmZENnZxV3pQUU04MzlvL3RiMzU0UGg1?=
 =?utf-8?B?WTREZWw5eU1CL3BSWEphb2phaVQrVldIMUdpcitsNW1SRzdKUWJzVkJ0NGEz?=
 =?utf-8?B?NzYxeDBsTS9YS0JkNmpTandDOFM3cUJpWVIvelY1TjV2bWVWbnF5R0tTWWE2?=
 =?utf-8?B?WCtLQlBXaCszOFZiY2tPZnBmd2tCRitHVEpqVXlBUFdRVWlKNEl6ZGRGdEhD?=
 =?utf-8?B?MXU1cFo4Zm5zNFdhZ0VEZDRqTnJ2Qk1CS2I4T2NzL294bnN6c1BhZnEwVm1E?=
 =?utf-8?B?M1pCZzJaamEvVnpWdGN6S1F5dnJlMVhqMHVpZWFxNUJZOTJhSk50ZDh3SzVP?=
 =?utf-8?B?MnMwQVpXTTlWN0h2dDBXT1dQZTdUblJTR0M1K2ZNM0VzMzZNQVA4My9QUGxT?=
 =?utf-8?B?aHFkOXRhK1lWWnJJdU9vYSsycHduamxnYUtsM1hibnE1QjFZSXdxNVFaaWd2?=
 =?utf-8?B?MzJ2dmcxNnJORStOUXJCckdzQkRranlFWlc0SUVpM3JQNlpOamJwTGFMSFhx?=
 =?utf-8?B?cGVUSHo3TTZ2U21STjUyZ2tmZHhZTnBqUkM0MmtOdGJhdERQOHY3Njd2eW4v?=
 =?utf-8?B?dENEdFJBYkxuSy9BbHdVMlZ6NXRRYVl1alJ1cTFTSHdFS3NSU3I2cjVSSFJI?=
 =?utf-8?B?eW1Td2FVK3Z0Qk5xcDlhcnFydFNDTFEvT0FlUWluWEdJUStVY0ZId0xlQlhj?=
 =?utf-8?B?TithMDY3bDFxMTdmNmh5RFpOR3J5ZnRHRUZ1VzRJeDAvMWFISHRjaGpML2xu?=
 =?utf-8?B?TnNvMEs1YS9HcHloYXg2UHJOQlY4dVkzNC92VTVrY2xXSTVsYVloZ0NOQ2ZQ?=
 =?utf-8?Q?fh8wrIutr/lHfhLAtjitTbuPQPprKcxSG2mhG4U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad04bcc-5ece-48ac-d700-08d8fa9fed47
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 15:06:46.2548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXfZZppFUTKXDoNn7jpgupUTySJUE3ePHNZzWhfx2aAlxVVXs9xLE6gPk+gcFdrCnAv+ffBu6ukNXRLE180myw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4603
X-OriginatorOrg: citrix.com

On Thu, Apr 08, 2021 at 04:31:59PM +0200, Jan Beulich wrote:
> On 08.04.2021 14:52, Roger Pau Monné wrote:
> > On Wed, Apr 07, 2021 at 05:51:14PM +0200, Jan Beulich wrote:
> >> On 31.03.2021 12:32, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/hvm/irq.c
> >>> +++ b/xen/arch/x86/hvm/irq.c
> >>> +void hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
> >>> +                                 struct hvm_gsi_eoi_callback *cb)
> >>> +{
> >>> +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> >>> +    const struct list_head *tmp;
> >>> +
> >>> +    if ( gsi >= hvm_irq->nr_gsis )
> >>> +    {
> >>> +        ASSERT_UNREACHABLE();
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    write_lock(&hvm_irq->gsi_callbacks_lock);
> >>> +    list_for_each ( tmp, &hvm_irq->gsi_callbacks[gsi] )
> >>> +        if ( tmp == &cb->list )
> >>> +        {
> >>> +            list_del(&cb->list);
> >>> +            break;
> >>> +        }
> >>> +    write_unlock(&hvm_irq->gsi_callbacks_lock);
> >>> +}
> >>
> >> Perhaps somehow flag, at least in debug builds, if the callback
> >> wasn#t found?
> > 
> > I've added a debug printf here to warn if the callback is not found,
> > but I see it triggering because hpet_set_timer will call
> > destroy_periodic_time and create_periodic_time and thus two calls will
> > be made to hvm_gsi_unregister_callback. This is fine, but adding a
> > message there gets too verbose, so I will drop it and leave the code
> > as-is.
> > 
> > I don't see a problem with calling destroy_periodic_time multiple
> > times even if the timer was not active, and that shouldn't result in a
> > message being printed.
> 
> If destroy_periodic_time() is to remain the only caller, I guess I
> agree. Other (future) callers may then need this function to gain
> a return value indicating whether the callback was actually found.

There's also pt_irq_destroy_bind which likely cares about the return
value, so let's return a value from hvm_gsi_unregister_callback and
check it in pt_irq_destroy_bind.

Thanks, Roger.

