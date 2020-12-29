Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D552E6FE1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 12:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59811.104869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuCz8-0001Qu-B0; Tue, 29 Dec 2020 11:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59811.104869; Tue, 29 Dec 2020 11:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuCz8-0001QV-7a; Tue, 29 Dec 2020 11:16:14 +0000
Received: by outflank-mailman (input) for mailman id 59811;
 Tue, 29 Dec 2020 11:16:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuCz6-0001QP-Us
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 11:16:13 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2100c3a7-9cc8-4217-8d22-dc3db458986a;
 Tue, 29 Dec 2020 11:16:09 +0000 (UTC)
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
X-Inumbo-ID: 2100c3a7-9cc8-4217-8d22-dc3db458986a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609240569;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7R/b+arKlI0KjLbi4nVK1O43KtzOLCrLjdf8uZe5Vzw=;
  b=dE80+UD9e7FYB9pLiilP187j8aIcQ/8M12PQ6nEP4J+rakA0WeE47tRu
   V/LqaasPzqlCohHfR60UycUY7hxaiJ0MVAXxQ2clTJk9iUMmizPV03TTW
   kInjTOMYQNPkgWn0Is3OVMmJ6Dqt35qKi++U8k9Wwtw7ryoO3GuzqQ/hO
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Z+RkW+IrBADWnOu3hdcYOuRXbU1OBQDW8abGrfjWvqQn8rUqDbTMjMkhl8uKUYA0rB6g1TTbHL
 +a+iif6quwBkJOicfWR6/6AXWdzvr1vdoAbNCpAThQwE/VT+ilcc7uAV7R/oyuQeFNQa6Ac7r7
 eYgBqMIlcES3Ukvg5BUQocoC79yiWtCM5XwtGu/kggxt5ubaxmNyvd4YrC7Nk/BtpCLCP0mEgr
 OQ4aZCE+/R8M4IH1r2BzxwD3ZdrkGfecNH4OymZTwOEKDfgqRvl7EWiHM5utISyX3mCyHEj9JF
 LKk=
X-SBRS: 5.2
X-MesageID: 35336450
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="35336450"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alWmzfk7b4711+hZk2vsCUtVBW7sPZN1iiqIBOpoJBeqnlHa8OdUtf22SbAKD3SJQq7toeOxdtn2qfW5L1n3n7PikOsbBArSKUaq80H2hfuPR+GxAIeanL9xHbT9dhv2GbtMgMuB5xD8qntvH5fYJCWmXfMQyXifutJwBH1IwBDQ2VYlTwaYhILUbnd/zcZTeLrdnf9+4SjncTbvD2oZdlNIB0grhBxM/hDxsNpfar9Rn5tYxvM3nvi7uTBk7+wf/QVeHOzzIDWynLw4CjgvfUhSd9dPXbXDeW/9VGAUeRpBiTU1LuNUDBDi7WXfspaKuo3QsqB1fjZxyWoQOHK8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUu4gJqmQhIfsr00LsR7GNefx0PASAC/mDprSMGGMM4=;
 b=VfVkFKrVwBNridumPGE4aY/R6XazcwwKviSvO35/KzAWNzSrFr4IIsKUvkXD58kM3HS5ZMs4SbOpGff3iWu2LibHWlksOZHGTL+4BUE75aOKVAEvrMESKD7dP8H11NJ/QbCG+S4PsTTxmIyIfgQPnL/o7LXIKDmreCfrGZuw+J56SbSmCxSh3RmUwb9mJPNfw0p6+zFnxUCR5+7P+0/27RgG2TMtYmlD5AjKaNAkedOSASr7BzuewCiibJ95n20XfvW4cbq8sPWur1G9PEvgx9OmeOYkI5AwEDC6IDraiOKPWQoA5sV3ew72b7pq86OKmlzSf+XcnCc23eatwkDGGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUu4gJqmQhIfsr00LsR7GNefx0PASAC/mDprSMGGMM4=;
 b=ulnJDsiQTbBNegdmMOvBUcT8So2EvcgiyEvoV3yZ4Kj+ciKM/GP2i5WrIl7qE/jMSNZCb3Cym18s1inaXgbBbWiDEupkGdA3+WKUh2GIscRsZTixCZyfzFh5gDbGoNGHBjSvmtK/6TmcaWajyhfRZ+tfPTp1QoLGzOXrtuCe0Dw=
