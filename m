Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C71720665
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 17:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543191.847943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q56ro-00010K-St; Fri, 02 Jun 2023 15:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543191.847943; Fri, 02 Jun 2023 15:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q56ro-0000yJ-PO; Fri, 02 Jun 2023 15:39:04 +0000
Received: by outflank-mailman (input) for mailman id 543191;
 Fri, 02 Jun 2023 15:39:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0ON=BW=citrix.com=prvs=5106ed88e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q56rm-0000yD-Hf
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 15:39:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9793989f-015b-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 17:39:00 +0200 (CEST)
Received: from mail-dm6nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2023 11:38:54 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5698.namprd03.prod.outlook.com (2603:10b6:303:9f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 15:38:53 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 15:38:53 +0000
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
X-Inumbo-ID: 9793989f-015b-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685720340;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qYxJroBmejkzKcho2q8kWhMQ6CfhU3M6FV6ElBdG6xI=;
  b=bmUhinz7w7TASZKbMkyCtHCyQwej/F2DgwPjLdZ4/nSPGi0DYXRgC25h
   tMWZoU13rcLXswn2xZbDvbarofJWTljdRlL+ihmEHKTa5xEbCx2hHvy04
   A9PIMGnh7WtXgLTSecD+dDuc++fIbU0hbn10MDpve6azOc2Rk2QYRjBvi
   o=;
X-IronPort-RemoteIP: 104.47.73.46
X-IronPort-MID: 110142828
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23://T80KNTFRkT2rjvrR2HlsFynXyQoLVcMsEvi/4bfWQNrUokhDUHn
 TcbCG2OafmOYDPzLdoiYN61o09S6pGHxtFgTQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5gZmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uFYCz9i+
 /AeFDAmUw+Otdy/y+mLacA506zPLOGzVG8ekldJ6GmFSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxvza7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWxXqnAtJIRNVU8NZosUSY1jI5AiZVblW7i+eai2yufNB2f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBQQ5b5dDm+N03lkiXEoglF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:GCh4pq0y3RCMnV56vpG9swqjBJkkLtp133Aq2lEZdPU1SL38qy
 nKpp536faaslossR0b9uxoQZPwOE80lqQFg7X5X43DYOCOggLBEGgF1+XfKlbbak7DH4BmtJ
 uIRJIObOEYXWIQsS8j2njCLz/7+qjgzEl0v5a4856wd3ATV0i/1XYCNjqm
X-Talos-CUID: 9a23:SuStom45EhRLBekXrdss82EeROwrfnvhzFztPEKKN29iE422YArF
X-Talos-MUID: 9a23:3x8RtApTGl28kQwgzzAezzNTLcx4vY6kMwM2n5UspeqFFzxXOR7I2Q==
X-IronPort-AV: E=Sophos;i="6.00,213,1681185600"; 
   d="scan'208";a="110142828"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjFs5kAtTIcQ+4hJfMQ5fnfh+NE258mi2vDOeB7IEx2X40bzfA2ylBjhUhHhpmdwkG/1+XpmmjmvnIMCIhipMNeo0YxTcoLQcUXm9gPHj5l8uoKNIdV+3tzb7khtoC9YVcQ80bzk9NvmBEx58WaKsPmgYJCpTQpteOF8QfATBv8FgwT4sN/m+eQDU4bp4efPD6FY8/5uN7twCztLGW9RavMpHejNumxPuWLTmPzpbwtLuuzYY840UOd6nSfClipwWs7LAUO4MCOhF9DhJK0Bpenyb19pY2NUCnjsddEYWw2/VSnCM+vUZnuX9v/gqRjB2exJAEva1557xy+FIxi+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYxJroBmejkzKcho2q8kWhMQ6CfhU3M6FV6ElBdG6xI=;
 b=DY19MnxORgU6LhvhRqnthDuCR/v8zQ6wsJXGCxYXiAOLsyUix2gBuGMqblF87dPtKkwFcTBvjmjr/nulBw4KVgXBkQCA70wu2dnVXG07lZeKPJL+pgzYaVlO0EGD0074gCiU68eBS878w3eXdCxee99sxbBwDhZedNs4kE7Etmjmi2TeREY3UttgLledNvfqCAPwc+FNJ7Uq+tjXkNOuxOw4D7l3yqVcwGvqaUKh2ARa3pNAIyMmFO6W7CyFqu3lYf5gHwhxLl2U7DawZqP6h0qkThCgGRp75fzLaxyfY3bGeqNdasjyOTXP+QP8xM6Xl52GbfhWAIL/abRABCk1fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYxJroBmejkzKcho2q8kWhMQ6CfhU3M6FV6ElBdG6xI=;
 b=uQr4ictqcNecMFYGdjvdFLQljNJTI0e/SmrZkLF5tBc6j16bumYWBihH14pTMz4hewaf0Rz0H/o+KFefCq4eNTRHEA9jGcKj6IT3pIxZ4li2barkGgf84xKmznbtmeN68I4qAcLX3KkdQs0AR55pxflHPBghoODTUaa+5FPWpSw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1987e108-3ab6-4971-78cf-0e7ba5facc04@citrix.com>
Date: Fri, 2 Jun 2023 16:38:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/3] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
 <20230601144845.1554589-4-andrew.cooper3@citrix.com>
 <1ce6bd53-089e-e8ab-3b54-2720a3fd2c12@suse.com>
 <bd03669c-66be-a64a-e73f-a80f372a6484@citrix.com>
