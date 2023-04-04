Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E196D6E33
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 22:42:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518136.804362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjnSg-0001mI-Qp; Tue, 04 Apr 2023 20:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518136.804362; Tue, 04 Apr 2023 20:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjnSg-0001j2-Np; Tue, 04 Apr 2023 20:41:02 +0000
Received: by outflank-mailman (input) for mailman id 518136;
 Tue, 04 Apr 2023 20:41:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjnSe-0001ig-Gd
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 20:41:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff4003aa-d328-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 22:40:57 +0200 (CEST)
Received: from mail-dm6nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 16:40:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5080.namprd03.prod.outlook.com (2603:10b6:a03:1ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Tue, 4 Apr
 2023 20:40:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 20:40:51 +0000
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
X-Inumbo-ID: ff4003aa-d328-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680640857;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OcfyXQakXa/Js9T7ldqQkijECtim2exxVgrREpNG/r4=;
  b=TUR/yCv4mOIAz/Lqa8cCNKL1teeH1Ar2Mu6E1Muz1r9yPRWFW9BL0Vq3
   Ajx6inXcUrKSC3LIcZ5BvYRHGuZ7fYudZtuamcje1PcdUvmumdDClZyuF
   pPvD0uSMxTF6Y0my1Uy1jxlwkQcOQLPHMtQPftxmcphcJSzgPDi/B6TOj
   A=;
X-IronPort-RemoteIP: 104.47.73.42
X-IronPort-MID: 104360082
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ErVnjq23vtZHkFjmCfbD5fFwkn2cJEfYwER7XKvMYLTBsI5bpzMAz
 2VKUWGAMqyIZjOje9Bwbti18BwCuZ7UydFrHFY5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gBmOagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfAlpk3
 NVJdgk2Y06gmPC9nre4Vusyv5F2RCXrFNt3VnBI6xj8VapjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6PlmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHunA9xKTO3inhJsqGfL9jFCWCI9bgOQouuZrWj9Ve8Bd
 nVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4J5oflqYRr0hbXFI4/Suiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAszA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:xw4ARKiWntTJhn2buqE+FBoHDXBQXgYji2hC6mlwRA09TyX4rb
 HUoB1/73TJYVkqNk3I9ersBEDCewK5yXcN2+gs1O6ZPDUO21HYTr2Kj7GSuwEIcheWnoRgPM
 FbAs1D4bbLYmSS4/yX3OD2KadG/DArytHPuc7Oi11WZUVBbaV46gdwDQyWVndxWBJNCfMCZf
 mhD4581kOdRUg=
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="104360082"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDD7Lo4ulL5XlkD7IBdPqELv80gFlCsQk5bIvQqJUC0S/iZ49ZmUwIYxBEOW8n/BdnD3Kyyklo7ZwlAIZ+gWZqp3t21LyQwClzbmfpe6/jpGDFoG/V5wjy8kJ+ZBd3ywbo+lfnb9disbQKF0arcCYyL1KGSca2qWlbyDY0itKQaw8DprHheZruf/gaIuJ+r1BHW72sp+FzT8NWIrD9H+xihupgpALEXglqx7YwIjJNpt6LbXDLQ46ol4cC3JGLSlx4zItTAnTcWLH6pceuknR/1nFmOi613JGX4cSWoINa9bi9pP8IJMQg16B1/yIWfjiCbV0gWDgfAuJ7+cdyQHDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKY0pwn6ZmXRuUf4xs2ZJ/Z+kpIVH1u23Ydggy2dA1g=;
 b=ELbxaJHSD+s/lc2W70HNi8YXaJhEjXt7TNn15AydiYWBTaCBHCFdB3al3VJxwNK78c1JhYD3DIMMzOqbYKwf8lMZ9hNyqydt6Lwr108wh98nH//CXTJTD+PBd26UT1vZ1EyarcHJqRWJP2ez0EnXJ4xzt56ycDfNnE11kV+wLR4suCPfHs0ha/qxWMJa10iGom50AEjJ9DsaGWCuSXZWpiRHZOzJ2ezPupZyILaQHyr1V3FicfWZhYmhrMH4lHxzpR6xkD5YMuEH6evyDQL8zh3RlyUF+ikwUfi4aCoPYeywFBqxO5r/s7xPcDP7MXNJ1PP0CyBWbBfMa51nH21W0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKY0pwn6ZmXRuUf4xs2ZJ/Z+kpIVH1u23Ydggy2dA1g=;
 b=igwCiu7Vzps1m5JGPnEDqgXvhOxLAw6l0a9gXXUEra7ay5onT+CHFyUOTQu//zbjKUhU+Zr4HqXayLFLLq+vjAd7noiitqCLnuyYUCxtGArnh0WU6+snZbaAYKeqcmBHQYL0nq/RgPeZ8vUHqRZMi02X/ylctTQzyaIiEnKGE+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <78e72635-6ebc-b3b7-83d5-134d5c63d561@citrix.com>
Date: Tue, 4 Apr 2023 21:40:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
 <6d64dd4a-5b25-ddca-5c07-7b4c0fc48c0c@citrix.com>
 <5f9218c1-9ee9-c5bd-af8b-003084aa66e4@suse.com>
In-Reply-To: <5f9218c1-9ee9-c5bd-af8b-003084aa66e4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0368.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a4647d-0572-4568-dc69-08db354ce052
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N+C1yuUiLaz+J8lOgSnA/GjcN8V771lkj+/TLTxTXoLPUi5P7P0ej27uOt9hjdnhEKwyEGDmcJIKPhvhAvo+zdu5EjU/6Pp2nTy2L5vJg9vmTpYMo9zgZEHhj2jr3TPJDannPs5AJUV+w+jnLjkuzZJxiWfKLyc+hwuKsCE3cfo2Q01ovMjnAeaAtfs1CQPrcohVDECx+y3Wj9+uYjP4wuytRbkhi/c8OnBG2ESiWr7UlPHNxkduVQYF/jbg+FgQMJcmPjigMAn3NlF+6jZOAZr0L9LSyCVOm7Oo/g3EDjfkBbNCOr/QkIz4wsyNtg7Ch3kN2AfJrmXdD9Owa1rTGPhOB9gJ6TeUpE3Q4/OFOJKq2PJaM47LxPH+2lcjh2pE1IiH4ztDUjRZ0YLVnesVP3ZrSTXLhiUgNfA9y+iji/Bc2kwlsRxgv/MiScGWXSg0vYqQdY3iCDdxUvTEHHjsCJwSQ0bZdaoQon884xwzYaPCw4zwSLCmmsXTr0qlLwiIWGh3OTXDPNfJhJtKqrQeohi8XJhPUq60RIT/xzjHlUoIMAmN3pgi2+ueRK+IhQcEU+st6XJG4HTxHZ4E/ZoOYYwKdKO/SiLL56M2e4fvKIWftExgRp5uA6KzkzIegm0WZt5X5RqviLoNrgH7gxfZLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199021)(31686004)(36756003)(316002)(186003)(53546011)(2616005)(6506007)(26005)(83380400001)(6512007)(6486002)(478600001)(86362001)(54906003)(6666004)(31696002)(6916009)(4326008)(8676002)(2906002)(66476007)(66899021)(66556008)(82960400001)(8936002)(41300700001)(66946007)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVdRR2FkeWtpaU80blFsd3JnNVZLbG9PZjdpbmtIS1BhNmtaRU01cjFTZE1T?=
 =?utf-8?B?ZGpWelk1YnRPanF3U0N2WWlnMmlGK0ZRdHl2T1psaFNKR1h6S3ZTOEhBdkFL?=
 =?utf-8?B?OXpPbEREWHprM0dWZis0T3c2dEduU05PLzdmNWJaejV0ZitBQTNvQnBKZjZD?=
 =?utf-8?B?Vko1TFJpWmJlekdtcHNzZTBQK01DWDg0b1E4Qk96MmZCUHN6MkVTUHgyNUxD?=
 =?utf-8?B?Qk5TdG95TnVoMURMSWkzenpENUkydnNjSFp4aFNrZ2VCNTZoWWpIQ2FsNGhp?=
 =?utf-8?B?Vitoa1BnQ3dDcmREQU1IcUtoc3FXNnpQSSs4TWhGVEVtY05NbWljeFhjVkl4?=
 =?utf-8?B?OW1kdVpYeFkzcURXNkJqSDRJWVE4QTJvVGhDRUVZS3E2T2toempxVTFLWUZm?=
 =?utf-8?B?MzlnMjZ4UlprRjlTdk5wRmFnK2tNOUdsS3VCeEtOeUdDR0tIV0xTUHpYczRt?=
 =?utf-8?B?aU1XOGQ3OWIwcUxJczFXRGJxOTlrZjd6NzNHdFo4RGZmRWdqbnBXeXV0QnNt?=
 =?utf-8?B?UVVrQU5Ob0RaTjFkWUc3cUpDWG1HcDlpVVRSVlUvcGZTc3J6RkNlZDRWOXBH?=
 =?utf-8?B?bmg1VDVjR1NrQmUwN1MzZFZoajJ5cFhzZEVlWmlELzZHRVVPVmlYNGNIZ0xU?=
 =?utf-8?B?U2RqK09NWnh3amdST1JYZXZidFZMUVFBS0ZSaGg2bi9wQkpDMTl4N2RZQWNj?=
 =?utf-8?B?c2dUdkZpeDA0d1pkY21LYUNzV3dmZ21lNWovdG5vNUc2RUhLTEFGdlI4eVU3?=
 =?utf-8?B?MURpL0x2NjFYbFZnT2diN09MUVRlTUlyRlhJRHM1VVNQMDRkV3A2dHZHUUov?=
 =?utf-8?B?dWI4bGlLS0h4RUxiUW5hNS8vb2NLY3hFTitXeG5NSGY3aHV6S3NuUDVWdUVG?=
 =?utf-8?B?ckFFTm1KdUlOSFBpR0tHL3c4OTdFbjNSOEJRTWdDa1RyRTIzWlBGZFVJRkRj?=
 =?utf-8?B?ZGdYR2FKa2hJblM3V2xHRXY5ZFNBZjRmcmV5VzRhWWFubUhVRDdWK2FOOXdS?=
 =?utf-8?B?Nm9yZ3NaNlEvZ3hOUDVUbmMyNkR3MndHeU9UR0NwTVVjWWlRYVZjT3VUc0hs?=
 =?utf-8?B?U0E5eCthRHV5RFJjbTh5UXVYRnVtOTExVFVXU1JCNGZsTzJZNEVkbWF1bjN5?=
 =?utf-8?B?NnFoOTJONEhmektnclRZRHkzL3R3THZlWnpaNHBidEQvNHM5cU55WXgzU0cy?=
 =?utf-8?B?dElVN2ZQS1dTQ01DTE1TT3B4czEraFpUQ3liL0pHTFlYM3FQc2dUakhOTUZY?=
 =?utf-8?B?d2tWeGxKT0xMNWFGWWl2d1RzSHNqdGk3enBRRWllblRiSndmTHRlWEFCdzBy?=
 =?utf-8?B?WlFGN1lxUmdzQnMyVGhxaEFvOXlmNUV0cGYzbDJhWjhTbVltZ2U0RG9QWVVV?=
 =?utf-8?B?ckt3eEZ2bENwOXBsWVkyZGhhZVJGYWdmQnVvUk84aGRUVUE2aXo5TUdJTHJB?=
 =?utf-8?B?bGcxZXNjTnh3RFl2cXZHbm9pc1JBQkdDMzBnQ1ZmZC9rT2pQcmtxZ2FTT0ZL?=
 =?utf-8?B?R2dXMEhZQUJzMEdrN0tWMEhCc0x4VHluY0hKZTdId2ZQMlRORmZyeEZXRnZW?=
 =?utf-8?B?V1hqWjV5SnBrWG9EeWZrcm5heGFnOWVSS2JIemFWeHRKYjFPelBscVk0UEMx?=
 =?utf-8?B?QTRraUZXKzF0NnNRZFRYQVZRbS9SQ25CcWd0SFdISHVxclBsejEyOXJzVUxN?=
 =?utf-8?B?VXhBSFpPa2hSMHg2dlhNUVA1c202Snl3U1owNHV0SE1KYllHUUNyYnI4aC9s?=
 =?utf-8?B?MVRNTFZOcElGcWx5dmdqU2tWQ0VtY0RMWDhsL3BUMmpjb2NWWjc0WGV5eVdj?=
 =?utf-8?B?S3dEMU50ZGZuZkgwY1FqNkkxQmM2NUZaTTlxZEtWWVBPQUpSajJBYWRPdTJF?=
 =?utf-8?B?ZXR5aEdXZ2VuRHZBOXNCUDJpNjIvblJQcWR0Qjc1WEZpb2ZiUjhZZVJSUDdm?=
 =?utf-8?B?UmdvbTAxT0xjNnNSSDVOOTNRclp5cm8xSFlpSXZtOXF5QkxkV01vdENKdmYx?=
 =?utf-8?B?aThLNXpzd2hZREUzanpLaGV2TDhJSFppSFljL3d6TENUS0ZLVU1sS1plQWRx?=
 =?utf-8?B?ZmUyQzUwNHkvWWFaTGZhY2VudjBDdm5UUzQ0cmdHL3kwdGt2VUg3TGJWa29V?=
 =?utf-8?B?NDZUR1ZXanozZlR2RUlVYlpuY2NoQWFWRzBsem9uaEZGcjU3SjF4MVNIcVB0?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6XNVG3yMzF3X3HVo6+rS9+NescXcz6MpivFJdgbZM1/hESOMKmT+JxUoV4xxGx0yngg1c5SpVE63eW7AGm06nMORCKnVmKskQO+DfWHr+Qr9ZFmTYHSc/rBZJgNt02KLrlOn2Q8lvC3qE4Ui3DL+jXwncdTkTJ0l9hQdbB7gM1Bu0MPRGQ2uIqyFH0lQrMwCSVvca8UJvUMRxelzG0f4IHPIOsux0KuHlVW9559h/CkyZuFU/ph6it1jJ/p6pUnVkvuRrvYmWT0ebS2bMQFA+5I3k4WE18liTvC3RhYCj0y8yvNj0MsRTcL4OXZ/jx/LcZQpnkLe6Etn/Ckr8TamKlX1B2tdbGkL6pTqoQn0F2jTOjGHpRv9gmDHMt8mJkBPVbwbhWzTVTcix1cZTSq4LDfBxkXDXwektkD7A8nQdltyYZGNYglrtnciH4F+qjz6hWUp2E3tpWbY8fm08JZrFv4x8JZEpiABwrOVzdhhtCM44uCAiY6xt4fYtSSYr0kgcNVTl98Xrx7cyyw48P76zAMm1qVxS1PBNW1YAQbhzHSGugWkcjwaV4W6/lqiJYlcqmVbaDWKuQx5JttCapnxf7tDi9+fZv5Wx279sDSj325e1F0ibBrE4fo8G4MlcaC14KyvJi9vREoaXl7vnYthWOcOhbuDyaNemNhpj887F9kN7X2NHnefjOprIndwW1EmCPMnhVUALKqYav56w92xzdccsXLQpgIn7tz9IZ31H7jqadDbQPqPYwXR5obEFL1HhCbswmi+YiR5y9cZzKjdS5z3Z14Mb0nrhSW3FP4m+xgLwAHaCdYxXOU0XkS37qrV
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a4647d-0572-4568-dc69-08db354ce052
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 20:40:50.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEdlN5k5uNAlP4wjMv01l2s/bDL3zNg0pXn5LMMNqZb+nwvL4SPOqcmBMqXcB3jHaExtNPHqOqvc41MC6Zfq1aaUS1BEqSzGoV4dYsTyd0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5080

