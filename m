Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6862B3026E6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 16:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74150.133246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l43ou-0003t6-EV; Mon, 25 Jan 2021 15:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74150.133246; Mon, 25 Jan 2021 15:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l43ou-0003sh-Az; Mon, 25 Jan 2021 15:30:24 +0000
Received: by outflank-mailman (input) for mailman id 74150;
 Mon, 25 Jan 2021 15:30:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l43os-0003sc-QN
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 15:30:22 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80c8296e-83a1-4504-b17a-362ee0f29fed;
 Mon, 25 Jan 2021 15:30:21 +0000 (UTC)
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
X-Inumbo-ID: 80c8296e-83a1-4504-b17a-362ee0f29fed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611588621;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HB78kXEfh/32JlxZwhg9+haMiSgCAM4GPE+BYX6kNUM=;
  b=fGYDxnyRYj9L7IFlTssuG4Q23hROaUmvr/bQIqEAtfxibX0PRRaJC0S6
   dMrxeMHiqpsZ95t6cUCv1eMAUt2FYq5toFVLYMBC+61s270watEV0jWeJ
   utsMfz8hQtC3Vx+MB5zdOeFpxySJPIvlC9IzvWD49sLqVd7X18beu8WEs
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 96c9SwjyNFah8PPL/jXYfbl8Vx4B+gRhpMFvZ20dIorN69naRNIYg5/Fnrn0epdF/R70slo0bj
 r7i1BbN7qtf4m23SHtjLxQaxohUwnBkvzbalFf1+kcDnkJnThiwFLWk0MxO689YgoSB0u4IPX+
 AAnYN4GsTPdDT/gtJjFZEh/z+o8t9x+gYeZDMP7JjXPhwyLGXIR+6zv/aF/igAYwSvFFGOKVW/
 UvCi5v6sqBCfBYGCCZfIjk+kDmhwTaAXnFe5klSoN0utiVG+uvfc+k5IJwuyiTJx+rvh9qNJ8N
 2wE=
X-SBRS: 5.2
X-MesageID: 36001440
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,373,1602561600"; 
   d="scan'208";a="36001440"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKVdNBFMmA9HAl3PT/K8D55pBNhFZpozKlbLL9wL6hE79ATHyrJBFWs5IT/MddghCAjG7/ZU6lgx1EcOMBmWjyFIfNAIDF6kpas/YSWCkC1PLUrLLjd19oftZ71n5kyQZam2XtGLo2l0vhaqzl4GnyZogkNebBJLAI/50esR8ow2RmuOZwHCOU/f55E72eFFlUr8l0noQfbjKtpKTsLwuQJdKuTknNYqTt4zFY92v7KAuLs2cPhOiRWGsNGGKsFIa6o5kwfJrw/CFf14b2vZQ927XF8ToTf0rJKDZWaU+E3eQ/weFfVsxzQ9ZUJ/oaynHAASMGlFW0sfal3gHC1eVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T61N48GyogQOoSfD/NmhJvoK/5T3siskCClhiMeEIo=;
 b=ll3cY+xKE0/NNZgVyb+qR+IVj1X8elBOkcf61upcFTIsW6EAYgANlFI5uSIxrxvFHuUtVy6PcHRx9lQ7IuRHqGYl9MYiCIuhoQd0E2qMq6gzKNof0CyPQ8CB47hEpy06pNNmVGDxuTiVbRMO1GJ1WLQ73ts4O5OTpjwWNGVg6liMiP2JuS01+iBBqEkF83OoVjoYLWtccrS46QycdoZOVCEl0gOm6mJsxwKIiZPG1pw6jZLuWGVHy9I3GR/Gy8d6VTzB3IK9CD2NVmNX6fHpBG+7f4Ys0zNhb3Q2ZgDJoW3Y5wGyt3KpEyrV1pIxsG727Pvz1VWLXoz02auMj/i8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T61N48GyogQOoSfD/NmhJvoK/5T3siskCClhiMeEIo=;
 b=pmLxU6giJpv+UlCKk09os2j8p+dGcZAsm2zjyRJZAgidzu6Dwe5QtWB6yJitODLX5zhzKd2+IQUqexIAUF/IN0BVbE8izjSDtI9j0gRZy6O198HagMRUV39OWBCvvC2BTItyT4GW3sBkiIAgYv2oXiRVScVYyq/dQwkqy1Xy9dA=