In-Reply-To: <bd03669c-66be-a64a-e73f-a80f372a6484@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0034.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5698:EE_
X-MS-Office365-Filtering-Correlation-Id: 295ca348-bb91-43f9-67d8-08db637f77fb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CNcqsGKZvNob5ANj9ZhJu28Cvckg8NPwnWunY0Hl3CM/Os575GRTJ41Ad6y5mloJ+SHbDIk2BWNsDLlW3KIbRMGSDqyvsgCwn+8uSg/mOpbrZxUrosjxuWmwCtgJHExmqmEWHXvwnI4uZ0FXW5Vq5IHYUlPDC3mbT1eiL4aMWB9V2COwv5Uh1pzbW4FMw7B8MbFV8rDa0aql7CQFUeLJvm4NrgmoLIXTU4PgOrOmBdZ22FUhRl8ViDcv/i18sDKkjTIhRiGxFbTaB8j8bOqVeRG2OOnsIgipK44HlMTHaG2xw5qrMxep1cCIID8hsWg3X3UR+EksprhHVI5KuyXvqbAlxbuhZHxLq2E0noe8k+5awrDoDCJISD5RdGj96PWhrl3VCXjZkOrOiNKA5BZEk557o36m+tExOywvhyWqrneX0mUZwbPwkGqQ6YH4MiZOhuQw5rCsE8SjCA5hW98dY1z4scGhgR5LP2MLS1w0CcvgNP5esKNxnFVQ6UaS4/5lwFl3n0L6WYeaK3bm2FWfTWnLOE/2zAaEJ87GYNwx4DcS4ZxNS8fPs2R+IErQh3AAgk9wYtvjn5lN6emNERlQYVT/g7Zy/UJY01vcUCK80rLOSPg+kGqkvwDjiOPOG5EUX1Tb6UTgRSynChV73RD3Kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(66556008)(66476007)(4326008)(6916009)(66946007)(316002)(2906002)(54906003)(31686004)(41300700001)(5660300002)(8676002)(8936002)(478600001)(6486002)(6666004)(36756003)(26005)(186003)(6506007)(6512007)(53546011)(83380400001)(31696002)(82960400001)(38100700002)(86362001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlJOQTlrbDAwU2dsZTdReE9qb1BTTWFiaitqWkU2M3ZRK2FPTm5IV2dQSDVJ?=
 =?utf-8?B?MlNYcmFTOFY1cjV5cmhhZjVOeEpKcm5seEh0cmYxR2x5dUoycTNNVzlZN2RX?=
 =?utf-8?B?bCtoVUdsOWRZdnhqV2pXQ2JhRmw1UlJtK2pmdXE0RGV0UXUrRUpvVFFnTEZt?=
 =?utf-8?B?ckM5ak5COEJyRnJaL24rR3RHRjVJWE5UZ2pXSEVSbEo1Y01xSXNOa2t6bEhr?=
 =?utf-8?B?UkpQaXFWbld1MjhOSEdvOXE3UnhNK3pQVUtxZUZGb0J4M3o5eHdMRFc3TTMv?=
 =?utf-8?B?R0M1Sms0enpuN2NjT2grOEFoa1U1RkpwSWQ2Y3NXanYzOEFlV2l1RUlyZ2V3?=
 =?utf-8?B?R1NiRVpzcjBndzFFWWNEaGlmY04rYm9DaW1ZUmtHTyt6WHJ4STY4cmxNWEhV?=
 =?utf-8?B?cTBkZllUUjR1R3ZJclhpSVNBS3ljeXVrL3pQcFNRSVRRMHJ3bGVmVUtFRkty?=
 =?utf-8?B?ZitBMWNVbzNtaiswRDFBZ0w2WHhXZ3hZbzBRV2JzN0VKdzJUQmJtWHlWQVNO?=
 =?utf-8?B?bkpzRmVVZ1FaeFVvd2k3S3hjS21lUWR4bHNsLzF1TE5xL2dNc3lvdEJWNVFh?=
 =?utf-8?B?U2UyUkRKSGIzSW02UENNcW13WlAyTXU5ejY1SXlrcDBiTHpSZ25LSDQyRis5?=
 =?utf-8?B?SWtIRkpwQzdxcHpLKzBPelZKNjVEMlQ4dWk4S1JzbGJYVWx0T3hXaG9YbjRp?=
 =?utf-8?B?NDgxTEYxMEViVkY5UHJ1WGxjclJFVTRHekthVFVzRVNudHJXWWV3U0tiUm9U?=
 =?utf-8?B?VXc4bkY0dnBVYWd0UUE1bnFTNnZwcGVJQjVjRGk2bHFPTTNtRnZjRE5yRERo?=
 =?utf-8?B?QWc1UU9Xa2ZLSHkyUGRMb1RvNnR6a2daWHR2djdJNkc5bVVsdzZlZk1KTGNk?=
 =?utf-8?B?TW94emJDZVRkVlY3R0Foc25rVlVwSlAvNHRjZ3RtNndrS3hOQWFLLzI4aHRW?=
 =?utf-8?B?U1M1TUJHazMxUWJJcGNjT1Npamg5ZnlaMURUMUJMdUgxbkxiYTBnVlpoVGxw?=
 =?utf-8?B?YzVMdk1kU0kyNzlUeE5KK1RWakF4S3A5NkptekhqVHVBcUxIV25jNzRTekhw?=
 =?utf-8?B?Z2Ywb1NQMmNrYXRBUExZRjBhYzQxUDRZYmorQjV3RUlOSnBwc3c3eUNldFhW?=
 =?utf-8?B?RzJsNVczZ3c2eDlVc3ZVbHdpZ3FHV0pCRzB1U0dtT0p5cEhOMTRmSEEwTFpB?=
 =?utf-8?B?d29Uc1hVT09WWTBFbTMwckcvbnVBZC9tcGJnMUZzT05HbC83aVJldU9xNGNi?=
 =?utf-8?B?N2Npa1JUamxabnlxMHJ5UzBXZjBlRVFsQVNHYW1Ya0QyNkxqU052dGdRSzY4?=
 =?utf-8?B?bFY3MEM1by8rNVd3MEx6S3FUWXcrQncvOTYxV004ZnpWZGsyMVhqb3VVaVVQ?=
 =?utf-8?B?OS94LytrNi9PVW9hMWYrZHNqQ0kraXNQNmZKSjlrQ3FFKyswdmpHTkd6M3Zj?=
 =?utf-8?B?aExIdHBUWm5ONlJaaW9ET0dETTZWS2xJSldTNHJ2M3JOVW8rVzFETEpRZDRl?=
 =?utf-8?B?RU1FazNjbWkzRUZ5dUxIQ2F0cFpOS2tiNkFuTnNTOGlRRmFzN3NvaHlKQ3pG?=
 =?utf-8?B?RVExWk5OMkdUZS9MZ3RrUXJuUkRZWDFOMjNadjV1L1p5bUY0U2VJQUdodjhp?=
 =?utf-8?B?Y0pqelMwNzFxbkdTMHB5K1l3OW5nb1hDRXhkejNvZ09zUnhGd09rU1ErTWtx?=
 =?utf-8?B?cHpCRjB2K0ZrMDJ0czhmY3JYL2sxRlJVNVpNQWFWc0tXK29NeFdMb2lFRk90?=
 =?utf-8?B?TkhXMWxOckVLVGJOUkltL1RpRUlrbkxxWnNBK25HdUl6alpWUEJNN2NvaXdm?=
 =?utf-8?B?UC9ESVgrSVBmTHZoTjNxSVkyTGxiaGR2aHA0eFp0eW42Yzc5WW9KVnhHOWo5?=
 =?utf-8?B?SExXSVljRlk3YWdvMElxWVFEOEZSWEd2NzRlZnFhVWNiRHBqVlJYSXR0SGJp?=
 =?utf-8?B?RTZYb3d1WlRXYXNsMjF1R1ptekpZWElOSEVsOVZmWGptU0RBNVZjZDFxT0V2?=
 =?utf-8?B?QWF5SWVOU3ppUWxKd2t6N0pZNXFnMDdmNGdsMlR1bmtFcFNvV3VoeUI5eTJh?=
 =?utf-8?B?ZnF1ejdPZDFEOS95MXFNQ1JIWDFxeERTVFZ0blIvZGVmMWpYY1BMUVdSRVIv?=
 =?utf-8?B?bDBTN09UQkJCOTI3eWs0aE5YMmQ2U20vYjFMZFd5V3grTW80WCs5K0pYcjN2?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KYRIK155lvdrHadWR8T9FrmXiAFd/+ecv09dwLT1NnOR5n9racMORKvlDi5RH/O8GtwinxbQIxnHH8cRvz9GGzQaRRQ8FNn79XX5RtEEyMlfnMXWr+UgbAn7cpLNbu47dLIhdmTJ07NtAVz0l8AFhguzU2tWmFhbUzG5Uoy5fh2Unt97KCC1mxNdge/PyzzC3FO1qKnfseg5APzMxO73isJFPif6r1Jupj0kAWDn4bGzq8Skf2IfeT1BUPnKoAVqh2i9yTDOfnqvISYLvhTmPIQ23ffCZs6WZ0Hk+wfhki8MHFzccPPxfBNh0lKco6JyTfrfC2bvYujTz8dbeXMXZpZmOGEJpxUUvY7SRU6maHBln6GrGD4idMrWwRFaOotvgAg9JiMpvkD8C8buJs/O4Uz/LgQwVcvr+/eFKFI9A4RjiVsCTVs8D49EqwNvO3g9xsRuiRmV3ocggUeFdEms6m2qBN7aeW9kwT5tgyyU3NDY1Mo3d6ihNAtZddWKVis5N1HJlOtM+ofjhFYPiI6MVG7pvjKV8zd4RcQxOYvD/pkWnxUuk0nZsLzf5768BxqQlFKHCyuTUkEqv+JolnySjW9j3+pJK4GI8WNhE8X0bLqx/HtScFsSAWh5oW7QhueRXjwmMwo+qydjW/4gYOOxEoga9AY7Lqkvy7PMLM8692Uvw1xy9aSewUiqaRwf8yzngdYy+6jI2OKPvDSQTHKXKufMARKQxxry9aYtRPegcb2noZHJTaxRiZOfhTJ+JRmyXqlhi2RJuJVDCzCIOBV+N3FMkq+Zw1SufegxaMSXlVgLIRVMPDdP6HM/8pp5hwQm
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 295ca348-bb91-43f9-67d8-08db637f77fb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 15:38:53.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgllkQMKhLbyMlOvtxHqMLJJAg7rZvFnlIu9gcpDu35hk76TWP4vMTIyxr6NJdq3bh9bYzNf9n2768aIhPGtNJQvFg/wp66nPdXE8DKhTyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5698

On 02/06/2023 4:29 pm, Andrew Cooper wrote:
> On 02/06/2023 11:20 am, Jan Beulich wrote:
>> On 01.06.2023 16:48, Andrew Cooper wrote:
>> What about a tool stack request leading to us setting the 2nd of the two
>> bits here, while the other was already set? IOW wouldn't we better clear
>> the other bit explicitly? (Due to the EIBRS dependency or RRSBA I think
>> this can really only happen when the tool stack requests RSBA+EIBRS, as
>> the deep deps clearing doesn't know the concept of "negative"
>> dependencies.)
> Hmm - I think there is a bug here, but it's not this simple.  I think
> the only reasonable thing we can do is start rejecting bad input because
> I don't think Xen can fix up safely.
>
> Xen must not ever clear RSBA, or we've potentially made the VM unsafe
> behind the toolstack's back.
>
> If EIBRS != RRSBA, the toolstack has made a mistake.  Equally too for
> RSBA && EIBRS.
>
> I think this is going to take more coffee to solve...

Actually, no.

I'm going to delete the hunk modifying recalculate_cpuid(), and move
this patch back to the meaning it had in v1 which is just "get the
policies looking correct".


It's still not supported for the toolstack to request ARCH_CAPS (the "a"
marking), and the safely logic for that can come in a subsequent series
along with the unit(ish) testing I was already planning to do.

~Andrew