Date: Tue, 29 Dec 2020 12:16:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 12/24] Implement gnttab on NetBSD
Message-ID: <20201229111601.x5gmbcai4d7ex5yd@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-13-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-13-bouyer@netbsd.org>
X-ClientProxiedBy: PR0P264CA0230.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6ad09d0-6b63-4387-2993-08d8abeb226f
X-MS-TrafficTypeDiagnostic: DM6PR03MB5339:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5339DFD625C88DC619CF7CDB8FD80@DM6PR03MB5339.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GeT8qCrXxNMTCjt3Gyv/ccOZCYuPxAHFgFg/npj/sRFZTVmEVmfDh6QUGhZWBxEJNOu4pHhzrDBXgQpDz6T04kdsTW937aR8vh0X25mVXg02dD5h81vL+XLXLRA2AQP3ebZ5c8l9+7XSUFnu4Q6eeeIsLkpxofXUrEv+I9sHhuO8QW+U1smil+zc9FpqJHNpDy/+tMwVUBxyWnPpeyVeg31o35HcpLFs5xUPnWpuZdGi4SDQOUlmW8g72fle11FEj0eqtRxeuB4EZbiRhMEIJbzj04jnnWIKvrTDdl7G8CW+Oo+vliZxP7pX3vZu6uMJVuwlWT3ZRNIK6506lm5dKMe3eGZ6Eh0nEm1l/kzL5chnJsmsvcXuxIW0N4q5jiYBcdD0PpLOn4cP1chvQRF0/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(85182001)(66476007)(1076003)(4326008)(478600001)(6486002)(83380400001)(16526019)(316002)(186003)(86362001)(9686003)(956004)(26005)(2906002)(6496006)(6916009)(8676002)(66946007)(8936002)(5660300002)(66556008)(6666004)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TDZsaWxQd2pMV3lOaDBIRnlwYlRnaDJ5ZXQxZTVPbnhTVGpxTjMxOEpPcTlH?=
 =?utf-8?B?TlpVMXpVZVpPTHdkYjBKYS9DVnN1a2VqUmpFejlUK0hpdlkvQm92NnFNSWRs?=
 =?utf-8?B?d1hxclhXbFR4Tm5TR01wbFpLZzIvSmlwZS9OUnpyTmlPSzFpVVFTZEJtT2wr?=
 =?utf-8?B?aVFqa2lFU3VzMGQveW0vV2pHeDJTUXZGUmNud214S0lZOUFyNUE3M014ZW9m?=
 =?utf-8?B?d1BEK2NHSXNjemRZQ0dYRnRLcEZJNW80V2dnVWtLVS9yS0JxcFJPRy90U0d5?=
 =?utf-8?B?dDQxb0pBV01LSms0NkhyQlA2T1JwR2g0cXVpYjlTTUlvWjBlTld3SllsbEg5?=
 =?utf-8?B?NitYUFdReDlzMHdkSDNOTnhOWkk1NURTR2o0UDlyOExsYXVPYkFUdFFXaERp?=
 =?utf-8?B?K09Na2FVM1NJczlRU1oyRHlGSGFabjhtcGNYMCtGNmpEWFpJcHdNRGxIV1hD?=
 =?utf-8?B?Q1hCdVdwMGZPbG96eXRTWFVLZTZISGJvMXREaW83d0NkUVJHeWMxRXJ3Rklm?=
 =?utf-8?B?L3FzVkRHVVU0clFGNU51eUkvRVlTb1UraWV4Z05ObWF0cGI5czVCeUlmZzhj?=
 =?utf-8?B?L0J3QzFWeWMwc0tBRnl2R1F0QnA2aUdFcUhrcGx3NUdkY1pzbzVLMjZTVVM4?=
 =?utf-8?B?SkQ1VDdaVUk4Z2NpSDVNQ1IzU3QyNTArOU9pR0RmLzBvSWR2N3o2T1lpSFNl?=
 =?utf-8?B?ZkpNNlVMVSt3OU9kT29kQUY0MHl1eUcvMzNPOG5rUnF2OWp4R0MvS0RDcUV5?=
 =?utf-8?B?VUZldHoyQ1BDYTlTQm53UUxJN0NkM05uaFV0cXdnZTJ4SjlGL2ZQaWZWWlJx?=
 =?utf-8?B?L3NRbzVQc09FNkxldUFuZHhlNi9HNHlBaXAyZGNzTUg3eEp3M3NGRCtkRysy?=
 =?utf-8?B?OXcxK0NoUHVyd1dEeEVrN3RDSlJjbE9XS1EzMXorendKSFFxQndVK2ZueWZQ?=
 =?utf-8?B?RzQwRDZtUU4yNDB5TGlMY3JUMG52MnQ1WDdvVWRBa1NOVDNMYStRamtUU3hV?=
 =?utf-8?B?ajlpdUJWV1l6ZVRPbC8yMWd2ZE42K0tXWVJUSUZOOGpML2lQMHBSVEl3dGxj?=
 =?utf-8?B?ZjdPOVJ2TTkzZVU1c2JRQmtZejZnQ21xMjN4RnlZQW5kdzI1QStaNlh1R3Fv?=
 =?utf-8?B?aFNtZVQ2M0FXeHR4em1TU2xhVnkycE1PS1pDZUtPZFY4L05DMXpEbHFSeHRj?=
 =?utf-8?B?bDY0K0ZxQjJHNEVWa2RrcG5MY0JFQkRUU1J4WHREOHRtUzBhS2N6cFhWN1dq?=
 =?utf-8?B?aElVTURxbUtJM2swNXMxM1RBalcvOE1qR2hUamlScFluK0VHd3hQMkpaQ1FI?=
 =?utf-8?Q?fJx4m8WKdcjKyFbWczyTI4xyQ+39qHjbu2?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:16:05.5433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ad09d0-6b63-4387-2993-08d8abeb226f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xL9n9gipIyF8dK7/E3ofmQSDAXGDSKW0OzdGjlpdRF1aFHJOUxJfE1iobOq2WAowKobb7UnbKUQ+XWA5bbO6HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5339