On 04/04/2023 3:21 pm, Jan Beulich wrote:
> On 04.04.2023 15:08, Andrew Cooper wrote:
>> On 15/02/2023 2:54 pm, Jan Beulich wrote:
>>> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
>>> applies to guests also when run on a 64-bit hypervisor:
>> Is this really true?  Even when looking at Xen 4.2, 32bit guests are
>> required to pass a full 4k page, not a 32b quad.
> The full-page vs 32b-quad aspect is orthogonal. This VM-assist is solely
> about where that data structure is, not what size it is.
>
>> Which makes complete sense.  It was a hard requirement of 32bit non-PAE
>> guests, so it was a natural restriction to maintain into 32bit PAE guests.
>>
>> This is *only* a 32-on-64 issue, because this is the only case a 32bit
>> guest could in principle use an L3 placed above the 4G boundary.
> Not exactly. 32-bit Xen maintained a 4-entry "shadow" array below 4G
> that it would copy (massage) the guest entries into upon CR3 reload
> (just look for struct pae_l3_cache in the old sources). So above-4G
> page table base was possible there as well.

Oh eww, so while Xen never gained an optimisation to permit only a 32b
quad in place of a full 4k L3 table, it did support having the full
tables higher.

(This code is especially hard to follow with #ifdefary in the common
mm.c when there are perfectly good x86_{32,64}/mm.c's to use for
differing function implementations...)

