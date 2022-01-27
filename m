Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7449E6A6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:50:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261580.453052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD72l-00040T-W0; Thu, 27 Jan 2022 15:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261580.453052; Thu, 27 Jan 2022 15:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD72l-0003yd-SK; Thu, 27 Jan 2022 15:50:39 +0000
Received: by outflank-mailman (input) for mailman id 261580;
 Thu, 27 Jan 2022 15:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD72k-0003yV-Gk
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:50:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deae39e3-7f88-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 16:50:37 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-ljuWP19XOF20WCvzRvJwJQ-1; Thu, 27 Jan 2022 16:50:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8307.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 15:50:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 15:50:33 +0000
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
X-Inumbo-ID: deae39e3-7f88-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643298636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBZnrUhW5qQClEpXHSUcEADMuARLM/i+xLdUFskPT2g=;
	b=NWDNPH+ffi8EKrTVHa6H3PuUkOi1T3AyZe3fRl6TyMdnm1/4iBimqb1Ykf/Q1YaEa8P7CV
	AQe/pcDkeaGihan0KTZLNIzc82VUymVrZ4Uvt0Z/O5eRVIls8lELvhwTAgmEYfSIJtP7qf
	UvC5D+t+3qmZcYFqLCQqVX/3Zt2YJ9Q=
X-MC-Unique: ljuWP19XOF20WCvzRvJwJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqoF57IKHKuOF/yUq+MEEtzGMCEOU57EkgpAF28H7EZgPDJtrN74E/t/FrdyAhoruiih3MlqhKaZEBj9p+TuDLXT7xMrcQ5J2To1XPlfT+6//NroilOdgG0WkapVC34D1l7OQTWmppiiHTK8Fz18EKxM+rqFkYpI7prGdunWGgaf1oV4OlabVTMINT1WfPbjDADyp5qpeIR5LKCYJumw6qlNtQ6Xq8/Z6LLObOOfZl/I8FzKrjb9hFkeBN6lmRpGX1YWuTL9/YZeU14mZ1jRBFgFpKIkEBwH90/HteSQGb8Ce0BuKEsGcjcWNYuTdMiSD6zueAQ2lpr3Av61k/hsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBZnrUhW5qQClEpXHSUcEADMuARLM/i+xLdUFskPT2g=;
 b=UGPP8B8ryy50DDjpYkpQXTQdf2m3qI3CBSp7kaGIrWPXsMah9hZL4wfjrxnWg7J/ljlGpHHBGixp/h2fTl1GljpIo8bfPVwbbGeeYzRV8mFVwsKP286BoPVtIpD+nhFNnCD7hMggobHNe8xNujxm09CcYH2G2auDW/T1Txxcj2kWpFlmhQGvyg79PpTis/sEOXCm/i2DwIIt5fOyHDA8MPGD1FScC38fQsemw0QY24PSNxm8+q39qab6E5DRJNStdWpccgurArq+s+ybRPNO4HV/kHfgHMGNUY6v4mCKqUwSOAED1JSfJNXpzE2vLo3Ng4dS09bDO+M7fW7sk0cKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bd4d8e6-d426-97be-f1d4-429a793f888c@suse.com>
Date: Thu, 27 Jan 2022 16:50:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 04/30] build: set ALL_OBJS in main Makefile; move
 prelink.o to main Makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-5-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220125110103.3527686-5-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 342f5466-dd8a-4eee-ac7d-08d9e1acc0c1
