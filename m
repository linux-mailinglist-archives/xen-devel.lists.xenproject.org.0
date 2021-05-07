Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C7937611B
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 09:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123779.233535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leury-0000BN-KM; Fri, 07 May 2021 07:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123779.233535; Fri, 07 May 2021 07:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leury-00008c-HF; Fri, 07 May 2021 07:25:54 +0000
Received: by outflank-mailman (input) for mailman id 123779;
 Fri, 07 May 2021 07:25:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leurw-00008W-O6
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 07:25:52 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 370cd906-2501-4ef1-b8f2-17df48351306;
 Fri, 07 May 2021 07:25:50 +0000 (UTC)
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
X-Inumbo-ID: 370cd906-2501-4ef1-b8f2-17df48351306
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620372350;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BK8YVJO8bvd99ktR4bOXQ3SMBRdbSrUAvdvPIS778hU=;
  b=ZdsTbP4IWNvU3owBYs1iSZiR80wL/xTyZldnTzLkzbbNRFEoaGJkeTBS
   ePShDp189aFdd3GCnzrPCykEUCyg0DByjQoOEnNvwPUQ2Ukx0iFALac97
   6vd0ttGK4dE1VchIPCDdicSqMB/bV/Doz6uWitBnIRnHB5Jd/FZynDrIx
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: U5HyNIUuFsaGWUcHqp5gQR8vXgdXuceHg24avFJeFMiPKADBJYuB9rGe1oQuYquXI/wHM2Fo8P
 nFAXVGqhAejJZ+tQgSiRax5yiKn+oZ4rz4aePpOgnZc4cDlY6OyDbhzaEmOA6xxNHWLPk72KVY
 jeByZ9wDkg3hwfnDIsfhTOYRUNMh5nH6f+j3HLs+zqzCPqeWao+tZaXvPlfoZRs5Aedde8CnvQ
 viaWhYwV7ptydyNacdJgwgEOKmGBbXOwloDmIecChrJStE2WC7+/Km/lT/yy83EgahIdN8kfpn
 tOA=
X-SBRS: 5.1
X-MesageID: 43292486
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Bi4RUKEgevrzt9kbpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43292486"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBnxOXyJnH24Q9FuGNSZe+Nhy9vmXV4vfYW2YlBCOVYS7sbByhI70uawTAGQu6OR9lWk2/giesup6sy/WX4BxnasbDJTrhXnMH9lF0MJ7ANXAAKVESpUxsXXribj+p3rrB0Je6cotE/rAu919LGamvxZ/j5KJYX5oS9ySmul390+3GU6yeN+WHfcmrsAE1VBzHCfrDRghjbbvoZKQ4CCByMJoghOvSjFTlyBgKcW1yGYPlSLG+gSOXwlhMta2tXAW1eEXJg/KuXx4QxJGrLhHplmLKAM/iqr20wkzpnKO3JavG/o69E96DNgE0BRa1PpGpOrNA4VmXmGe0O+l55K6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xe2TIIEZvd1s1LX5EMJRuHRL8wZSW/ZcuYuYkQ090g0=;
 b=Obw1tKRoOzu0Mitvx1o/efGIAyBa1MCaAk6JLUGX9YI7hViTqqfLXuYOWo281C6MCj8gMhi+u0SYNG9RMGYKeVQzRzRZFSVGF2+rBQWkw7liG+b0PULZCYDQ4h8rxC0pp/jejm/SJnDu+A+WwY5GDry+bxpUlkBTMwT8Rsn8BjicIzrxcQG/uq+/EInLpwZkPYsCyVq7z2hzJUO7M4rAfeYWe/MjSDItRDwDG4nNiNpM3QTibmGg9+BHRLCuV0wj4gFc43yFBdaoDSnspzv9chmhmpL63V0IZiXRWLGq5jhTPckm/Xnwo5Ys9NI4BrOljc8Ovbwj0noT/j4Y2XT21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xe2TIIEZvd1s1LX5EMJRuHRL8wZSW/ZcuYuYkQ090g0=;
 b=NKeKlJPABec5Vhtmq5cMijoWf2t/0G2kKKt4SfgrmguLsBNonNN98VcUVpfVNCVERJuj+VIVcJpbrv55cgDIOoaCIMQWnK1Vke4+cPM1Ktgty7pLDTcJBv/L9Vf8w/oS2jfEau0EVHcJzS7//8+cNwSfZlc5IgvQ66os+ahC+ro=
Date: Fri, 7 May 2021 09:25:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: fix incorrect suggestions for
 XENCONSOLED_TRACE on FreeBSD
Message-ID: <YJTrch06dWF9SOLf@Air-de-Roger>
References: <20210504135021.8394-1-olaf@aepfle.de>
 <c71658e6-422b-4852-6d21-4688d09d8b8e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c71658e6-422b-4852-6d21-4688d09d8b8e@citrix.com>
