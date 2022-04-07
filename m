Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4EE4F76A1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 08:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300436.512453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncM56-00022D-Dy; Thu, 07 Apr 2022 06:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300436.512453; Thu, 07 Apr 2022 06:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncM56-00020M-AQ; Thu, 07 Apr 2022 06:57:24 +0000
Received: by outflank-mailman (input) for mailman id 300436;
 Thu, 07 Apr 2022 06:57:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncM54-00020G-M7
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 06:57:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f89c0649-b63f-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 08:57:21 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-LQhGggxnNOqI3C9tLaxHOQ-1; Thu, 07 Apr 2022 08:57:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM8PR04MB7730.eurprd04.prod.outlook.com (2603:10a6:20b:242::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 06:57:17 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 06:57:17 +0000
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
X-Inumbo-ID: f89c0649-b63f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649314641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f87FcFknBJQAXzdfPptgGAbYYSNoePKfT9sVQ82H0Mw=;
	b=K8Ru7GU/EBd/mfgpatuwNQKjRwLF8HH9ib9R7r8pNziJm6fNlVN5lQIphtlgvYSZ94H+CQ
	qrbwLft3gc8DNVYuZIbZ4s7CvTjNLrP/Bylj0Q05oeUGe6zjZcJ7L1DnfayljqGQxE0V7K
	Cg8R6mRgjU4Nxa1ATki/p5twjMyatBg=
X-MC-Unique: LQhGggxnNOqI3C9tLaxHOQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/b5EJvtR9/5ZfoJQr4NFYqAT+1khbHosZRUpC70XFm9JHSnnNqS27USqCmzA2ns0+z8PKXCVpNX4QAUYigRADfhxXV82M+5JPfk5n6Qs2iwTomHDq6kOEr8FVJysxcohMjIR/El3cYFMR6CTj9vgn6TL2EmkVD/esucLXYQAwlYGibBZblU0yfEA9FL+tj/+MFtWbB4nZeLvHVdwWfFgc8g22RJ8Sb8q/FVsjRpkGepC65Yb79r3WNxADDTQq6gY195areeBR3UdX/yE8fY8FL+xlQwtvRaCZfUD6pq8OmhE1Sz0RDvfDnuLY3mb2j18CpfCXotyYX5WqHByIpH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f87FcFknBJQAXzdfPptgGAbYYSNoePKfT9sVQ82H0Mw=;
 b=nat5BNGf8xvV0YQEqk3SpnCE49gsCfYgrELquUmBpCR8xJugq5UcGdZJLB8z+Eas7pnyg01K3df2nLu2Z/HxKRJRLFy5tgxr31Z/otTGeHTnUNQA5MKnUfauZ5cDXUaX9ZcyhLuxtTGo9/tJS+2Wl7HiwNIrQg21tCLU2n8DmrUoHNg+BoS9u9U7ayxt/fGHNTlfSuhY5C43Hn41vO/SjFfH+tHceQQ6mqSGZwERRjploAClLcOEZDUE4kp9A7/Zknfrr8A9ceNVk4KFiNgp+jIgfcE5JIzMMqD7Tnw2xeQIDJkp1VgbvB/7sBIVvqpsg4cXeqxBlZS/vnDyU3HXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3881491-93ce-ff41-fca3-31d4e38c3cd5@suse.com>
Date: Thu, 7 Apr 2022 08:57:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Ping: [PATCH v2 0/2] x86: correct fencing around CLFLUSH (+some
 tidying)
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <265e87fa-0f05-7953-1bce-34999119d3c4@suse.com>
In-Reply-To: <265e87fa-0f05-7953-1bce-34999119d3c4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0048.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d978f38b-9171-4dff-7a9a-08da1863da81
X-MS-TrafficTypeDiagnostic: AM8PR04MB7730:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7730F90286EA64E8208DECC9B3E69@AM8PR04MB7730.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cJU9PHlMP26i+SiQkRSRJxucmKRjoShZT6yHliEmXnrh5FXYzclWQPMnP6Jadk+IbQXr1jYY2pHcPHPWsCxS7hKVU23koqqxN+YAGPF25kyE0iUtUUH3hhYrgNJ5aU7pldQkW7995g73RXyZwyJEbb933a3We2FmuF4vffCRy0Is9H9+9cbwrQ2/45cLcdYsmELJo5UnvEBwVpBNPIDizWqY62AvXcGgXWsJfg0+wdbZjESD/K48H8X1IdFf3SN9eVSpUawLM2XXbzbeIpVKBiOq7tQoUkBU1UYN8y/endqXbAq5Mn7WfmD1DBTGS98HRDBb/TxF49jqS1QglgQBu4fTSlrQ7vnIR8m5f2AXziXIZtnel7ZCofMgANHA+XZ+CxMvpqEj+h6+rE5hmX7SKtQYFDlhsQQAUQ8n5uxeL4iOehMQY3wudn8dPGMbwUqzFPgijuOAcYnQB/3LXgFg4P9I6InPTfTmYcaX+YYMATeu8heFN4R+FA+B7s5EtjMZ1ja04I+VNeg9xi1fdiOfjdfue43fe7oyeHQUaCM0qHJFebTWrpN1Zk5WTSnZwm3klRAZrDxHlm9Mw5cl7tTsnc2vjRNmCuBsKq/KEmfzEyhiHfyHky5vR8vFoTGrqV9sa4MVobknjrswcL7gbRel3kELKqwNg+MWLeC9N3TLEluCwXcM+iuw6LScy7BmxKDRaCqMYACjBRp5j+ItITqWqpzA4G2j0VSHQ/UQGzu/EJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(53546011)(6486002)(8936002)(86362001)(316002)(508600001)(54906003)(6506007)(31686004)(36756003)(2906002)(110136005)(6512007)(66946007)(26005)(66556008)(66476007)(186003)(8676002)(4326008)(5660300002)(2616005)(38100700002)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm9HU09OREl6WkduYjF4TlVxOXEwa1lnVWhOOTVJNS9SRkwvYzY2a3NnQnRX?=
 =?utf-8?B?Vk1jZmFyYlpNQzVyU29wcnRNc0pDUmdueWJ6bWhMUGc4TkVpZzUvSk80NmpP?=
 =?utf-8?B?RXUwNEpWSnhUMlZrblU1R09zQjM0MG45MUFibUx6d3NqaHdKbnVDalBKcDhE?=
 =?utf-8?B?OWVxYUFweEF3czVjN3gzQjNvdkg5a2FtL3Vma1dBclV4cDZtc2U4L1hFT3Fy?=
 =?utf-8?B?T29RZUlacmVLdGRrVmRVU3V5V3VpS3ZOOE9mMmZ5WGVlTE14Yy90L251OTRJ?=
 =?utf-8?B?bklNRm02YWpHM2VXbGR3YnNxOXFBdGxOOVhXQjlObnRiMXlzMXczS2dGNW9j?=
 =?utf-8?B?YVllaFo5UlM5Zzh2eWUwY1U3cks4RFZzRWZqaFFWblFvd29QVDlYTWJITXUz?=
 =?utf-8?B?Y09DZ244Lyt6elJaWDljaEJIKzVxR0JFbU52dHo3L0JFQ0VWMkRIM0tOTnlB?=
 =?utf-8?B?ODdRZjcwME9ESTlrZU1RSGFBdlFHanV3OFlubGtGMlNNaVowN2xRWHpocXBF?=
 =?utf-8?B?L3U0eHBjQkhQVWpLWmZTaFdLemdNbDNMSkNGY05YQ3VWSytmbkR6WFM5WUN0?=
 =?utf-8?B?TWZHbG9EQ3dUT0ZxMXYvQ0UrczlidG1FWFJobWxlZE9aOUVDUVFmQ2p0U21h?=
 =?utf-8?B?L1UrM0hhWEdmdVhaQVNhdlRMeDd5bjdzWmZzcFBUZFRSQmNsQmRGbHB0L25N?=
 =?utf-8?B?WEdIM2JJUnI5UTlPRnYzS3I5bVBvNmlYaXVIbWdKSFNwL0tXay9PUDV3MDl3?=
 =?utf-8?B?SGxxR1FKL2hNUXJ2ZGpYMkZrNTlhbnpZSGx5eTM2bFVXWkhQQWZybk9zVlNO?=
 =?utf-8?B?MVhqbExKMlN3RkphVHU5U3hFR2JyS2ZKNkJycFJ3M1NMUzN4dnREb0YxOHBL?=
 =?utf-8?B?bmh1SWlrZHJVRS9JVFNvSkdUaXdDeEVZanNqYXZMV2JqdUw1Vmx5OHlWUWFV?=
 =?utf-8?B?WVFqMTNqSFUyTHBRcU5GMG9XOW5kRHdEcTZrM1k2TmFIS2k2N0Frd2pNV09J?=
 =?utf-8?B?THBydTJveXVSVHNRVHQrWUxuUGlCM1lxV25QRFBFTVYrREIwN3JzbmxsbFBW?=
 =?utf-8?B?dDg0b1NlNWRuQTBDS0pEN0hYQldsa0grMW5ubUs4NC9kOGZHY0lpZXplSTNU?=
 =?utf-8?B?VHZ4QStocUJ2WU0yNjlrZEdsOFFtejlETDdPYm1SS1ZhU2dMY3JYWGJKUXZN?=
 =?utf-8?B?dllsb3Q4TnN3dGlxWi9wVjlrNDJUdUxVWUMzOTk1L1hMYW9BUDFJeG5SM1NZ?=
 =?utf-8?B?TllmV2o1dXVDbkgvZHVjdzMrSzhldVp5dE5kK1ltZy9VckI1aFZsbTlhUkds?=
 =?utf-8?B?ZENHRTJCZnpkblc3S3JTOElPVVBYSVJrcFVPcmJQdENleGJtZW5BR01aU2pZ?=
 =?utf-8?B?eUo1TktVSGE2c3YyRGkvUGF4UkpzUUtVSlNOL2Qwa2dGM1NDSCswOHVmcUpo?=
 =?utf-8?B?N01PWE5BRjdrSmVERUhibjBpVVJTcmNHWW9abkRtdkhOdXlhQVlVb2VzbExw?=
 =?utf-8?B?eUNqVW9WbFdNaG9OUk5DRERDc1VPV1B6KzlXTmVVQ2dicUp3RWFjVXlOQ1lo?=
 =?utf-8?B?K0JoQWhsQ3N3Z1QzZFhvYWpwUDYrems5SGM2SDlrdWVtcW5uLyswZnNZcHlY?=
 =?utf-8?B?Wkp2dGpCMUo4Y2pjRmhkT0UxdENNS090blFFSlVjWHlZMjFZR1JmMDdqWGFC?=
 =?utf-8?B?Zm8rSzh2eGFrM0xrRUUzank4MUYyMVlvQTZRdFNLYzU4WkJPbEZaSU5pUW5F?=
 =?utf-8?B?djQ3SDZHVlJ4Y0lRSDE2NytGQU9lZExwMXZta05UbGIvUzY0WmJoSzF5Z3FR?=
 =?utf-8?B?d3hnWEtackI0VHZybmxWSWlaaUtQcGRnc25uYm8zYURKMFJxekt2VVVLdkli?=
 =?utf-8?B?aFFYeStCQnkrakpkR2FKY09kSkJybGo1c1JwRXYxMkxsQ1VpRDlmam9RcjFs?=
 =?utf-8?B?TUw3YXcwbUlpMmNUdlp4NGpuWmFZLzFJNUFwVDNhdzB3Mm0xeUZkaVdidVY3?=
 =?utf-8?B?ZmZabDQ0eTNrcDRENnUxbzMwaTZDb3hGTXUxRVpsbXlaeXV2YlhWVi9GN2FN?=
 =?utf-8?B?NnVRem1ONmpqZ05NRm1qbVlFNVJoc0JmUlV0TFdNemxPYkt3ajY0RHFhTXJp?=
 =?utf-8?B?OGNZTFJpakhIQ3R3ZEVzYUNGak5aaHBtVTN2MzZOazBkU3BYeWNweFBxc0FP?=
 =?utf-8?B?d284L3dOQXU0K3Y5bXJvMGVOaXR2c2E5VFVFSDI4WmlhcG9MYlh5YjNwMXFL?=
 =?utf-8?B?OWY2blFsWFhmKzg1Ry9YbG81bjdkVWNaeHBSRzdIR3ptNm90NW5TcHVxdUdi?=
 =?utf-8?B?UWx3OC9OdThLdkpER3FUYjBRYitBVlJCR0MxeUNnVWR1djNQQ05nQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d978f38b-9171-4dff-7a9a-08da1863da81
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 06:57:17.6530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0b7IpvJlL/nbswtW6qknGUp8DitnxBHpOBtWKBAM70nYkt5MvMF/FinG7duVeFgNM78vYjhiti6bnP/EPFSLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7730

On 24.02.2022 14:23, Jan Beulich wrote:
> 1: AMD: collect checking for bugs in a single function
> 2: correct fencing around CLFLUSH

It would be nice to get this bug fix in (and perhaps even backported), no
matter that we haven't had reports of the wrong behavior actually causing
any noticeable problems.

Thanks, Jan


