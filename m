Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A508360FC5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 18:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111389.213048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4To-0003TV-Tr; Thu, 15 Apr 2021 16:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111389.213048; Thu, 15 Apr 2021 16:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4To-0003T8-Q3; Thu, 15 Apr 2021 16:04:32 +0000
Received: by outflank-mailman (input) for mailman id 111389;
 Thu, 15 Apr 2021 16:04:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4R4=JM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lX4Tm-0003T2-Sp
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 16:04:31 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8715df4-56da-4fdc-8024-6aba5e1e9ae3;
 Thu, 15 Apr 2021 16:04:29 +0000 (UTC)
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
X-Inumbo-ID: e8715df4-56da-4fdc-8024-6aba5e1e9ae3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618502669;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=y4M9E2J0FRPacWxjx2V4/4B5HUfCbZikSGH56bcGJgw=;
  b=Hm4oUr+nwwqPev7onsRK/RlmEpEjkYnUMGmHDQgvDi8xo9HwSnRkXbAs
   3gM5OuC8uItYCZdMHag/hGmH1aQ8vZWOhad1M5uOxDQkesmeKbFVNqMEw
   nEA9x5SEL9KeUdMKH1y49ZYGtjXVJdxh3QBzP4Y6bDdC2/lt2mZP/jy1x
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l0Zhbn+qt6/I3DWAZT68vtAj21Qas5+XoyLxof99nVr0lKCd8ZJIpxghuaosPPHVrbMiY4DCxv
 lsqsBf7winQIMC/AtPqqhmGKfqXVYbjnT0D7BdQOcB1w0vKvtsyk9hNi7Wx5F9mydciBjrr7xA
 UpKCzCc2+tSVlR+4yUps4Irp8l6n9dnMbJyCMKQlCOCp2qtH4Nn8+ElgrQcYQTfeM5dyIbDuDs
 JKKVz7U8M7QC4BKkEehusnZ+5zk8Yt0JdjxywgEnsGp/gaJv+qSbvdf330PoGB5Cco+fM4l87I
 wxk=
X-SBRS: 5.2
X-MesageID: 41526040
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:s75IZq0VwynR58jHxa+7jAqjBWhyeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035hz/IUXIPOeTBDr0VHYSb1KwKnD53nbGyP4/vNAzq
 sIScJDIfD5EFQSt6nHySaiFdJI+re62YSJocub8Ht3VwFtbMhbnmVEIyKWCFd/SgUDJbdRLv
 qhz/FKrTahZngbB/7TbhU4dtPOusHRk9beaQMGbiRN1CC1kTiq5LTmeiLovSs2bjUn+9Yf2F
 mAqSPVzOGJs/a3yhjTvlWjlah+qZ/a5fZoQOCJgsgRAD3whgivf5QJYcz+gBkF5NuBxXxvvN
 7QowoxH8kb0QKsQkiF5SHD9iOl8DEy52TswVWV6EGT3vDRdXYBJOdqwad6GyGpj3YIjZVH/4
 9gm1+9jd5xCyjNmSzsjuK4Ly1Cpw6PjlcJ1dIIg2c3a/p4VJZh6bYx0WlyC5k6ECfz+OkcYZ
 JTJfCZ3vpQfF+ABkqp2FVH8ZipVnQ3KB+MXlIPjMyTyyRXh3B01SIjtbUioks=
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="41526040"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvPjyTk78iTjHrmJjvztf08qbwg6SjEbvU/GYa/aD13DtxRBSBi+ys8CaF8Fu31qiHhtD5MrfoEuMSItOvcOpLwse2VMm1LzwJhVM9PMRsriEHoBU7cqEtAqWm4LFKdwF4niS5WN53djMuaY1972T4FjOS3hcbXZwOhx+QtAinxdrUW5VQnGG1RKo/alDoEwl1/uEc/FisZuzc/n1+EqUEGhikO1SW1JYf+DygZb7kZZbNCsafa+gU4P2zbktQ3B2ZW11Jh6r35/GoeAGEDD8xqigeT3yIvYnH9CjqlU18/4Gopayxc2lGWJ9ACFYVAFj7WSRZ9gTtjwmNeI0A02Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SjXWGrp9x1UQTfhOryqES6S9F26Ex2hBlUeJ3sK+Go=;
 b=DyMsoU7aSzgH3yrns7sBu+ILAEoHGtcWuEtiSBOVmG4s3MOan2DHoisSEhSr7SOYUn3VRNe8lkEDgZgrALLEEVLAL8/8Y3e71OrLRLxVO+IvqpjogYLSei/5ld8DuTw9H8iZfBumN6NBMDsgkbJsLCr9Zdt2QAI2QUbRQBSWsUeDwfBs+E0xMGEvRJ4iG/6z7Pb6juAty7s7yQEtMLpjoh0ATbr+JfAWN4AKdJeGMNsQxY2/fBeyJcPGUYCtS4oTYuJHcOR1g/wy3LhjVYiu7dYfxqoRatFbmK8Xy+Ui/HtdcHqPaQ0bfM/8s/32uiXnOoXilzTTqt8/3+pgVZ6Qig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SjXWGrp9x1UQTfhOryqES6S9F26Ex2hBlUeJ3sK+Go=;
 b=GuWXj/IUSZ4DPeJ6mMoqf7giiinpzykLZcHQNgCbqddwvmPPGUMd1nc9X4PWMS2CenYkS1GKuI2SkMUa3vputvUzrHLbFihsTFr0TQTzJEcHEBxJ2YfnE9A3i5EFNhk2PR9guRwHppYPSZPZvpoObClQxBM0spEf6SdjLWEgq5M=