X-ClientProxiedBy: AM4PR0902CA0002.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac380356-2b5d-4915-058e-08d9112953b1
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4057E08D49AD8641D95E05608F579@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6hkN9l5NNCJUh5aXPdmskvWo2g5Bea6qL/E0Imn3tpE07scyAqNZRO1p8Ey/ssDD5SKXTFGOrbV/1Iks2ZlkbG8GgMj86PngpwXwnWYAA5waWsVkeF3vEAdR/KBCkH8lrSBYAQWycZIwAXqPI77WpHBXb6TkZ/b3FrVatcc4gsH0VLAVe47kjZG1l82H3g0hKqvAYIkz+/HY+KNlPwb7hw3pdalROX0mWdj95FZPQSLdZ47yjir/K80qKQoUuKs1nGRoaJglvkdOgJscDq6WmX6Ti7UddiCUKf16AXLvZsSi8y/Sm1Ww4Kc+4ZJSex4N7hvvjqadukXwF/mWWT0YmKh09FdyWKvIXxw3Z9B0KpjMT3jvkzre4x/4txbKafwqg4bi+V0p0m+UOEriFpiw8JG6BSGBPTybPov+diOa1IP32QkuP0D4QNDInTk08N+orlWKJIGoLnutniOcAQKWRKHd8O/tF+2Yq04iE4g1eXhOuGoRH8vD1ows8r2G1o1IhMQ90ptZP49tpEMwRen6vE3Pn7MghO+HO394fiL9xhoaIocDBNyjFklGsw8tcJatK9vleqkCxMHnA8m7YzC9dEez4AF3M+TByDE/JZ5mBAA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(136003)(396003)(366004)(346002)(83380400001)(6636002)(66946007)(66476007)(66556008)(5660300002)(316002)(2906002)(85182001)(54906003)(478600001)(26005)(9686003)(16526019)(8676002)(53546011)(86362001)(186003)(6496006)(33716001)(956004)(8936002)(38100700002)(6862004)(4326008)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YkNGQkZZQjJzUTlQUzVsRzVxVFhkRGxhU0kydUVNN3oyanhyMTYrQ0ptQ01F?=
 =?utf-8?B?WHJrcGZxeTNmWFdhbU94NXhzWU9sZEJBaStaaHFCZGMxb3R2SUsyOGowdVgv?=
 =?utf-8?B?em9wbVJHTjRxU29yZVJpVWVVREV0eDFrdUJyZ0hqSU84bjBwOHdFeERFbStW?=
 =?utf-8?B?MUVUNVBaVHE3QTNjdkNWWWo0dnFYMVVhSGMwQWhCT0dFOCtTWmpHMzFCUXdW?=
 =?utf-8?B?TG4vbk9oTlVRallFdWNMazV2UkhMaHMzcVIwa3BTMHRHbC94RTA2dmxaNXpG?=
 =?utf-8?B?WFU4YWpqTjcraDlTM2ZBTUh1YnZPQ1Q5ckpoclpxdzhMQWljcHZ5d3o1ZVR4?=
 =?utf-8?B?ZGRmeVQyYzlGNzh4VlJIWW9HZjkxVndTOTlERGQvbTAzV3dBaFRYRGl4MGxh?=
 =?utf-8?B?eVh1STBkOEQzNDZXZzNZS0w0V1N4QVppcU04cHppc21UYkR3REVOTFRLSWh1?=
 =?utf-8?B?SmVQTU0yTTRtVG9vOThBRHd2OWwzT3A0TnBjcTV6SDFsWUs4dTFVUmhYTGxh?=
 =?utf-8?B?NjFLN1F6WkVQYTJEbGxLak5OSlAyeUFzaW1zTm10VURBaDhMbGV2TFkydFBZ?=
 =?utf-8?B?Wkw3N1g0UU5GN2dlL1ZiS09vNGp6Ujdxdno4STJZNFdTOENmVWdYYmwrYmR3?=
 =?utf-8?B?eUdBODljK01vb3gvT3NmeXlYR2NaWDJ4VjNaNnJyV3VHaDl3M2xBdk1FREdy?=
 =?utf-8?B?aVljL2ZZV1AwOUs4MEt6d1JFeHFybDNPcWVhWDd0SklxaEttMWozZGs0Um9j?=
 =?utf-8?B?SCsybllNMlRHR3F5eVNzcU5CMXFtZEk4NGtLMGF0ZldCWWJZZHYyK0NHRFcr?=
 =?utf-8?B?Rm0vcGs1akxhUkk1aVlEOGxJeHNESi9ZL3hPS2ZZQVlUM1NQdTNxUWU3R2M0?=
 =?utf-8?B?U3J4TG5WaEkwRWJWQWRCcFFFTkg3T2dXaU0rWHlEdU00VGVRRHgzWjhBUDUv?=
 =?utf-8?B?Z0toWUxDYU4vbDd6dG8rU0R2Q01SamhSOVFpRmZrOTk1NjQvK3JNNzEzdjVM?=
 =?utf-8?B?ZVlZTUhzYjdFWlovMEJjSHZERjJsSU9lUGhoaGJNallYTHB5QWZxUGJQSnd1?=
 =?utf-8?B?czZDbDB3UjBkM1B6WERFYWpVZDN0dUJRM0xZd3dpN09qa09uTGVaVCt5WWpi?=
 =?utf-8?B?bnV4RTVlS0JKRG1OelFmS2U3U1d2UG45TVRaT3VMY2FjMnR6SVJMSUovWkV0?=
 =?utf-8?B?RXhIeWVQbGNMeEZ0VTBBWkhwQzdKYjJJREZPbThGSWFJYTVCRFBKQTNwMU9a?=
 =?utf-8?B?MTlFcU1WQUNQTDZaSk13bTFzQU0vajRrMFlzaFpndWhJNnNURG8zZ0V2Qllk?=
 =?utf-8?B?T2V5T2NrWCttbnh5aFpvTmxLcjBwT01TY3JkUkhNdCs5WGpHTUpYVmV6YUIy?=
 =?utf-8?B?bmVvb2NQaGFIOWJRcmNYb3RHRnpqdTdiaFYvWktqSENtdHRJYWhvRVlHbUZ2?=
 =?utf-8?B?QnhESUpCZjVjUi9iN1VKbmdxNUQ3eElhclVMb3d1d0NxN1FRcnRXYW9heHVV?=
 =?utf-8?B?QVhIK3F0OUxzVklSTkdmVzlHYUV1NjNaazBLdTNnRVJBenlhUUJxMU5RL253?=
 =?utf-8?B?c2dVVXVqZXVnc3kvUE9EcE4wUHB6dWwyVWJBWklzZWxPYWtWVmtkbEYrSzRY?=
 =?utf-8?B?NmRFU0JKKzBSKzdsbUg1czkwNWU0WVZNL1ZvUjlOeTNTZ25LaHZVTEYwb2Q3?=
 =?utf-8?B?N0xDV0RuRTBnV2FtNVk1ajBwQ0QxR1Fta0FvS2RqbUhvK3BFWFNXUDNZTUJz?=
 =?utf-8?Q?czNkyZrkq8CF8+w+CEysG424LXRUxma4pxOiVUV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac380356-2b5d-4915-058e-08d9112953b1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 07:25:44.7158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAh44jBA/cGM8UWQz0BjC4kT3f5p/N7rQGnQgpm0aVhMWZtoWW1qBIhG/K7RMPNmHXjkSoSkzKAM+ja02/h5Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

