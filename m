Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 444504ED6E6
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296788.505295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr6O-0004pk-6X; Thu, 31 Mar 2022 09:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296788.505295; Thu, 31 Mar 2022 09:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr6O-0004na-3K; Thu, 31 Mar 2022 09:28:24 +0000
Received: by outflank-mailman (input) for mailman id 296788;
 Thu, 31 Mar 2022 09:28:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZr6M-0004nT-ML
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:28:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7292411-b0d4-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 11:28:20 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-TiCOUE4PPRu8QctVnmqWFQ-1; Thu, 31 Mar 2022 11:28:16 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8381.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.22; Thu, 31 Mar
 2022 09:28:15 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:28:15 +0000
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
X-Inumbo-ID: e7292411-b0d4-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648718899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bhcTZPk3ON66jS3JUnkpyJ9uYUPk4wx08SNsWwtQTYQ=;
	b=GDo529fQHjhYbZHSyYOGQi5vLqgKz/7RDupMNHnF+d9BQxXP1Vy7lIdd8O6nCzhdynpi/S
	RzFbgXJUcb3dx1lAEGAH+H2alXjCfPdcGBtnAYUU773QT+DwvldkL4JL3rnCCgi0LBlqj0
	i6vxsxzG6wNnujmPJwYjy2pCZPnWcAY=
X-MC-Unique: TiCOUE4PPRu8QctVnmqWFQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyqjTRz50wpSNCcMl3PpWmom3yYyNE+9q9jDLPUHxs0KKcB2jmD2gAAEHsmCuluvZcwWV72vrKFmVqrFCFdVEAvnbuGEGdpYKiVa17hgyZppBmlm30/h8wz3P7RpnRUW6na6qXf3fsRn1uWlqehLaOAA/BfCdXVs3jFGzAC3BmG62tsihTO2xGbEyONcDn+/y0/ALHOeY/BtyQUySBopGs+3v8peR0ioGkM/D8pXYcakYPPAQpxYDGpp4AKccvAKpW7rC3XoApyOInwLob58LuGJbT2YR71JFPNwNa6ZBtcYltoOGT/n9O6iEjl4mOMwQlMelpZ6S+1mvWNVidabww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhcTZPk3ON66jS3JUnkpyJ9uYUPk4wx08SNsWwtQTYQ=;
 b=G0s5rcQnaYAdLaNHiUIVMYUw2xxtNCYqMIFGv8OHNC53HPh7kE8ZR3jo7qybhwY9km/xXIm4rK9TRVz7m8KaAEfVIqYNYxNZC/vYwsVgb3MYzaY+k765yu4pAS/tcc0oB+S4N3l8tREPHDYTiUqNwjRkQZJxs3nnkcvefKQ2MmLlrpwwpmO2QGj65XeqsQLrEkiKaLTMOfbAsPzfb3TBYZ8LgEwC2Ph2BJbnGH/nQK5GTfKGlyH388fmflrfZIFQHC/97OxKt7i7m7wA7uNdSujy0tYfLloE6liEjVWOA0+KFwBhdXGsVqMV2ezkgHcMgYp0T1JDn1+fCM2+HRG73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