X-OriginatorOrg: citrix.com

Might need some kind of log message, and will also required your
Signed-off-by (or from the original author of the patch).

On Mon, Dec 14, 2020 at 05:36:11PM +0100, Manuel Bouyer wrote:
> ---
>  tools/libs/gnttab/Makefile |   2 +-
>  tools/libs/gnttab/netbsd.c | 267 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 268 insertions(+), 1 deletion(-)
>  create mode 100644 tools/libs/gnttab/netbsd.c
> 
> diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
> index d86c49d243..ae390ce60f 100644
> --- a/tools/libs/gnttab/Makefile
> +++ b/tools/libs/gnttab/Makefile
> @@ -10,7 +10,7 @@ SRCS-GNTSHR            += gntshr_core.c
>  SRCS-$(CONFIG_Linux)   += $(SRCS-GNTTAB) $(SRCS-GNTSHR) linux.c
>  SRCS-$(CONFIG_MiniOS)  += $(SRCS-GNTTAB) gntshr_unimp.c minios.c
>  SRCS-$(CONFIG_FreeBSD) += $(SRCS-GNTTAB) $(SRCS-GNTSHR) freebsd.c
> +SRCS-$(CONFIG_NetBSD)  += $(SRCS-GNTTAB) $(SRCS-GNTSHR) netbsd.c
>  SRCS-$(CONFIG_SunOS)   += gnttab_unimp.c gntshr_unimp.c
> -SRCS-$(CONFIG_NetBSD)  += gnttab_unimp.c gntshr_unimp.c
>  
>  include $(XEN_ROOT)/tools/libs/libs.mk
> diff --git a/tools/libs/gnttab/netbsd.c b/tools/libs/gnttab/netbsd.c
> new file mode 100644
> index 0000000000..2df7058cd7
> --- /dev/null
> +++ b/tools/libs/gnttab/netbsd.c

I think this is mostly (if not equal) to the FreeBSD version, in which
case we could rename freebsd.c to plain bsd.c and use it for
both FreeBSD and NetBSD?

Thanks, Roger.