On Tue, May 04, 2021 at 06:47:12PM +0100, Andrew Cooper wrote:
> On 04/05/2021 14:50, Olaf Hering wrote:
> > --log does not take a file, it specifies what is supposed to be logged.
> >
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>.  That said, ...
> 
> > ---
> >  tools/hotplug/FreeBSD/rc.d/xencommons.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/hotplug/FreeBSD/rc.d/xencommons.in b/tools/hotplug/FreeBSD/rc.d/xencommons.in
> > index ccd5a9b055..36dd717944 100644
> > --- a/tools/hotplug/FreeBSD/rc.d/xencommons.in
> > +++ b/tools/hotplug/FreeBSD/rc.d/xencommons.in
> > @@ -23,7 +23,7 @@ required_files="/dev/xen/xenstored"
> >  
> >  XENSTORED_PIDFILE="@XEN_RUN_DIR@/xenstored.pid"
> >  XENCONSOLED_PIDFILE="@XEN_RUN_DIR@/xenconsoled.pid"
> > -#XENCONSOLED_TRACE="@XEN_LOG_DIR@/xenconsole-trace.log"
> > +#XENCONSOLED_TRACE="none|guest|hv|all"
> >  #XENSTORED_TRACE="@XEN_LOG_DIR@/xen/xenstore-trace.log"
> 
> It would probably be clearer to untangle these in one go, leaving the
> result looking like:
> 
> XENCONSOLED_PIDFILE="@XEN_RUN_DIR@/xenconsoled.pid"
> #XENCONSOLED_TRACE="none|guest|hv|all"
> 
> XENSTORED_PIDFILE="@XEN_RUN_DIR@/xenstored.pid"
> #XENSTORED_TRACE="@XEN_LOG_DIR@/xen/xenstore-trace.log"
> 
> I'd also be tempted to fold this and the NetBSD change together.  It's
> not as if these bugfixes are distro-specific.
> 
> 
> It looks like a bug in NetBSD in c/s 2e8644e1d90, which was copied into
> FreeBSD by c/s 5dcdb2bf569.  (P.S. Sorry Roger - both your bugs,
> starting from a decade ago).  It really is idiotic that we've got a
> commonly named *_TRACE variable with totally different semantics for the
> two daemons.  Then again, its far too late to fix this :(

Ups, sorry. Feel free to fix those in one go, and add my:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