Date: Thu, 31 Mar 2022 11:28:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/4] x86: further time/APIC improvements (and more)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e08b399-dbe5-4ac0-18b9-08da12f8c842
X-MS-TrafficTypeDiagnostic: AM9PR04MB8381:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8381E06C41F5E3EF364B9387B3E19@AM9PR04MB8381.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IEPf6jtdx0E8lG2CrFBIRhZAdHQbq4O6YYEmPAXqOvURWKBMHKqQrObtywU5kwQB/00vsELK9rZRzq8BJjT/7SRMAQsGSji3YyV/ZIQobNYW6MlyDq6M3h2J3jWZA+OEGmQSxoNy5ZK7SSGERo2a8cpXvW1ROVXQBS0eXELIwF47M4HLb/JyN7rqTSss57Yq0PDY8YO7q1ODZQKphg+BWce5AnF3ugfARMSr5Ieu1JIfEm5b6O0vzN/05wBcAYklhMRv05sreFDSihTD0KcXKDuPaNz/2r4hmehqudQX67JThIbT/LpaxhRA73ChBXJdfhmwcqsecs2I+uY4hxUnQjKlmCi7XjyKufKYRCp34nHBstoucW2OZGwNu95ePGSr7mDhNQV7p8JD1+SShpociOyajcmiiOeiKQwXxTKMRb+BOqRJcF8UNRLonG6tBUMNIP50W+78vRPwafra5JPKzrcA09cSw6a5DBVobqaqbnk/5HAD30RuCPFWcgDL+S2kS+/86Lwva8uQp6n1BF3lq4CHD203f3iwTehldmXkS0sydOUem95TrMxKmgukP5f8bk07vr9Dm4FCUdXprMFOcL9ZhCqf2a7LQkMd6Bb+JWQsfnrdJ8Um5CCSYPk5Mfh7nT+hkZg1V8an3VoLJqEDedpc5k8pS91VlOEYiZbc7RuoWapmR5bq+Ov6yF1PSDcvzGPlacdUuUUziFgw7A03n/6hc78ON1OaN3c+Js6HtOU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(4744005)(8936002)(6916009)(31686004)(31696002)(316002)(4326008)(6506007)(54906003)(36756003)(38100700002)(2906002)(8676002)(66476007)(2616005)(86362001)(5660300002)(508600001)(6512007)(26005)(6486002)(66946007)(186003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXVPRExoZFU4MVFTUWtXYWtrOXg4bmFtVGgrdEZhTGhnOEJ3UTROL21MbWlH?=
 =?utf-8?B?Q2dLTUdJeHN6bUxyZXlyelhwYk1qZjJiMVpnRzRWMG5kWTNDVEFldHp3WlhN?=
 =?utf-8?B?U2Q0UEtHcjMyNk1jQk1XN0puM1ZoZzFGOGhEZmhnaWdSQ3k3NGZOcHJzV05n?=
 =?utf-8?B?R0FMd1A3L3JFQlFlalA0RGlJWHZCRnZwdzZLb1o2YWtFWHdmSXZoQStHRTIw?=
 =?utf-8?B?N2JZOUNCMFdlZUp4cHJSUmt6L0xOL05NV09vdHI3bmt4Mm03dUh5R3B4c3Vy?=
 =?utf-8?B?VnNNVlFrbU8wSkFLaW5YaTFrTWVGZW4xWGhJUU8yVTJoTTRtUE80NmtPcXph?=
 =?utf-8?B?MjRaMm5RV1lOUEdTai9JTkwyUkticG15VUY0dDJzWXZremhmanJORDZQeTRG?=
 =?utf-8?B?YktEL2ZUWnBINStrNS9XRXlnUmtWL3JJOVhhb1lYMVBlT29BcnFENHVVNERW?=
 =?utf-8?B?VFpWckVNZ1htUW5XM2lwOFZNUUN6blpOMHhrYnF5OXY1dk44SFlIVGVKNmlp?=
 =?utf-8?B?VVVNNlp4amk5aUtuMDM5d2FMMmxsOXF1VXZCMEZMaXNhQS91RzlVZmZWK0Rw?=
 =?utf-8?B?L1p1cGtWL05aV2doY3p0YzFGVmZFWUlTS1h6ZGcyQkRYbFRtRGQ2VDlXRmds?=
 =?utf-8?B?WGRtclhqQmtJWlk1bDhhcFBZcmhjb283S1ZSYU1mSjgweDhxcGJHVnlpakxt?=
 =?utf-8?B?VkcxeTlpemZkaEVCK0VQMnBIL0FKRWp5VUdpcFVNbjRCRG51VWttY1JMVHhi?=
 =?utf-8?B?Q2F1WE5jNkk1WGh4NmlJcGhlcDZ1b2JXOVA0ZllnTUx5TEJGajlvdUJpR1NB?=
 =?utf-8?B?VlJwUitOY1g4L1cvTFNVRkY3S2pjMmN3K0M3MDh1ZDBMZmRNWUV1QWZ2dUhX?=
 =?utf-8?B?cktzWVBHZ1M4amdJVnJ5UE5qcE5lZm1TV0NKTXpRTW9YeHltRStDaWRJMDUx?=
 =?utf-8?B?bitISDk5enFDcFhlSGU2Q3RGZi9ZWk94TlcxQWlxVUlHZlNLb1pMZjVzUldG?=
 =?utf-8?B?T3pqd2lZOUkvZ2tZMFNwcjRVVkRsd2ZmbUJiRFN2VzdrU0llM29DckhwdUdx?=
 =?utf-8?B?Y0hva0RrOVpqTTkyNzZtTjhNZVZQRVZxem5QYjJkYU5CQTFWVVE2WE8xNk51?=
 =?utf-8?B?TUFLa210djQxcHdOZVMxRFRwT3cyYW44KzNCdytGcE8za240bmhZZHovOVRH?=
 =?utf-8?B?czArL3dLcXp0UXBhNE8vOFlWSWpyYndiK1RtTmJvUXpQYmFydkptbmtYa0xi?=
 =?utf-8?B?WHNjR3ZQUmxNVGo0eGo5QlJGN0Z2bXFDaHlXb052L1VIbXZmMzVuak5XL3VY?=
 =?utf-8?B?ZzIrZjB4UnMzU3NUeHJRV0tsbnIzVHV1SVBGVWt6Yzd5ODBMZG5TTlUxV2ox?=
 =?utf-8?B?OFNkWjRiYlFJSmE0SURERHNpbXdtMW1XOEsvK2ptQXEwdzhRL0JqYm16ZGZ3?=
 =?utf-8?B?bzNWeVFEa055bjZEcHJ4Z3BBUk83WlNFMzUvakhGbmYzUmFGZUxkd3RkY0tB?=
 =?utf-8?B?dWh5blN6WlVUUzhwU3NlRWlMTkdJV3E0NHRCNnFKUCsxYmdHRjdYSThNWDRx?=
 =?utf-8?B?VUFzTHhGS3oxRzJDR1p6STFidnpGY0NZQzJIRUZCNjdiV290OUxjcHVPYjhu?=
 =?utf-8?B?YkdkNEh3cE5LaklaYzNuWmZFT0dmckk4VVZOQWNySkdHU0IxNklQWTBkR3Rw?=
 =?utf-8?B?K1JIdHBsSFcrdmdoMkFPNmtCSG9kOU1LT3psTG96L3dVR3dvcG9YNy9rNkkz?=
 =?utf-8?B?TDlPSUFKbHRIbmdxV0doTjRMK0JZaGxzVG9uYVRnSS9xNkJEa2d6bmhIRWIz?=
 =?utf-8?B?THg0YXhZS3hadVozTk00aWlSZHlmQmx2Sk5FVEpQSWx3RDVjampXcTZpUUhT?=
 =?utf-8?B?UnBXNW9FbFNYVWxsMjhHclF5eG5JdUdZTFEzNkRYS3U2Y21wdDZmbWxDbDZM?=
 =?utf-8?B?b0RGd2RxQUd1T3VxYVA1dGN1bkcxSGpWSTV0dVl4UDI4M0NsMHdnRWEwQi8y?=
 =?utf-8?B?VEVmUWZXcnl2S0JMcmRFK29Hb3ZuanZRZ1ZubHZsOEhZYlpBT3JQbmJaTTEx?=
 =?utf-8?B?TWhsWkVqT04zVmY1QnZCcGtxWTlMdDlvT3JOSndZdFNZeStKa0h4VlN3ZVQw?=
 =?utf-8?B?ZWYycjNyaitaSE85NGxFZzdIWmJSVnU3Zk5DNUlrMURYZlJBVUFSc2NFTTFQ?=
 =?utf-8?B?UUVJTGZ6T3RTbzZ4RmZEQlpzU0Fxd0x3Wks1dXk0b3hwSmcwK3N5YjJmSUM4?=
 =?utf-8?B?T0NjK2l2eU5OV2xMZytNb0hkOFpxb0Zzdm0vWlBlbmpucVJRUklnTjhlUVc0?=
 =?utf-8?B?a2kyM0dKaTh1dDJIL2dQYjRPOHp6ZVpxQXliQWZrL0JUbVNYUzllUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e08b399-dbe5-4ac0-18b9-08da12f8c842
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:28:14.9497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+84IaHnKB7GswU1iMrKN0ZNvJ1bfKplHXPcQ1l5YazgJzBWaUba0WSTXxmFP3QdwbX6eMF98FsMTJ2k4ZSIEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8381

... plus some tidying (or so I hope).

While perhaps seemingly unrelated, the 3rd patch is actually a result
of my (successlessly) hunting for PASTE() or alike, as now being
introduced by patch 2.

1: APIC: calibrate against platform timer when possible
2: APIC: make connections between seemingly arbitrary numbers
3: include: move STR() and IS_ALIGNED()
4: time: use fake read_tsc()

Jan