Date: Thu, 15 Apr 2021 18:04:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 06/11] x86/hvm: allowing registering EOI callbacks for
 GSIs
Message-ID: <YHhkBBaXgBQMrov/@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-7-roger.pau@citrix.com>
 <a57f0f75-341d-e6e1-823c-2083184a8f08@suse.com>
 <YG3m9nW6xPeL7MPr@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YG3m9nW6xPeL7MPr@Air-de-Roger>
X-ClientProxiedBy: MR2P264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45392631-019f-44ae-8fcd-08d9002824b9
X-MS-TrafficTypeDiagnostic: DM6PR03MB5289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB52896B8850971C1DFD03308A8F4D9@DM6PR03MB5289.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fh26Wnoa0RnlWUQWeYsH9hOrslpnN2shlxxYh1+JrCB9acFixjnV0MjfWbHkukV+8Mz4pCMmZ+F+vptkjVh9VLI61ZkEO5f3Y7Xlydwfv5jEo85RkoljdRgyK9EK9tPgTRQHcLXaAQmBonaWrDx6YYKLPqtf6VXGUKiS9wCh7eBrGge2CPWKIhCtdxgUvls6zwq6FQDeIZWL363uRN95yztdjaWaxMxQLGEHAzfzPted/wH6Z9piwK6xPHQ4cH9zCVb+AxBvFEOsXYKZZ8gdlUDtGseWzRZ7ZcV4eOYZjsnOzz6JTsJX8ujUewgkZjCpvFX58HEb09dbi2A5XYP6sXyoiAZRl4w6ndJRdBezjQeEm1HRjcBOECQzBekEOcRk+EgVbnfzNyyIyV+8lRsdxZ0TpGYjvCOZEhqgEMdyN1cKQHTaGCTEoIdyKj7eaNSI4EdDmF6jypTsQ0seKnTgh/wNW7nweUHsKQRlLnPoZE3UyHxL2/5N6UrFV5ky0bB5cZIiYwdhF4TaUUOf4vILXHWg8879Ra9aDx4DaJU6oJ47FcJ8dIKJDICbVCftqfXSdT0WyR9Yb+UXL4+Y8Poc6Xx7Kd+bJmPXJxi10tM+8JY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(53546011)(86362001)(2906002)(6486002)(85182001)(33716001)(8676002)(6666004)(38100700002)(9686003)(6496006)(6916009)(83380400001)(4326008)(5660300002)(8936002)(186003)(478600001)(16526019)(316002)(26005)(54906003)(66556008)(66946007)(66476007)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dXcva251YitDQzJnZHo4VS90RmdvUXo2TGFPb2wzN3o0dnQ4Z0lxNGtkUnRs?=
 =?utf-8?B?d0pKZkhWRjM2T000ajFMUjQxQXlLRFJhUHZONnZCem55c2ZPTGdSZkVneHYw?=
 =?utf-8?B?aTlhQ09WbSt3ZmRSZ1ZHOXdVN3hGY1FCYkszNjNaRnc0MlVlL0o4ajhnK3Fq?=
 =?utf-8?B?bWxWVjQxak9uaE81dU1ndXRBcEUvOEc5VVB1ZmZabVljUEJZVUduNHphVld6?=
 =?utf-8?B?NTlRZTNhMnJvRDVva1V4WnhkdUg1KzltN0VWdzg3QXoxTEZOT1Z5OUF5cXJa?=
 =?utf-8?B?M2k0VFVzVTJDWSt1eDdDYnAvSUxiYm1TWTVOeVhQdVlKRXNzTUVOK3ZVbUlC?=
 =?utf-8?B?Z2hTekFoa3BWK0RTQW5aS0prNWZTcWNMWThGOWhVNVlDWWl1aHBXY0FxWmlr?=
 =?utf-8?B?eUFRMTRVc1VvVHZualN3ZHhFQm5JUVJNSUQrQit6TjNSVStwMTZuYTYzdDlu?=
 =?utf-8?B?WDZUbXFaa2tTemlZTi93VmlINFN3d21YRlNZOC82N0p0Y3ZLV2wwaG9tMHRI?=
 =?utf-8?B?WmY1MDEzZ3hjQXdCdzdYWmtCRlQxbFZKMHY2cmE5V090TWVtT0p6TjE3ZGpp?=
 =?utf-8?B?WVJ1Q2d5elA1VlRXenluQkVYblBibjI2cElxQlFseG8xSVV1R2VhYjI2dkdE?=
 =?utf-8?B?cmE0N2t0RVRtUGVVdXlRaktKUHRZZUFVTTMxZDhpUE9DOXZaSHdseWV4QTNt?=
 =?utf-8?B?d3lrK2pGLytLRWVyUlVvODB4b0JseWlRRVR0dU9ubUlTRlB6SGZrb2pRUVdS?=
 =?utf-8?B?eitwL3BUWW90TURNa29kc2F6TnZyR0ZuWlRhVHlxc1p2UGVxNkFuMU54WHRW?=
 =?utf-8?B?S3p6aFpnaWxzK0p3aHBKdElIbmxHRGU5L1FZS09OQ3FGclhCczN1MDJzTkVk?=
 =?utf-8?B?YyttcXRpSlRxeGZuQ1hyKzBwSmsvczl3bjFkUTBGVWJFdVhRaHZDNDJrOVF2?=
 =?utf-8?B?NVNudTFGbWw3VjZ0Ynpyb0FGYjZIN1N1WjYrL29KSVhlb0tQa1RFMTJlQ1J4?=
 =?utf-8?B?c0RZd2xkeEZvT1djUll4S0hzcTZHeDdTd0pkZ3FJeXMxbS9naGdQeUtEYmUw?=
 =?utf-8?B?aWtlTTlLMjZ1QmFsclR1MEIwdHJQVHR0bUlNTUlIOTVGa2V2NkZwdzFVM0xS?=
 =?utf-8?B?YXV6K2syZURIRkovRzZHWTNnMWcrS1hhNyt1SlVWSVFkVERTazE5Mis5Tlgz?=
 =?utf-8?B?RzZZZC80RHJMVDk2d2NEcEZaRmM2VnoreDB2WDhpUFUvbVNaUmNKeW4rUmdR?=
 =?utf-8?B?NmdzYzlPa2R5R1BiVjBCdjFUaE8xMlVyV0MvbGJtd21PODl0TndEbUQyKzBC?=
 =?utf-8?B?WTJmenV5YkxsK1U1UzRDSVBHaHQzU0k3SWxvaWR1cm5oRXBPY1JGcVQ1VXVh?=
 =?utf-8?B?NjZxNm9yZmJXS2FPczZZYWMvK2tDMmVHbEMxbGZwSURBUXQ3VjVwMkxyK2Rn?=
 =?utf-8?B?VWRiNTFFMVhBZXRGR1ZQa1JGT3Nhd0gxT0NUSjRSQnF6NTVGTHlDbFBHM3Nh?=
 =?utf-8?B?dWxEcFlNUFB5cVFHNFY1YU82UHZkUDlXamk0VmphZENYNjYrOWErZGdvL2ZU?=
 =?utf-8?B?c1B1cXJqQXluVVpxcjljTzNGTTd0cGQrTmFhbjRJZG5aRHBIVTB5QkNXTHl0?=
 =?utf-8?B?YzZ1T01JWEY5UDFvWXBuNkxpYlNETWthbVNUWm15cVdBSURGMnA1dWswbE9s?=
 =?utf-8?B?dmpLT0xLdUY5VlZ2QkRMNTd1VDJlZ2kzbmQ2YkhpeFBEL05RWmNRdEtTN1Fk?=
 =?utf-8?B?dW5TSDlBcE44aGNUdHVNSnVFRTB2RlQvTytKT3ErVXNWMnpUbzZKS1FtZFkr?=
 =?utf-8?B?S1hWY0lYalRKWnpSTU9CZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45392631-019f-44ae-8fcd-08d9002824b9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 16:04:26.6653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypehRpi/FdSBy7B4GgWUJU4XN/crif6p0xChK7TWPI7SxrHyS6NzhAm+szuGkj0+TvYEnrQSZyznvi2xZoTK2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289
