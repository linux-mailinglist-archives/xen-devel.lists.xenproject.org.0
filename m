Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8B6BC3AA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 03:15:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510293.787705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcd8q-0000KI-3l; Thu, 16 Mar 2023 02:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510293.787705; Thu, 16 Mar 2023 02:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcd8q-0000GQ-0N; Thu, 16 Mar 2023 02:14:56 +0000
Received: by outflank-mailman (input) for mailman id 510293;
 Thu, 16 Mar 2023 02:14:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZp/=7I=citrix.com=prvs=432965e83=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcd8o-0000GK-4s
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 02:14:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 529820b5-c3a0-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 03:14:48 +0100 (CET)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 22:14:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6799.namprd03.prod.outlook.com (2603:10b6:806:217::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 02:14:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 02:14:24 +0000
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
X-Inumbo-ID: 529820b5-c3a0-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678932888;
  h=message-id:date:from:subject:to:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=SGz9sDxPwn4WJtbyTJw9Xkod4mr9I7KKp/WsQcQhP1M=;
  b=NNeTfGZhtlvk9hd+6VuGrglPc3FLeWAnGHj/MWarEmCXpNDKD/OIHSX+
   VUFN4yKOyLFpX7L7MBnK5HmWwVr04UZXYpo6Z8dPeLj9PlIs3oBb/xqlv
   pep6C/4+y3bgzYBvMU9dERlQdiT1W0hjRwkGa5tXmLXOKDAryKGGbZxq6
   o=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 101047866
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jaH4Oq5JiaSt8UQ77EyoFwxRtBnGchMFZxGqfqrLsTDasY5as4F+v
 jQfUWyBb//YZTTyfN5xboW09UwEvZLcztBhSwZlr31kHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS4geD/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 dgbAihVPz+6vdm80bDqa8hmhf8aM5y+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+eF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKTeXkqa403jV/wEQ2EDAKD2Gru8O2yXKTaYhUc
 10t+gwx+P1aGEuDC4OVsweDiHOGuR4aQIYAO+YhrhuKwarZ+BqUHC4JQiMpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4P5YnlqYRq1BbXFI88T+iyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAszA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:JLUlyqO+BnBZfMBcT6H255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN9jYgBGpTnmAtj7fZq8z+8P3WB1B9uftWbdyQiVxe1ZnO7fKnjbalXDH41mpN
 hdmspFaOEYZGIS5aia3OD7KadY/DDuytHVuQ609QYIcegFUdAH0+40MHf4LqUgLzM2eKbRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVorFgMq8w6HiBKv8frfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIihm9UYMTLljyevfcBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhNV2dkF/I4U3NwTwu43jtxRuxhmbim9XwQHYfB9BajYxUXxPF4w541esMmJ
 5j7ia8jd56HBnAlCPy65zhUAxrrFO9pT4HnfQIh3JSfIMCYPt6rJAZ/mlSDJAcdRiKobwPIa
 1LNoXx9fxWeVSVYzTwuXRu+sWlWjAJEhKPUiE5y7mo+gkTuEo841oTxcQZkHtF3ok6UYN46+
 PNNbktvK1ST+cNBJgNStspcI+SMCjgUBjMOGWdLRDMD6ccIU/ArJbx/fEc+PyqQpoV15E/8a
 6xH2+wjVRCO34GNPf+n6Giqnv2MSeAtHXWu41jDqFCy/zBrOGBC1zHdLgs+/HQ0cn3TPerH8
 pbA6gmc8MLHVGeZ7qh4DeOKqW6CUNuJPH96exLLG6mk4bsFrDAkND9XbL6GIfNeAxUKV8XRE
 FzEQTOGA==
X-IronPort-AV: E=Sophos;i="5.98,264,1673931600"; 
   d="scan'208";a="101047866"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPDB8wnx5nfoTF6CrRw0if8ag3pWsJDZjurTI2wehUPz+Y+IgcjSQXGNz753L01aSx8HDmbaeZ/XME5SGA6Szyy4I9PgHT2xq+bMUFefppEswGWeeo2Xg0ltQWUeo/jQKWhefaZzwNUyiN80f5KBo9c21ZUZYnmyCDxaYt5D+EZvdWW2ohcnolZq7bWCjgMY8HV2XKG5AKrh2UrPP/yca+98leljHueNcDTHgez6C145ErqAPjntpLdwL8XbU29qL48AHxDi6kJiWKdM/OqSlV6BDlwJ3RYYpMIl41s27u9Wog4FRLmjOHVnO5bTrQcY0/T/gTQzx2oD0H5eNVqogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QP0VdVBVqws/+eJbfob7qVU0nZJWMshbnqGKQ3VBgOg=;
 b=iMdbROa91kTREG7Oef0QfMDeLckeaA+zpP5PgpiGCo84py9sz8avI2jrBGZGbmD3AV+4iMKA4N8Bb2oqeKliSwApvTPsB+10IardsrrQ4V0iUJswqIy9CkM0pJvr8tG+sMfF3mPUtR30jh2iUBzDWYiLjMN2MwViJcSg7aG8/YyXt24TgYImAmL9OtqxuOUc2JgprpYmQJ+25jT1IW+7+v/5woYvyYciQc4WPzon4wsm5e6ZekqOfUO0dPhm/Kj8TVEMFYESLR4Irx2HwNhLJJNeAcMXm7Oy6VxdPYm3uymnBKoys7lJ+v9TDT0NK7arAcndhYTav7NlrkwWqTCmbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QP0VdVBVqws/+eJbfob7qVU0nZJWMshbnqGKQ3VBgOg=;
 b=wMK6cYS+ZtG32zUM1IfFaK9qHRcGeDdkYbi6L50/8URua5shII3eI5azG0ZmvPGsf6Cc2CTE+EQWPdIQ1uBeU7/Wjsa3fvi2cu5xAnXKPaIM3wH/5PCDLnR2U/f6TAVFrhsnZI1pi/pW18MfeCVaHhk7YgSX2zukeEsAfv4mves=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a1a814cd-9a76-9828-ffab-5590fcd5925f@citrix.com>
Date: Thu, 16 Mar 2023 02:14:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Best way to use altp2m to support VMFUNC EPT-switching?
Content-Language: en-GB
To: "Johnson, Ethan" <ejohns48@cs.rochester.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <MN2PR07MB6045100322F58085DD6B1488E4BF9@MN2PR07MB6045.namprd07.prod.outlook.com>
 <c12ff321-e1ad-1377-2158-195594fdbe04@citrix.com>
 <MN2PR07MB6045B965DD2DA308C55905F9E4BF9@MN2PR07MB6045.namprd07.prod.outlook.com>
In-Reply-To: <MN2PR07MB6045B965DD2DA308C55905F9E4BF9@MN2PR07MB6045.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0234.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN4PR03MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 5433289a-66ca-4e15-d6da-08db25c42965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rsC8Rv1Nne4eA//yDICrpgOAnrBjMgJ6oEpGg18xqCCcm/JaS+APLmVJecy544J9gF3Ic/HMfI4e/E88kQ3U8X8DwT9ZjNHWrP+K+ag9Q+4QVgbsn6AcRiCt+Kkhcjjk3pUsTe2IxglzpbeP8OMYJEkfIG+KjX/Gj4v60nl1THVMfBPgE0CCpcJd4T3YRj0/YrVqR5R2Yk98elP+k9rtdedBMJY1kEjAwHR9o+ntnTkLDJ9NmT2j1jevGzOzzDy2mTwq6w8m+X7aZetO2LzVDO6F6pOeylAiFFjhajsEd0Tie0lFFuOLd8a1E81TTjLWpN1bDemS3pgy0Q4hkkagS8LhAACTaN4f7xjF8ENTdwFYRXwcodUcjvkRVvpQ1ulRSKp11heo80bwR5FyIMa3+Os+jmKwcHca4yDbmeS7CCCHBTTbbOmIn0kDXnhciYR4duEIF2/0SnsuPTZK8jl87NIDmpcAoSKNMXIK4g7inJcdTIJHS+s0+6ycsVuah46p4HYSydrf0GSSU2/3hrpFQEgbs+fYFY9zgv4nr1VSfzuwAX5tW+iHEydw3SmevweSDNxHmR9JND1NuerWi47csJXEoXmGNUgvy2UaU5rksmGO/enMXbNGVcyxBgxTe53j76EgY75UnEfD9gvTm6+24nx1Phh1uWhI0bwXnEyxbLMhAQwub859+DyDg9wk6RVGos+GblY28SxPVv2YONR+1xUv8kNuLzdH8jRVUudU5Rx5N76ZCMPcMCtEh9Ihouhn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(451199018)(86362001)(316002)(36756003)(82960400001)(38100700002)(66476007)(66946007)(110136005)(41300700001)(66556008)(8936002)(478600001)(8676002)(2906002)(296002)(66574015)(31696002)(2616005)(30864003)(83380400001)(5660300002)(966005)(186003)(6666004)(6486002)(6512007)(26005)(6506007)(53546011)(66899018)(31686004)(43043002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFlERkp2UlJtV1owM05kN0tkd3ZFQ28rY2hpaG5FbE51NUV6bzA0WnltTVh2?=
 =?utf-8?B?dEh3ZU5PeCtLb3Fhdm45VlZ3U3ZXajVmeGFnUUlBUHpCSE1WYlpOVk5EVEFD?=
 =?utf-8?B?VjUrZUM5Q3ZXcy9BR1ZWc3NUTFJqZkFMSzRhV1VHc1pORTRQUlNxbDN5YmFG?=
 =?utf-8?B?T3lWMjdyMk4ySzJTWUxiWXU0Q0FjdEx4WHF4YTRVYk8vN3l0U3gyekh4Szc0?=
 =?utf-8?B?VzhmNnZ5RU9vNzN1OUFTSEFjc1dMOU4yY2VUNDZwWk52R2psOHdnRzJjNTg3?=
 =?utf-8?B?TE9zYUNUaC9ybzNxTFpEQlFQVFZpSC9HUXY4bWdMVlBTTVpmTWJmTjJQcm9y?=
 =?utf-8?B?SU5NdFVTWnl5UHFLT1RQN0lZQnJweWRDMDhwNEhWR2VVdUtqL0pSOWgxc3Zu?=
 =?utf-8?B?NklnUDI4dTBoSDBxTm1jV2MwNzZyS1hTTWU5TVFmV3RXK0ZwaWFzY0psSVY0?=
 =?utf-8?B?elBxSDJrTm5EdnBKM3kyc2d0VkE0ejlORVhEYWEvTHNDR01nOGJDRUExMUgw?=
 =?utf-8?B?RjlqQXBCZDJLTWNYaHFwQng0d0hWWGpScmZVR1FRRzRTV2hDVDJhWlV2SytC?=
 =?utf-8?B?cVpFeEVzUHFtMG9aVFNTUnV5bXVvNjRjYmJaQ0dRZzdIbG81Q1ErNFBpaDRD?=
 =?utf-8?B?LzRYSXlCTFJLdXp0ZDczRThoak0ySXBQRUFIcmcxNEwvcmo3Rlh1TFM3SUpZ?=
 =?utf-8?B?eTFDVlFDbndJWVhkc2hWNEVmbXJ6UXRGS09XS1Y4NnEzbitCWmRMT1pBc01H?=
 =?utf-8?B?Tjk4UjZFRGV0SXdOUDBhZHRXR2VXb0N2Uk5TY2xZL3RUKzN3ekR5Zi9DR0Y5?=
 =?utf-8?B?OTlLOXdKNXFWWksrTC9mY3NlbkdiTlBFN0pFUFJtOS9XbE9vRTAzczJwaG5q?=
 =?utf-8?B?SDdjODhKUzlQcWpwRDRJLytHaEQrOHZQNDBKNENEMTFJNlFYRjB5MzFsZjEy?=
 =?utf-8?B?VmluR2I4Sk1ROEVMdURrR3BSMU1rKy9PSExEZXh0NVNNWWdEQkF1b0hMR1Bt?=
 =?utf-8?B?OWtKdEZUdktIdW1ZTTdkaElQYUZpQW13YllMM0grVStNWWpNOG1RL3ZlS2l6?=
 =?utf-8?B?cm55all3ejB1OUIvbFpNZ29mYWo2Vy96czlJM3FhR3pXZnRWUXl6UXRCNytD?=
 =?utf-8?B?Tng3SDVBd0x4elEyS0x4cGZPR0xNWDdyQTI5NzdwQlFybWg2U2MyQ00zUkVw?=
 =?utf-8?B?RjBOK0xKcWpRdWRxU2dWZnVUVWw4YnZpeFVKdVNLa3NUSTBES1RldWFnYXFs?=
 =?utf-8?B?bGJla1Fld09VSEVwSS8vSUlsL05DZGVqMjQzWlk2Wm0wMVQvN0RpRi9Mamlj?=
 =?utf-8?B?ZUtmdDVYU2psRmsrM1NhOUhGV2tKV3FQWnBUVWF1aTRWUjFpcEJMRjlBU2Ez?=
 =?utf-8?B?elliRnM5Uld2Q295bklCV2lXT0Y3MXB3T2djU2lXNzdVWUk3b1hLMHRHcDUr?=
 =?utf-8?B?dTVjOGdVc0haeEhhbU04Y2kwTmFuV3htNnpUcEJacXJGVElITWUzRU1jaU03?=
 =?utf-8?B?Z0ptRWRFWDNwZzlqYnBEd0hQczR6UHZMcEk1QkdBY0gvbm9DSUxLdmRLN3FV?=
 =?utf-8?B?MFhVd1hhelZPZ0tYckEvY1ZaOEtiNWxZMG1RbmZQMS9Rd0UzMkJNS2FUVjZ2?=
 =?utf-8?B?d0d5LzJBMlRITXhOOU9mQ2Zyd1pDR2MwSFZOaGpDOHJvajkzQkl6Q1AyenF0?=
 =?utf-8?B?eVg3bTJoNkxSZjZwVjdjSFdta3hMZCtFZ2M5c1paQlFZZnZ4amZQUEFkNTM0?=
 =?utf-8?B?VzlSNTJtNXVrMmpBL25aazdaaUFva2JVNXlRSVlETmRtVVlkL0tRQW5mQkNl?=
 =?utf-8?B?b09ycFJJWG5mUWhBeHdwRkZ0QTRhYTE4NjNaTEpYS3YyWnNoYUNDNkdlbzN5?=
 =?utf-8?B?ckZZSW43S1lzV2h2Z1czcjBqaGJBZFVjSlhWcXdUVzNwQjRxWTd0NGNWdjM0?=
 =?utf-8?B?ZDJXWC96bS9IZCt0T01RaGtRdGpkTTFvK0QvZEd5SFpHZ1RxcS92UUFqSzV3?=
 =?utf-8?B?OXNCWURGazRWNlNqQklyOW5IbG5oZllwK01uZlg5UHF0RDVDT0xOb3NGdlo5?=
 =?utf-8?B?N1FCWmJ0WEJCMTRHSXpvVEdIeUV3VkxHZm5IM3NNUHUxRC82LzhQNjQ4S2xq?=
 =?utf-8?B?NEVKMmNpVnNWdTB0NkExa3RqaklyZDZ1aUtkYVhydlFvNEhyQkVJY1BMbnM4?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a0r81SUCwtmDEjwPcUesPwGF4j5i+UA2sHlW1qj2Keu362gOSm7SwkuckvBbcuFn6njUYJmC4PjeOzG6GFQbM9G/ciN8lv+D/43TyRrVtp5zgWoJLHdhwnMB27PGBrZZqEko8kG3wpXvWVxjVY4qqeQvpBjTMMVJl8C7SFiXwjlZ4HnZTRX25qOndbIg4CJANHwNjfvwDRoeYZekBQKrfnghEFtqP6tOwOQPbPiMQivg2HrWUfOGr4iIY7igWfG/KjcVmz2qXDZ4fMWAmZSqhYWt35ifL+wrTgHdOSiFEeIeyLv8K1H9/ucAPnJblkvUyVJ4Ob2zBBQWtyVR+4REeEE4upo3g96/AdPp4+wSd+iRyEVN4Ioh/SZeW0KHMdAuJgckQbXuHejwd/GL3ZuWMrTTF6NBIaSp2LPKCnwxurVDPSOH0B4ZknGVURBYLiDWS40vJpluQztByA2Sm09+LR7PcJtEH66LSpVlhhr8Ics10NWkJ2AhuP6E5HSMyw6rL3/DA/LMZEf+S42Rm42nuODu3qUnsz9fM8q9t5MJ1UMyQa5TqQkhW3JcxmDopX+30LMH/TmmcSwb9BgdS+o+ZfGOB92Vt4G4Ame04pyajk83VTCBzoMr2OU6E1iLWkia/lMd+iSJH8TAdj2aOMq2uJqtfkY6RihuHtAtIu9RUA8IMLRCVg9EEK2eA7gvlfGPHRVEHzQuT+gvliG/qy32FaUyEN4+aU7HurLLZjryVZQ5u0g8MeHCwKXkANCi66uH1DQsrsZOdIkZpgHSA2ar9Bf2r7sxqPP8er6/r128C71dBMWP8ZLRiO3gkHCYHD1r
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5433289a-66ca-4e15-d6da-08db25c42965
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 02:14:24.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i979m5poXe+s3YFEvTrIrSp4l6+R5YdXZJMcsG5GSf44ghrxsPAzNi3mO97aZc+PubvJTJChEQKGDCIb3GdrhHPZ7bqBys6kkDkBGp0xfkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6799

On 15/03/2023 9:41 pm, Johnson, Ethan wrote:
>> On 15/03/2023 2:01 am, Johnson, Ethan wrote:
>>> Hi all,
>>>
>>> I'm looking for some pointers on how Xen's altp2m system works and how it's
>>> meant to be used with Intel's VMFUNC EPT-switching for secure isolation
>>> within an HVM/PVH guest's kernelspace.
>>>
>>> Specifically, I am attempting to modify Xen to create (on request by an
>>> already-booted, cooperative guest with a duly modified Linux kernel) a
>>> second set of extended page tables that have access to additional
>>> privileged regions of host-physical memory (specifically, a page or two to
>>> store some sensitive data that we don't want the guest kernel to be able to
>>> overwrite, plus some host-physical MMIO ranges, specifically the xAPIC
>>> region). The idea is that the guest kernel will use VMFUNC to switch to the
>>> alternate EPTs and call "secure functions" provided (by the hypervisor) as
>>> read-only code to be executed in non-root mode on the alternate EPT,
>>> allowing certain VM-exit scenarios (namely, sending an IPI to another vCPU
>>> of the same domain) to be handled without exiting non-root mode. Hence,
>>> these extra privileged pages should only be visible to the alternative p2m
>>> that the "secure realm" functions live in. (Transitions between the secure-
>>> and insecure-realm EPTs will be through special read-only "trampoline" code
>>> pages that ensure the untrusted guest kernel can only enter the secure
>>> realm at designated entry points.)
>>>
>>> Looking at Xen's existing altp2m code, I get the sense that Xen is already
>>> designed to support something at least vaguely like this. I have not,
>>> however, been able to find much in the way of documentation on altp2m, so I
>>> am reaching out to see if anyone can offer pointers on how to best use it.
>>>
>>> What is the intended workflow (either in the toolstack or within the
>>> hypervisor itself) for creating and configuring an altp2m that should have
>>> access to additional host-physical frames that are not present in the
>>> guest's main p2m?
>>>
>>> FWIW, once the altp2m has been set up in this fashion, we don't anticipate
>>> needing to fiddle with its mappings any further as long as the guest is
>>> running (so I'm thinking *maybe* the "external" altp2m mode will suffice
>>> for this). In fact, we may not even need to have any "overlap" between the
>>> primary and alternative p2m except the trampoline pages themselves
>>> (although this aspect of our design is still somewhat in flux).
>>>
>>> I've noticed a function, do_altp2m_op(), in the hypervisor
>>> (xen/arch/x86/hvm/hvm.c) that seems to implement a number of altp2m-related
>>> hypercalls intended to be called from the dom0. Do these hypercalls already
>>> provide a straightforward way to achieve my goals described above entirely
>>> via (a potentially modified version of) the dom0 toolstack? Or would I be
>>> better off creating and configuring the altp2m from within the hypervisor
>>> itself, since I want to map low-level stuff like xAPIC MMIO ranges into the
>>> altp2m?
>>>
>>> Thank you in advance for your time and assistance!
>> Hello,
>>
>> There's a lot to unpack here, but before I do so, one question.  In your
>> usecase, are you wanting to map any frames with reduced permissions
>> (i.e. such that you'd get a #VE exception), or are you just looking to
>> add new frames with RWX perms into an alternative view?
>>
>> I suspect the latter, but it's not completely clear, and changes the answer.
>>
>> ~Andrew
> Yes, the latter is correct: I am looking to add new frames with RWX perms
> into an alternative view. I don't currently envision needing #VE in any form
> for this work.
>
> (We're using a modified PVH Linux guest for this, so rather than needing to
> intercept and react to EPT faults via #VE, we can expect the guest kernel to
> explicitly call our secure-realm functions via VMFUNC, replacing what would
> otherwise be some hypercalls out to Xen in root mode. I suppose supporting
> unmodified kernels by intercepting #VE could be an interesting enhancement
> for future work, but for now we're content to work with a cooperative
> modified PVH guest as a proof of concept. :-))
>
> Basically, the primary p2m will be (largely) as it is normally, and the
> untrusted guest kernel and userspace will run on it as an HVM/PVH guest
> normally would. The alternate p2m will have some additional private code and
> data pages mapped in (RWX in the altp2m, but either read-only or completely
> unmapped in the primary p2m), as well as the host's xAPIC MMIO range so it
> can send IPIs to other vCPUs without having to VM-exit. To facilitate safe
> transitions between these two "realms", we'll be adding a couple of
> R/X-permissioned "trampoline pages" that will contain the VMFUNC instructions
> themselves and will be present in both p2ms.
>
> Thanks,

Ok, so there is a lot here.  Apologies in advance for the overly long
answer.

First, while altp2m was developed in parallel with EPTP-switching, we
took care to split the vendor neutral parts from the vendor specific
bits.  So while we do have VMFUNC support, that's considered "just" a
hardware optimisation to speed up the HVMOP_altp2m_switch_p2m hypercall.

But before you start, it is important to understand your security
boundaries.  You've found external mode, and this is all about
controlling which aspects of altp2m the guest can invoke itself, and
modes other than external let the guest issue HVMOP_altp2m ops itself.

If you permit the guest to change views itself, either with VMFUNC, or
HVMOP_altp2m_switch_p2m, you have to realise that these are just
"regular" CPL0 actions, and can be invoked by any kernel code, not just
your driver.  i.e. the union of all primary and alternative views is one
single security domain.

For some usecases this is fine, but yours doesn't look like it fits in
this category.  In particular, no amount of protection on the trampoline
pages stops someone writing a VMFUNC instruction elsewhere in kernel
space and executing it.

(I have seen plenty of research papers try to construct a security
boundary around VMFUNC.  I have yet see one that does so robustly, but I
do enjoy being surprised on occasion...)

The first production use this technology I'm aware of was Bitdefender's
HVMI, where the guest had no control at all, and was subject to the
permission restrictions imposed on it by the agent in dom0.  The agent
trapped everything it considered sensitive, including writes to
sensitive areas of memory using reduced EPT permissions, and either
permitted execution to continue, or took other preventative action.

This highlights another key point.  Some entity in the system needs to
deal with faults that occur when the guest accidentally (or otherwise)
violates the reduced EPT permissions.  #VE is, again, an optimisation to
let violations be handled in guest context, rather than taking a VMExit,
but even with #VE the complicated corner cases are left to the external
agent.

With HVMI, #VE (but not VMFUNC IIRC) did get used as an optimisation to
mitigate the perf hit from Window's Meltdown mitigation electing to use
LOCK'd BTS/BTC operations on pagetables (which were write protected
behind the scenes), but I'm reliably informed that the hoops required to
jump through to make that work, and in particular avoid the notice of
PatchGuard, were substantial.