>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
>>>      unsigned int   partial_flags = page->partial_flags;
>>>      l3_pgentry_t   l3e = l3e_empty();
>>>  
>>> +    /*
>>> +     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
>>> +     * understand the weird 'extended cr3' format for dealing with high-order
>>> +     * address bits. We cut some slack for control tools (before vcpu0 is
>>> +     * initialised).
>>> +     */
>>> +    if ( is_pv_32bit_domain(d) &&
>>> +         unlikely(!VM_ASSIST(d, pae_extended_cr3)) &&
>>> +         mfn_x(l3mfn) >= 0x100000 &&
>>> +         d->vcpu[0] && d->vcpu[0]->is_initialised )
>>> +    {
>>> +        gdprintk(XENLOG_WARNING,
>>> +                 "PAE pgd must be below 4GB (%#lx >= 0x100000)",
>>> +                 mfn_x(l3mfn));
>>> +        return -ERANGE;
>>> +    }
>> Having dug through source history, I see this is largely the form that
>> it used to be.
>>
>> But I'm unconvinced by the "cut control tools some slack".  I'm quite
>> tired of different bits of Xen taking on unnecessary complexity because
>> people are unwilling to fix the problem at the correct layer.
> But anything tools do before having created the first vCPU would not
> have had any means to engage the VM-assist. I.e. ...
>
>> A toolstack which has non-pae_extended_cr3 guest on its hand will know
>> this before any pagetables get allocated.
> ... this knowledge buys it nothing: It would need to move the table
> to below 4G irrespective of knowing that the guest can deal with
> bigger addresses, just to get past this check.