X-OriginatorOrg: citrix.com

On Wed, Apr 07, 2021 at 07:08:06PM +0200, Roger Pau Monné wrote:
> On Wed, Apr 07, 2021 at 05:51:14PM +0200, Jan Beulich wrote:
> > On 31.03.2021 12:32, Roger Pau Monne wrote:
> > > --- a/xen/arch/x86/hvm/irq.c
> > > +++ b/xen/arch/x86/hvm/irq.c
> > > +void hvm_gsi_execute_callbacks(unsigned int gsi)
> > > +{
> > > +    struct hvm_irq *hvm_irq = hvm_domain_irq(current->domain);
> > > +    struct hvm_gsi_eoi_callback *cb;
> > > +
> > > +    read_lock(&hvm_irq->gsi_callbacks_lock);
> > > +    list_for_each_entry ( cb, &hvm_irq->gsi_callbacks[gsi], list )
> > > +        cb->callback(gsi, cb->data);
> > > +    read_unlock(&hvm_irq->gsi_callbacks_lock);
> > > +}
> > 
> > Just as an observation (for now at least) - holding the lock here
> > means the callbacks cannot re-register themselves.
> 
> Well, re-registering would be weird, as the callback is not
> unregistered after execution. What is likely more relevant is that the
> callback cannot unregister itself. I haven't found a need for this so
> far, so I think it's fine.

I'm afraid I was wrong here - rtc_pf_callback could attempt to
unregister the timer, and thus end up calling
hvm_gsi_unregister_callback inside of a callback.

I need to figure a way to solve this. We already run the RTC in no ack
mode (which is correct because of the flag we expose in the WAET ACPI
table), and hence I wonder if we still need to keep the code for the
strict_mode around, since it's not used at all. Would you be OK with
me removing the mode_strict related code?

Thanks, Roger.

