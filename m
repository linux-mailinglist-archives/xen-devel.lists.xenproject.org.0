Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC796DA13C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 21:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518950.805991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkVI0-0001XD-EF; Thu, 06 Apr 2023 19:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518950.805991; Thu, 06 Apr 2023 19:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkVI0-0001Uk-9w; Thu, 06 Apr 2023 19:28:56 +0000
Received: by outflank-mailman (input) for mailman id 518950;
 Thu, 06 Apr 2023 19:28:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkVHy-0001Ue-Ji
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 19:28:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41bfdbe2-d4b1-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 21:28:52 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 15:28:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS0PR03MB7201.namprd03.prod.outlook.com (2603:10b6:8:120::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.29; Thu, 6 Apr
 2023 19:28:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 19:28:39 +0000
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
X-Inumbo-ID: 41bfdbe2-d4b1-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680809332;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ysbyb9angYFcf8d8gX9w1IQesEb2r40c9lFWquA8ZKw=;
  b=aN520cBRMSY7/UbznaA7+N9daHKM68z4Krx59HW+lcc2WDj/Zrohv+vV
   Q2rfXtc+2AaF/wVpgKr9C8xhYU53y4y9dcsXQPf3LxdPsdcUzjTBr/n7D
   zb8JAVik2hFDOpBmgRGjLe2tvHsgVzN4LH8+5YFQxm8tBVa4oQ6W6OFHf
   E=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 103976512
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:llOviqOtrDpn/cXvrR2IlsFynXyQoLVcMsEvi/4bfWQNrUoi0mZWz
 GJOUDvVPP2JYTHyeY13bITj9k0E7J6Dx4JmTwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tE5gJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rxPB3tUz
 NI5ExEUS0+JnPju7oPrSeY506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCIpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxXiqB9xPTefQGvhCx1qo53ZLATEqTnjhg8OktVPkAdB1J
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACA4aud/qpdhrigqVF444VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTzgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:Zm3ewqieYkNIr1U+fYtkwF6w53BQX6J23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwSpVohEmsg6KdkrNhSItKPTOW9ldASbsP0WKM+UyfJ8STzJ8n6U
 4kSdkMNDSSNyk6sS+Z2njILz9I+rDun87Y5pa9vg4dNT2Gc5sB0+46MHfqLqQffngEOXNTLu
 vg2iMznUveRZ1hVLXGOpBqZZm4mzT+ruOlXTc2QzI34gyHjTel85/9CQWV0y0fXTRG3Ks4/X
 KAtwDi/K2sv8ihzBXRzXXe4v1t6b7c4+oGKN2Hj8AULjn2qgKwf4RnRpWJoTAyp4iUmTAXue
 iJjwYrOsxy73/LXmWtuhvrxizpzToo4W+K8y7+vVLT5eDpTjczC85MnrtDdArIzkI8sNZ3wM
 twrgakXtdsfEv9dOuU3amGazha0m6P5VYym+8aiHJSFaMYdb9qtIQauHhYFZ8RdRiKorzORI
 NVbf301bJzSxe3fnrZtm5gzJiHRXIoBCqLRUAEp4i8zyVWtGoR9TpI+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQM8cXMqMDHDXSx6kChPNHb3eLtBWB5vxke+q3Fx13pD2RHUw9upppH
 0VaiIGiYYwE3ieQvFmkqc7smGffI16NQ6dj/22rKIJzoEUf4CbeRFqkjgV4oydSsUkc4nmsr
 6ISeVr6t/YXC3T8NVyrlTDs287EwhTbCXj0uxLFm5m5Pi7cbECntarOcruGA==
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="103976512"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnxF715zXNCxTFOsqJDp/sz9voXh6/aWCSn2BiI+gWgJzMTyOWxY119jV4zEJxLwNU/hCXefI6TvHw510maiSM4xaDlpXlJl3xYFLRV0exYPSDB33gkf6maHhfGTCoI2oq6DaugwHJZteApY8FGRsRGV0DcCAusBuKyORw7IQzkNXmWVypq8sSeINAe3c3+72ljN4VbZfyK2bY5tzeywacZk3sNZt0kHfU1ObDPckEM+IkknxVcC41P6cVUvMmcrxna2GtpCqOVb9WDLFgfeZhnsUHgSs604k0oU8mX0+hAn4qk6jKugRVtfT6oZU877b0W5VwkB3258WdDGujkkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TTQKdhsyUGU4bjLTQMm7FDlgUpl6toPSRU4SGT/cwo=;
 b=gnsZxey7SuyabkwBr5ZWiDKHnSylpUIQLtxTOjQJp9T90th4Z4rMsErhPR3AfRjk9v3WwqLEFMMCqQ6v21aNr5IroPpnzFtiBihuesyEBHlO/nNqlD3f53Pw3my1SUnHynHHhnRVVKRpmg1FbqAxuKrDf5X3BFrHCigAK/y9628VqfY4OPhyvwbVGqPUJLAqJEseRMM7IBdrPq4Km3u6L/uEhRKaKU2/6uQkm+g6rMqT86o26ixZw2ZLYZrZQfT93KCZm0zvK+m2RCH0KUAB0ELWtRICutg5EWaMdgmPbyG4TBaP1yqQSMa7wTp8Vj/7+iBeN+TJOkdfXldZeNWZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TTQKdhsyUGU4bjLTQMm7FDlgUpl6toPSRU4SGT/cwo=;
 b=xIfynxckhoLEpmcIXF1ztwZCkzo+gP6+dOqk4HnO8MIUZQ8tqeJZVLFpGOIohAgP/LzC5LhI+mwoj7FbOGn32bdowK59UY1P1jEXmyP7ZBKH7e51wqaHzKXcxFdjfpApAQXWD+rwhzRDHUHc221sHiq9vo4TwynJytrhqAKZ3n8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c973ddcf-506b-8318-07cc-bb177541619a@citrix.com>
Date: Thu, 6 Apr 2023 20:28:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/9] x86emul: support CMPccXADD
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <7fdf882f-0667-e0f1-8183-2dc1a344f4fb@suse.com>
In-Reply-To: <7fdf882f-0667-e0f1-8183-2dc1a344f4fb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS0PR03MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1c643b-51aa-48a1-eba7-08db36d51fdb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mwJpRKwVuIYZgXlXzkztHuhArta5CYQougG/+UwA3P17I8GLWS/I+mVgA7WAR/LSkdC/DKmoOkSLzzee7r8syb1MN/eBO3LwlBHNfHkaccsLn+7ayo/sjjMwPPpPALgt3uh0GB/p7gJ9uQirf87xZBXqv5/dXYp6fK9VC7dat9fp9aEb9yGTSgrowjHXCrYuvOh7sXCzQNrvtK5Ifg1XjGg338kpykuHFK97iu5zP1CLnbABUJ2gQob+zD2nx4XhSbWAv5j0RhnJz3dCL3IBInFjIQqIbO+LyT3AS83ZXrGwGzh+ujJ3RZvRIYtMsMTDedEB6zS5IxbJV4pyUmoFcuAYBsHeVbRf9Hb+ThJRh/zRY1VCwF3LuyFnqF95hxdr9aNxskGpOmoi0mhO9hD6OXTCtUbjA5UQIo4/3h7pTAubM7KbedKpxiDpQ/CQzvtGgTu9w2oVFPR50r0DKB6VYpvzer1JOk0Miy3slN4ewC/NjjCW0Vs+3iCaC04ZvQjoJsgNgi/x2q3cFspcQkfirknTTW9GXG34lW+y8JriwRfOpvXYpM2XiNmtcueLvlS8xQ+QLMDs6B/ZNSajXbm12ZfqeCogDQhzh/DWWs4i5e2c4giObTruuEuAeeG+NFViyOaVe30MFqXk4dVwfvHKfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199021)(54906003)(66476007)(8676002)(66946007)(66556008)(41300700001)(5660300002)(110136005)(478600001)(8936002)(38100700002)(316002)(82960400001)(4326008)(53546011)(83380400001)(186003)(2616005)(6486002)(107886003)(6506007)(26005)(6666004)(6512007)(31696002)(86362001)(2906002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXFiekFaQUZPODN5V0MrNXBRRm1xdWIwSmVhdjQ4UERSUkYvM3hKQXNYTUYz?=
 =?utf-8?B?akJ3bldTOFZKWENLQnUrUDZUQ2FQV1YxandJNXNhaXRiSVBwcE9wRlJsaFVT?=
 =?utf-8?B?T3Y0cjBFRmxNQytRdytHYTBidEZFVGQyaFRvREI3eGFRU1p0NzFXcXlVeU5t?=
 =?utf-8?B?U3RvMXE0aHNMSTdkZXIwaHp6NEdZOU9iSXYxNldWVWNaTXRXYUdnZ2NNejlD?=
 =?utf-8?B?Rys5WW5TMWZiVHpvMFRFdG8wM0txTU5QYmNiU1k1L1kvOFg4WXA4cm5hWC9D?=
 =?utf-8?B?c2k4U1NDS3JMTFZwSWFkaW1PTHJ1MnIyRVFEZFdjYWowRXJsUFltWmNaRWZy?=
 =?utf-8?B?cElvQ1E4UVZjSmZCZE15ekZEOGk0MFlIMko0MkQ3SGR1YktwZDM2QWh6ZFZE?=
 =?utf-8?B?TFg3anJTTlRtcXZqWGdFb1FxRXpJSWIvUGRnVHl5VjlGWm1RaGRLMEYxaEth?=
 =?utf-8?B?OExoWEdoTGluQWlPQy9ESFAzdHMweUZtL01XaWtCdllQdzAydC9idE9VVjVU?=
 =?utf-8?B?ZVZUYmdrMXFHd2NNSnU1UUp6dURZczhDYVR4NCtRbllMcmNyak82QmkrcVFE?=
 =?utf-8?B?QkxSeEcycGVWWUVTb0pzN2dDQW1EVjExV3ZneHhoaXlUaE80UkdRUmN6Z1Fj?=
 =?utf-8?B?bGs5bCtXb05jZXB0UjRsTS9HN0hHaWFqV2dnR2RoaDJtTEtPc3RRRlRMUzFh?=
 =?utf-8?B?WFB1L0JISDg3djlreDlYTkhuQmpRR1gvR1NIR3duaUNBTGk2MHorSjVJK3Qx?=
 =?utf-8?B?elVYWmZyOU9ySmJvbTJOTU9SMFF2ekJBb3BOdnk5TnVOQ1MvYlBFTzV5WHBO?=
 =?utf-8?B?WTBEKytab2RaQ1U2UHdES1Rad0ZRUE5LQzdReXJURmdaakU3V3BlZDBOUW9x?=
 =?utf-8?B?NjVSYTJPcjVVUzIzRGVLN3IvM2ZmVk9QOXhrTXU2cXFZU2luNmhhNzRLWkZY?=
 =?utf-8?B?SXZiSEcyblk1RmR4N2lDN2Vzd3NzSWg5UXNQMGFFZjBYdFlIR0xIejdYOEZD?=
 =?utf-8?B?Q0VXQkY5dXFpQ3o2THhsQk1PdjYxay9raW9pZkgvMEkvcXVVdDlYUXRQdVk5?=
 =?utf-8?B?bWpWSit3K0FUSS81UUwwclhVOXN2QmFZSzl5anJyQittNWNmejNqY1A5ODdP?=
 =?utf-8?B?VHNnd0F1OGhHUDdJVmNjeTN3STV1RUJObS9uVTd3Y0IxdTRXaDlVVW5aTEVP?=
 =?utf-8?B?K3ZHWmxVTVAzVWw3NDNXeDR2cWhoNlV6akJGRUZXMUhYK3ZHSlhNajJjSFRu?=
 =?utf-8?B?WWs2ZUg5K2k1T2tJUXhWZjRhQnhLVUdrczRMbDBPUXUrM29ac203dHppODdH?=
 =?utf-8?B?NzFaeG5zZE83YWJGVFprRW55NmxWZkxpU200VzlMeTRJU2dTVU1rVitHWEtq?=
 =?utf-8?B?RFhuRVllL3VpN0tyUW5VZ2pKQkhOWnRGRFVMNzhzWFBMaVJGVnlud3hUOFBv?=
 =?utf-8?B?bkV6NE5wRzh5ODB2VDdsaDRGaS9Cc1NRSWpncTFSNjRXbGpkcDN2ZjA3eDdE?=
 =?utf-8?B?b3lQbU1DaDVJcW9iUXNVWWRVK21WcXFOY3k4c3JXeWJDcTh6WjlrTFo0ei9V?=
 =?utf-8?B?cnRYZkRhbGlXWVF5UWo2N1ZLeU5Zdjl3VHFZQmtOanIxVUlUcm93VGZoV0pu?=
 =?utf-8?B?Qm5pRkQ4Y21pZURSRnVSOGpoV0FJWC9ORno2Q2N2ZExEbFZ5SmhHdmJmcDhS?=
 =?utf-8?B?OXhVNGtRK0FJdjlROHNNT2U1NGM5TUhEVnFuYjRja1VKdG53dHNlQWFWRmdl?=
 =?utf-8?B?ODRVMHRRNC9WUllGTXNDOERrczFhL2R2TG05MG9RQWNISnBIQXlOcHpleSs2?=
 =?utf-8?B?MG1FT2tveUo4N3hGd2VKTnpya0h0Q0h0ZjJpTDZmdUk0THdLdVVaZmFrNkt2?=
 =?utf-8?B?MnRjajJMUTFLcWtybHFDeTdMQjI5MExuaHozWFpKbk5oZFgrUjVqOU1yWDNh?=
 =?utf-8?B?UGFheUhhRzRTd2JEQUQyZ0MvODN1VlJEZlhWeXA4eUVhQ0tNTmJkL2hJdldX?=
 =?utf-8?B?MUZZUm9EbUZ6UUV2Y2hYQ3BkTGNEaGVwVk1Qbytlc3FQZHY4ZnM0cXV0bzJi?=
 =?utf-8?B?WloyTXRhU2hESFY0Ym9yamtSUGN0NGdOeGpoc1gvYlV2bGJiNGpKQndOTWg1?=
 =?utf-8?B?QUp2Q1Nwc1ZoYUp1d2UweXY0bVlPSDZtdWMvY3pYeTJoSkFreU9qWi9UbE9T?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DtvDwWUnzh8p0g8U4acjxSarlHAKL1LmnfeIYrFJkZjzB8/edXsHQ+9AkmBE2PS361g+tmBLNOCvUV+qY4747ckBgc1GQ+1Y8X12cwpU4BK6VzQk10IdZd3Kl/JOEqXmkcdmeyIBj8cm/gIacH293PKab+NZ3w5Q8rqjT2I1GNaBPl6ge8FKTRoWG61nI1jfLn1peaRJ/ZHci5GxbiqV+ZPUZkkW2mcPZ3eaB56kDjExebM4TLK929fzY+AmUe4+y8JHhJAz/Nh//gsV2OOZgZ3xfq7cjNN/MvYZpQEaqcjzz2bI3qI6fm5WlOoiE4Fa7YcJsIl/EFMYDk5pUt80txRWTuVphFpzYk0ro8JgjbTT8rD/v6MAjErRIiEgOXpQASpjAQn3fTFWKpS+4iQmemUPDq1N3EDxuVple00KzIdkihPBIkVEPRpuQdZrZtzlWpnjW0XalV3y2bIuI1NTBQWEexSzP6zuuUsqjTZq9nwo3GB6kFQpfY9nq4OV/1E6trUQNTWXvln7v4JBPOjosiUk+OoNtmo5VZX8/jWbbii01tpSiWkXYVyr7jWwq6Y8hCmoZwWGuN7gEAj/jL6+Y6yy7KxBOSGIVdMWE1Wrxj0Sk9CErp1YGNj8dZFoLqzBELfsu2LM/UNAS7UgxNYkNnK2URXKbkuoX5SmkuCms8zo41oDCax2tMH7XtHPwso1Flk/Qo/VvEz7FZlu3j+yZ1jqO2bEkmei6uxPiCfWeUlFKpEifMFEDvTQK82DfeTSqCuAFijx6R8/2GNZea5+pvCPyzw9bVzTdgo6c5LvmVzgMfyGzXHPa5OylrRl5AtC
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1c643b-51aa-48a1-eba7-08db36d51fdb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 19:28:39.6531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZcVm6bR9aqFiNuhK1cwmyI3C/tnUCI6hyAXhgoU8/wtiV+wFHd0UTyrpl1D0xLCvZF68PnzH7CJNOHX8d6C/b9DbxS2YHvRc7x3KlAgkTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7201

On 04/04/2023 3:52 pm, Jan Beulich wrote:
> Unconditionally wire this through the ->rmw() hook. Since x86_emul_rmw()
> now wants to construct and invoke a stub, make stub_exn available to it
> via a new field in the emulator state structure.

IMO, patch 5 should be re-ordered with this, because it removes one
incidental change that's not really related to CMPccXADD.

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> # SDE: -grr or -srf

The ISE makes a point of noting that CMPccXADD is implicitly locked,
like XCHG.  (Unlike XCHG, there isn't a valid reg/reg encoding.)

Right now, the xchg emulation overrides lock_prefix, but I have a
feeling that's stale now with the rmw() hook in place.  But it is
dubious that we let xchg fall back to a non-atomic exchange if the rmw()
hook is missing.

Either way, I think it would be nice to clean that up so we don't have
differences in the handling of instructions which the ISE at least
claims are similar.

Tangentially, what about the RAO instructions?

> --- a/tools/tests/x86_emulator/x86-emulate.h
> +++ b/tools/tests/x86_emulator/x86-emulate.h
> @@ -934,6 +935,8 @@ decode_0f38(struct x86_emulate_state *s,
>              ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
>          break;
>  
> +    case X86EMUL_OPC_VEX_66(0, 0xe0)
> +     ... X86EMUL_OPC_VEX_66(0, 0xef): /* cmp<cc>xadd */

I know the style is a little mixed in the emulator, but

+    case X86EMUL_OPC_VEX_66(0, 0xe0) ...
+         X86EMUL_OPC_VEX_66(0, 0xef): /* cmp<cc>xadd */

is more consistent with Xen style (because it's somewhat of a binary
operator), and more readable IMO.

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -278,6 +278,7 @@ XEN_CPUFEATURE(SSBD,          9*32+31) /
>  /* Intel-defined CPU features, CPUID level 0x00000007:1.eax, word 10 */
>  XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
>  XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
> +XEN_CPUFEATURE(CMPCCXADD,    10*32+ 7) /*A  CMPccXADD Instructions */

Given the non-triviality of this instruction, I'd prefer to keep this
"a" until we've tried it on real hardware.

~Andrew