Subject: Re: [PATCH v7 08/10] tools/misc: Add xen-vmtrace tool
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, Wei
 Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-9-andrew.cooper3@citrix.com>
 <24586.61484.451595.44272@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f8b43de9-03e8-a1ec-b60f-6bbc1691e928@citrix.com>
Date: Mon, 25 Jan 2021 15:30:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24586.61484.451595.44272@mariner.uk.xensource.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::11) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5a4f68d-8077-4537-e136-08d8c1461e3b
X-MS-TrafficTypeDiagnostic: BY5PR03MB5153:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5153840A5E71EBD0B845059EBABD9@BY5PR03MB5153.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RMjpwzS80TgrCyiiBcnsiVqt2lvKdSjYL4n1Ye+eXUqCMW0zlXGto2NOBah2Q19ENO13DWf7U4DVlpDe+Nt3KD2StFO0WlwF64A4/OnV217yTitVU/YvYukmK9hKwr0coQkaIHBw+KNmK1kxeICd2o/IXgCJdGV25hJ/9c7sZA9iwxzzz5wm3fIoRdOehtAvFYUo6mYCaSvod/dh0DUcImCM7avfDNqmtt7YQFbCVE+kuFE1U8JzhnF7eU+KJ/oeHzkOac0NSZA2C+WJHkHNBXK2+qMQHK81DmLUGhFU1GfubTTaZhIj2PT3agV9sVqUN+ajs0iMOYBCF6XGzfstvgQVcyyP52xqb/UT4p5Fte2O3+901ggxMIOh02+dxOjCubZXFw9LOngXyh/Wc8CwpiVtCUegiUOQer1iE/MNyhJZwuMCEUqn48TImBWeLQeCBbsckLyXrWJ3L669/y0Tpri0fcwQLWcf56DAAHzAtus=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(36756003)(53546011)(86362001)(6486002)(8936002)(66476007)(66946007)(2906002)(66556008)(26005)(31686004)(5660300002)(186003)(31696002)(54906003)(2616005)(66574015)(478600001)(83380400001)(6666004)(16576012)(6916009)(316002)(956004)(4326008)(8676002)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-2?Q?eK6tBY5c9Jb7HZMMtYcPj57d4/QZXYhVRBdbEz4ZYLNCWlDeYATdnZcUpX?=
 =?iso-8859-2?Q?CXMp2Bv6IQw/O6APEl6dmtgjphagCNV07/P4ZjTap72VqVXbIxjQjQCBEs?=
 =?iso-8859-2?Q?TsQpCGGISS68BmjV7xbcmtseBZZe6Q2fE71rmBi9NjKSUChiacTjOEqGjR?=
 =?iso-8859-2?Q?byd7L8TsOSsHXkB0rfCeT6pUbUmhd2Wu75tYJu/hn/RUM0lpMhyM1OBKkW?=
 =?iso-8859-2?Q?gMfLCvCGpl2zCLSem4aptnRg9GCeoIL/6mIhEoFiewoW1x7hC96nWRcIQb?=
 =?iso-8859-2?Q?h1ywk3TDHq2y+mectJcDFUX495niNwsXLMQG5ff6PSklVw43kxFtwTveuP?=
 =?iso-8859-2?Q?m3UEFTOSE+qWNKb/AU77D7hodHgY7oMqdHq4XHLU/Dt2TK0djDYCtyCP+z?=
 =?iso-8859-2?Q?kIvPsNImMqYsYTZvj4WcHEviXsE8fGEqiPJORGVGF6HpwKa69N6Q5T5JEO?=
 =?iso-8859-2?Q?jNhDzWivoW4HtY4texMInyoMoHnrQdHIi4l19c1+4/R8nzdhB8taWQ1Ta9?=
 =?iso-8859-2?Q?v6uS3Q2bcrWVzlwsBsVBiVVbhElIE7dEoslFdv4SLh/h7SssVg7UTFBo1l?=
 =?iso-8859-2?Q?T212QTaRGWnWY0jplXteXolVfyt1HxcRo3Q6mYtmEQUVG/DOJ3qdRzu5md?=
 =?iso-8859-2?Q?9ofmXSm4mhKeLhqWnvUx07h7Anz78+CJ5JdoCUf3uPJMaT3klhrM9WBjuJ?=
 =?iso-8859-2?Q?d2cdL739EIkAR74bpgeprTc6Y0gGLVFzVuqFPkhmT/DDVAqm+GGmOYOfLL?=
 =?iso-8859-2?Q?iqWCV5bgKYEr1hvNr8IJM1FMnLZBilgUi64lXEsEFX0E5R8LxoQJPj9uLG?=
 =?iso-8859-2?Q?LONjzPUBBycNE9BzYDyRpz781cK91FYWHQjJxNYXx3NxrvWOjeJvRXEpyw?=
 =?iso-8859-2?Q?c169IlKe5Bwt+Iuar4Vh15spcoRsCx5yL1RopRCa90LXaaiUI9yQe+ZRfp?=
 =?iso-8859-2?Q?g43VOHK+N3J3HDIQYg4Mvwqm+OEYVQQbt2c/dX59uhYVHl9wS1cZ8u/4TC?=
 =?iso-8859-2?Q?AI64oQf4nwX6dqvpnVLS3N8ohbzNF+QZJdZ5Tv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a4f68d-8077-4537-e136-08d8c1461e3b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 15:30:17.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8qwmOCxAol6sJ7QrdG2+U4VyyLgIPjCkTJNxg018vGvCJ365WSiG9lcFKOQLP7xPW+cdOP15lztyrNLoCfwGJmfW8yktBndRFv8VFwnKtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5153