This just goes from bad to worse.  It is mad that the VMASSIST flags
can't be set ahead of a vcpu initialise hypercall.

But.

The code in xg_dom_x86.c unconditionally moves the L3 below the 4G
boundary, so the thing actually pinned as an L3 will always pass the check.

Which is just as well because it too blindly applies the extended-cr3
transform momentarily after conditionally setting
VMASST_TYPE_pae_extended_cr3...

So a 32bit PV guests will pass the check irrespective of their
pae_extended_cr3 setting.


I note looking at this code that it's absurd.  The single L3 ought to be
allocated with memf(32), rather than being allocated regularly and then
reallocated lower if it happened to be too high (which will be the
increasingly common case as it's getting harder and harder to find
systems with <4G of RAM).  Making the memf conditional on the
pae_extended_cr3 needs to come with some better xen<->tools APIs.

>> For this check specifically, I'd suggest prohibiting non-32p guests from
>> setting pae_extended_cr3 in the first place (I see no limit currently),
>> and then simplifying the check to just
>>
>> if ( unlikely(!VM_ASSIST(d, pae_extended_cr3)) &&
>>      mfn_x(l3mfn) >= PFN_DOWN(GB(4)) )
> Dropping the is_pv_32bit_domain() check isn't possible because we can't,
> all of the sudden, fail 64-bit guests' requests to enable this VM-
> assist (no matter that we know that it is of no use to them).