Perhaps a more accessible example is
https://github.com/intel/kernel-fuzzer-for-xen-project and the
underlying libvmi.  There is also a very basic example in
tools/misc/xen-access.c in the Xen tree.

For your question specifically about mapping other frames, we do have
hypercalls to map other frames (its necessary for e.g. mapping BARs of
passed-through PCI devices), but for obvious reasons, it's restricted to
control software (Qemu) in dom0.  I suspect we don't actually have a
hypercall to map MMIO into an alternative view, but it shouldn't be hard
to add (if you still decide you want it by the end of this email).


But on to the specifics of mapping the xAPIC page.  Sorry, but
irrespective of altp2m, that is a non-starter, for reasons that date
back to ~1997 or thereabouts.

It's worth saying that AMD can fully virtualise IPI delivery from one
vCPU to another without either taking a VMExit in the common case, since
Zen1 (IIRC).  Intel has a similar capability since Sapphire Rapids
(IIRC).  Xen doesn't support either yet, because there are only so many
hours in the day...

It is technically possible to map the xAPIC window into a guest, and
such a guest could interact the real interrupt controller.  But now
you've got the problem that two bits of software (Xen, and your magic
piece of guest kernel) are trying to driver the same single interrupt
controller.

Even if you were to say that the guest would only use ICR to send
interrupts, that still doesn't work.  In xAPIC, ICR is formed of two
half registers, as it dates from the days of 32bit processors, with a
large stride between the two half registers.