X-MS-TrafficTypeDiagnostic: AM9PR04MB8307:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8307D651B5CCCCFD1D48BD34B3219@AM9PR04MB8307.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lABmk5wU/6toRVMZ5/8IAXfFABzOinBHucGE8sYxsytJNhHS3fCQjXSO76ScN4ni03DVJAHEpAMAm+pj06e4LOCveTHQ0MMnc1MhRm4HI9iIzfvVZqZGjgqWWO6PxNZ4++wtvqj8lfqT/ZTD20dTSk6Skl9CaxATHOjsIKre9Zc2l6WQmYL0LU5/QmQVG/IDmRTOMPdr7x2bgc7xQ1XWiTLhH5R2SPM8Nl2enuDzBJSACwqVUcjaoy+VjakgOD22t0YtkWQkvGrr3Y+uO3cnAyD/2af9Lwxfhzeoeh2aE+jxX+UzNzWUD/Q+1USkmPke4ZHkULY4dhzKBbxLRXQ10q5c0H/jsSWFF3m7+bMnVrumJzDz0jzn3yrqgVJf+iDeJ4mFiY/Kuixc+IVlnsX/HttvRZVjs7+E5l7yzk+90FuHgfCIY61HuIQ6g74RUIpAQQWlSJburpTf9VRtEK5hV2bSfwL9TyafLg0qVZe32EOpLmEu6CxzHzagJBRxlAIi/WThlVMmVE9TTEDgD2fX1N4fAgDE/Bp8a4VFbfTTWqnBzJDOXL11arL1K9t2tFJReiUxZa1wcX1wXEDkNk3N4H3VZs1gwP8TYqDhfdOM6C8D0xPtCE16RTKP5CcElnIuijO/TK/9+eY1+WfLFywJ6aq+BQ+w6Jh8yo7fFODpylARdgApQg5PjVdrp9zmPZMay4BWp39dMCZEKf3z1d3b4qem8hwtm3ZaKi/k5bOQqgZ/+FSPzEgs8XUcx8/JLcrG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(8936002)(7416002)(66476007)(36756003)(8676002)(5660300002)(54906003)(38100700002)(6916009)(316002)(4326008)(2906002)(6486002)(2616005)(31686004)(6512007)(31696002)(6506007)(83380400001)(508600001)(53546011)(186003)(86362001)(26005)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3NFd1VoWUhHNkFJQi9QMElGWkhDUEc5UW1lWms0YmpjSExYYmgvZnBGWlc2?=
 =?utf-8?B?cE05cWxmcDJZR1pENVU4RVNrMlAwdmlkcnEvQUhRbnp0VXlGc3ljRXdLRjVZ?=
 =?utf-8?B?NGRMc0t2cWFzMWRYazBmbDBKRnhqc0JOWllUeFNpRmxmblZuaFJqRFk1R24r?=
 =?utf-8?B?VllnVSsvU0s5SjdUZGNEdkg0dkpCYVpWbFFvc2RRTnV0SXRJc3lsZ3IvdDFv?=
 =?utf-8?B?eG5Qc2dtN09PcnlIUEtaVWFHZjhwcFdINWgvS29UNjhSTFUzQnpVZmtzd1hx?=
 =?utf-8?B?L2Z2VGVvMTdHY0NoNmRLa2VtaDNWa2pYYzNaYjA5aGlDMWphcXNuWTRrY1ZN?=
 =?utf-8?B?T0F6VzlhNi9rbXB1MFFCOFp5ZXBHclRZa3gzbGNqMFZWcXJER2VCQkc3aE9I?=
 =?utf-8?B?NDRoNFI4NUYyRmg1QVMvaUZqV2pEbHUybkh0SGhCdUR1UUI0alJGeWpTbkdC?=
 =?utf-8?B?d1lXVG5GbGRvS01yeWQ3cUpTaUM0dEt0aVd6YzlrZFNMa2s1NkY1bTh3bkt4?=
 =?utf-8?B?UHVCeDNpNVlNTWptdXNUQ3JZN1A0eGJBajJHSzNEazlnWE5YQXZqT2RETTlB?=
 =?utf-8?B?QnpSZi9MM3VVTW9CRnlFQ3JNTmk3QnBSbnlJUlh3RVd0UVk2TVlEU2E1ZVZr?=
 =?utf-8?B?SXZLRnprNHZpWU9JMVhQMG95bVVyK3FEMjEzaDVtdHFuRmphZ2hCaHI5QUFN?=
 =?utf-8?B?QTVzYTBoSWVnQ0xEeTdZVmtQb3JFYU40RmhLY0lCVzd3bGZiRmNzRDRzOWRY?=
 =?utf-8?B?MGhqTXBiL1lzZEJRZ3U5dWRWQ010NHgxOHJJM1lnOTRRUjRGamRKd2hWVEJj?=
 =?utf-8?B?Zk1nbWpOTGI4bVRRL3E3QUFqVzZrTUZ1Tit0Uyt2Yjk2emkvMWNNTG9VM3Jv?=
 =?utf-8?B?OTFxN2wwcTdyMVFGblFNRm1tNE5ORG55bHAycWpSMFZrYnQzNUVhVU5BeDlq?=
 =?utf-8?B?Ty90OTF0blRnQkZWc0FNY2dzbERmM0dKcTRJbnd0c0M5ejFoVWxhZFVHNGpn?=
 =?utf-8?B?SzVTOFlVRXpiS3lXcjBNbk5pM2FZdVRyV0dTbEo3S1NlMEgwd3dWUDkvZ2pl?=
 =?utf-8?B?Um1XMUdLNFBiTk1BSGxKWll4eU1Sb0U1dXdLcHRKRGduakF4aXFXNElIdkxN?=
 =?utf-8?B?bkU3aitKUHdPQ25HOWhMU2ZxWFAzclZxMmVCREY2VmpSb1pGVFREOEluUm9H?=
 =?utf-8?B?ZGh3Mjh1cFg5QTNobWhZUHZITjdoWEdCNjVxWTJqeXJOcGNMTEZTaUNLUGxm?=
 =?utf-8?B?SURGU2dBT3JVbXQ3VzFJOG1vQW9rYUZYQlJNS2dGaHlEMTduSFUvK1pqQTlO?=
 =?utf-8?B?dEdKZW9sUk1kRnNTRnY2bVBBWit5clhLUDcrbCtENGUwVzBUUXhWMXVJSG5n?=
 =?utf-8?B?NEdMSXA5NjcrTTVwZTk0VURXVlRhd2VaNW9rNDJ5dGkwTEdEVWtodU9QN20r?=
 =?utf-8?B?bmZmS3VSbHdOQ3JoeVY1eCt1R2Y5bS8vSHdTRkxIdUc2Vzc4bWcxYmQzdjEx?=
 =?utf-8?B?djVrbW45VWJScXFZWHYvckhuR2o4MGhWN3pHRHdjT2JaeTJEOG0xclA3ZWR5?=
 =?utf-8?B?Y3JLQnpXankvSDM0c2NGcTREdkRvWExJblNZQmJGRFNDMStKbUlxZVgrK0hz?=
 =?utf-8?B?UHRuSEtGTGlrWUhCNS9DTG9XZHBSN3BheHZubWtWSElHSnBBbVdFQjlKM3Uz?=
 =?utf-8?B?ZmZvUDNTMU8zSWxBbnowRnpzb3Z4dWc4UDJpSmQ4N2xaNEU0VmlMdnJHNjl5?=
 =?utf-8?B?c2VCcUpKOG5UWlcwcEJmN216dmpLMzlqLzV6M0t4VFlYcHVNc25OWnRCSmRR?=
 =?utf-8?B?em51cExwd3FYTEZ2T0tsM3hLbDVBaFFGakdOdnhhVGs5OHI5K0NXb0NQTzRs?=
 =?utf-8?B?c005c3Bhd3kybDFYYWhTUkRKSzhabFlwQnJ4SmpHOW5TYlJiNjBFTDE2aTRs?=
 =?utf-8?B?b3F1b3ZQUVlFYVNpN2VxMXduOUl4eE9ZSGphM2RaVHA3M3dwUlNseWxKTklu?=
 =?utf-8?B?clNIMTJxYUJTVkZwbnpMc1dKTzQyeVpGOTdBcW9OQkRFNVFBdTZpV1FLL3d5?=
 =?utf-8?B?bDM5NVZMSTlVU3ZHdzQ0Qi9JM1FmT2dkbTd5S3FRa0c2Wm1HOS9lRXVocGNV?=
 =?utf-8?B?ZERnMnB6aVhLR3pkZktNTnAyaXA2STB6TUwwV3dPc3pBc3ZJNnJJdDJDSVRI?=
 =?utf-8?Q?H2tlM4iHgdn5SSy7VkL+MqQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342f5466-dd8a-4eee-ac7d-08d9e1acc0c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:50:33.7615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxP4OWRhKvGKlpe5mrgkqN0/tbcNA/OjnEs701Rka/e2usEsiGxmSl77t99VS+ZLqAkryxVIWSMVv6D8XBFcsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8307