I'm not so sure about this.  This VMASSIST cannot credibly be set at
runtime, and making a restriction here is not usefully different from
prior patches of yours that relax checks in Xen that still break on
older builds.

But as I know you're going to argue with that position, I'll at least
note that ignoring a 64bit guest's request to set that bit would be less
bad than the current behaviour.

> Dropping
> the control-tools part of the condition is at least problematic as well,
> as per above. Albeit I'll admit I didn't check whether nowadays vCPU 0
> is initialized before page tables are built. But I think it's more
> sensible the other way around: CR3 setting (in the hypervisor) is less
> involved when the page was already validated as an L3 one.

All of this is before the guest starts running, so it doesn't matter.

The most efficient way (from Xen's point of view) is to pin the L1s,
then L2s, then L3s and then set vCR3, because this is the only order
where we don't have to do do recursive type acquisition.

But, the most efficient way for the toolstack to do this is the opposite
way around, because making Xen do recursive type acquisition is faster
than other ways, and turns all subsequent hypercalls into almost no-ops.

I doubt there is a relevant difference between these two approaches.


And it doesn't matter either.  The check won't ever trip from domain
creation (see above), nor from migration (we set vcpu context before
pinning the pagetables, and a non pae_extended_cr3 will have exploded on
the source side).

So there really are no toolstack codepaths that can trip the check. 
Future improvements that might trip the check can come with a less
broken hypercall as a prerequisite.

~Andrew