X-OriginatorOrg: citrix.com

On 22/01/2021 15:33, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH v7 08/10] tools/misc: Add xen-vmtrace tool"):
>> From: Micha³ Leszczyñski <michal.leszczynski@cert.pl>
> ...
>> +    if ( signal(SIGINT, int_handler) == SIG_ERR )
>> +        err(1, "Failed to register signal handler\n");
> How bad is it if this signal handler is not effective ?

I believe far less so now that I've fixed up everything to use a (fixed)
XENMEM_acquire_resource, so Xen doesn't crash if this process dies in
the wrong order WRT the domain shutting down.

But I would have to defer to Micha³ on that.

>> +    if ( xc_vmtrace_disable(xch, domid, vcpu) )
>> +        perror("xc_vmtrace_disable()");
> I guess the tracing will remain on, pointlessly, which has a perf
> impact but nothing else ?

The perf hit is substantial, but it is safe to leave enabled.

> How is it possible for the user to clean this up ?

For now, enable/disable can only fail with -EINVAL for calls made in the
wrong context, so a failure here is benign in practice.

I specifically didn't opt for reference counting the enable/disable
calls, because there cannot (usefully) be two users of this interface.

>
> Also: at the very least, you need to trap SIGTERM SIGHUP SIGPIPE.
>
> It would be good to exit with the right signal by re-raising it.

This is example code, not a production utility.

Anything more production-wise using this needs to account for the fact
that Intel Processor Trace can't pause on a full buffer.  (It ought to
be able to on forthcoming hardware, but this facility isn't available yet.)

The use-cases thus far are always "small delta of execution between
introspection events", using a massive buffer as the mitigation for
hardware wrapping.

No amount of additional code here can prevent stream corruption problems
with the buffer wrapping.  As a result, it is kept as simple as possible
as a demonstration of how to use the API.

~Andrew