On 25.01.2022 12:00, Anthony PERARD wrote:
> This is to avoid arch/$arch/Makefile having to recurse into parents
> directories.
> 
> This avoid duplication of the logic to build prelink.o between arches.
> 
> In order to do that, we cut the $(TARGET) target in the main Makefile in
> two, there is a "prepare" phase/target runned before starting to build
> "prelink.o" which will prepare "include/" among other things, then all
> the $(ALL_OBJS) will be generated in order to build "prelink.o" and
> finally $(TARGET) will be generated by calling into "arch/*/" to make
> $(TARGET).
> 
> Now we don't need to prefix $(ALL_OBJS) with $(BASEDIR) as it is now
> only used from the main Makefile. Other changes is to use "$<" instead
> of spelling "prelink.o" in the target "$(TARGET)" in both
> arch/*/Makefile.
> 
> Beside "prelink.o" been at a different location, no other functional
> change intended.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a remark and maybe a small adjustment suggestion:

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -285,6 +285,16 @@ CFLAGS += -flto
>  LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
>  endif
>  
> +# Note that link order matters!

Merely as a remark: I wonder how applicable that comment is anymore.
If anything I'd expect it to be relevant to $(TARGET_SUBARCH)/head.o
(Arm) and boot/built_in.o (x86), neither of which get named here.

> @@ -407,7 +417,7 @@ $(TARGET): FORCE
>  	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
>  	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
>  	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
> -	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) MKRELOC=$(MKRELOC) $@
> +	$(MAKE) -f $(BASEDIR)/Rules.mk MKRELOC=$(MKRELOC) "ALL_OBJS=$(ALL_OBJS-y)" "ALL_LIBS=$(ALL_LIBS-y)" $@

I'm always a little wary of using double quotes when it's not clear
what exactly a macro may expand to. Single quotes at least have less
restrictions ...

Jan