Therefore, it is a minimum of two separate instructions (set destination
in ICR_HI, set type/mode/etc in ICR_LO) to send an interrupt.

A common bug in kernels is to try and send IPIs when interrupts are
enabled, or in NMI context, both of which could interrupt an IPI
sequence.  This results in a sequence of writes (from the LAPIC's point
of view) of ICR_HI, ICR_HI, ICR_LO, ICR_LO, which causes the outer IPI
to be sent with the wrong destination.

Guests always execute with IRQs enabled, but can take a VMExit on any
arbitrary instruction boundary for other reasons, so the guest kernel
can never be sure that ICR_HI hasn't been modified by Xen in the
background, even if it used two adjacent instructions to send the IPI.

Now, if you were to swap xAPIC for x2APIC, one of the bigger changes was
making ICR a single register, so it could be written atomically.  But
now you have an MSR based interface, not an MMIO based interface.

It's also worth noting that any system with >254 CPUs is necessarily
operating in x2APIC mode (so there isn't an xAPIC window to map, even if
you wanted to try), and because of the ÆPIC Leak vulnerability, IceLake
and later CPUs are locked into x2APIC mode by firmware, with no option
to revert back into xAPIC mode even on smaller systems.

On top of that, you've still got the problem of determining the
destination.  Even if the guest could send an IPI, it still has to know
the physical APIC ID of the CPU the target vCPU is currently scheduled
on.  And you'd have to ignore things like the logical mode or
destination shorthands, because multi/broadcast IPIs will hit incorrect
targets.

On top of that, even if you can determine the right destination, how
does the target receive the interrupt?  There can only be one entity in
the system receiving INTR, and that's Xen.  So you've got to pick some
vector that Xen knows what to do with, but isn't otherwise using.

Not to mention there's a(nother) giant security hole... A guest able to
issue interrupts could just send INIT-SIPI-SIPI and reset the target CPU
back into real mode behind Xen's back.  Xen will not take kindly to this.


So while I expect there's plenty of room to innovate on the realm switch
aspect of EPTP-switching, trying to send IPIs from within guest context
is something that I will firmly suggest you avoid.  There are good
reasons why it is so complicated to get VMExit-less guest IPIs working.

~Andrew

