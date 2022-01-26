Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863349CA0E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 13:50:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260887.451094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChkf-0000lY-7d; Wed, 26 Jan 2022 12:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260887.451094; Wed, 26 Jan 2022 12:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChkf-0000io-3w; Wed, 26 Jan 2022 12:50:17 +0000
Received: by outflank-mailman (input) for mailman id 260887;
 Wed, 26 Jan 2022 12:50:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nChke-0000iQ-Ca
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 12:50:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82028b3a-7ea6-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 13:50:15 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-Yt3ydI2XMp-THcu3fPUdhQ-2; Wed, 26 Jan 2022 13:50:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7861.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 12:50:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 12:50:13 +0000
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
X-Inumbo-ID: 82028b3a-7ea6-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643201415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XSw/JZ/rYWLzjmJlTaCkcMFGZ0DjyrvO9yBcrZUWS6Y=;
	b=I+RzNYd+J0DLacfxlfEz0f0izQEgO3HM6hK6dwC8mVtGdMjKA9qFQdleMywMr/UUN5dJw7
	6H7mSzn1mW1AFdt0MKHZs23bY9BBU25MtjpYJ0EP9ZCD+KCSp0pyljcLk9xGbe1qS6GDeF
	76q/bgPSvFr6wk3K5mD/SAmeTSDWspk=
X-MC-Unique: Yt3ydI2XMp-THcu3fPUdhQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhWA/Dvg+TflbDubqKhYj52x6ZImeS4if8dRQrwiNR7S3KpvygxDKpDpP1kj3MOQHcF9jQBHkCIvWqPdB5sHT1blel7eQ1k63Z+N/S7pxIXufYx+ZXXnvCsS7hcOFjwQ+xcXvSJWVNOmNozPLaJCkPFj+dRdih6I5tdsdiTRyKQox+Huuq1FtnkFg4IQ4kNE6rQsRhAEkydYk6t4ZQiMhCgPg72qrLTu3lDTLmbJeivh795Ne+qquXKFhfEK2cYbhPNTUKJLJyjZy/1Tq6dPxNtLxd4bnWYckDP9xARwYh6lxWLw5Ze61WwKFubiYYNNyDw1r8Eq4s2NOxE3B4Eghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpAsxlQTr2e0z2cU6pNny8m+NIG4rRI8cK3SmoZUne0=;
 b=lMW7NGQMN+dY6lCTR7um2buYdIBp6qitVuEgu+PIXNcR/vVCdeapS4l4ovk6B95f2fk4gn6d6lPVY227ICvgsF/TzZnSZMyUkl8UKogV0o0h1SrQcq2wGZ+Q70+48n4SToVvy9THlyC3/yF5gOZRBSVz/x4YhVA3ZwqJHcrn4IMLJsLyt29jvVNGZVZUwRlDGBm5fuq0/YaTnYYsKX7Z5aH64ZCkhK3lKSgcriLnKgG8qfjed6rI5WKfIZ17zevFFcbfFhfa1qvnvbFB9oJf7hom5JTaKowkGKTuhK0cukxJgxjoxcJI9xxOLph1gfJji9WYA9eUaZrYipGcTXDftA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <764cdb07-576d-3d2e-328b-9acb96bda402@suse.com>
Date: Wed, 26 Jan 2022 13:50:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/8] x86/boot: Collect AMD speculative features earlier
 during boot
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-3-andrew.cooper3@citrix.com>
 <YfFCLxnGDeuk/va0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfFCLxnGDeuk/va0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0017.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ea9cb01-7a4b-4534-37e0-08d9e0ca64f6
X-MS-TrafficTypeDiagnostic: AS8PR04MB7861:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7861FC428F25BE6C9D8E006DB3209@AS8PR04MB7861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ay5V4Fuubz2B1+dW/eFQoAAAzSh0I73dRNIjjIYBJq/CsQ0sOJvZJbfuk+dULc8H3B5i+Z6cGhruZw2CDG6GSYehkNLGQ9h4BchI/TMkf+E2BFiZ5tTMI/IwbfGy0paGW71fboQ8SQjVjOxSVbELHyrddM9b07q8rzJqsy0zPerJ/S6X40VK7mibc4VjDaIfpceBbud3Tx0sHWO1SkKSpFbbbU2pMEuVBVovqoheSzBsxrvIW1DFOJ5qErVhLbCcKo9/GImM2S6Jgixud7mhA69mZK4zM402eNxB4ffEULtRHsEBZiHPD4l61qQJeMzs67WXWhlFOONDX3pVZ4+iosYIt59KPZvHeVW5S2SHoKT16dF5oDEMdECyHq2omy7HvzjTmk1s6mZCxVPn7n7O3i8wPJYOYYhjRLwMZdMCXBt/T/nt8K8iLI22iYea9VBPAtArKeAaIly1YIIAtsGSXlvwfv8WYBgK51SxTSXSjMpdjxu2abj0l3EX669WsiZP5om6zD5a6dwq0NqAPEJUuZrCo59c9VBWNKEq2teBqaZTX8K6gHnUB6VbWxYtUS9B5WXogrxfcV+OjPWxwXmiI8kLqL+Eom3SdZ2MD/3pgb4z9QUkMkrI8LDxK9SmZ/QdoJqxnZck9lhHORBD32Aa+Xa116YSHchAIX91oz6nVlBZiH8fzRMAxq1jVZkSRMjXhsSPA123lmshQRi9v95JqcHF23T8hyllJYqaCMyclAPkFq6e0fBAhui5F/dsNuV8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(31696002)(4326008)(83380400001)(66556008)(86362001)(316002)(53546011)(66946007)(186003)(38100700002)(6506007)(26005)(66476007)(2616005)(8936002)(8676002)(5660300002)(6486002)(508600001)(31686004)(2906002)(6512007)(4744005)(36756003)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r2sEsu9X7UgcyJkXjQ7hCW4DiGuXqBUfeX0pwj7Y35dUSFQulvSQZQIkUhQt?=
 =?us-ascii?Q?CmayA13Ok8R2760a2PiTjVayJOqABUD/nQdGasrG9dct1t106U96p+VxVLYE?=
 =?us-ascii?Q?P9p723+2mXfTfEj8i/zFWCPBoGCyf4YtIDbs1WqXM5EvnG9ZAPirJk4Tnhb9?=
 =?us-ascii?Q?ivQQpwd//MLN05fmVGFQfg/SLhWdOBlK34v/RYYX8E//hoqYa+7myELciVJm?=
 =?us-ascii?Q?1dyPOvr7pJD2N1yRvnm6r1tR+iA2lXJB2W+6CNx4T5leT/FJZ0KvVu0BoI34?=
 =?us-ascii?Q?knoGleUJGfbqYrTqN56tLH6kxq7U+qGavQzoGNtZDeU20l4LCOGtEh5byFER?=
 =?us-ascii?Q?oyPXU8YXynwtkc+8HTDzJZGmDravbxh5c31KUlHAPdiiY/M3wK22ukyOe1D9?=
 =?us-ascii?Q?1RI7P0LHuxATXZ6bDgOUAXRIxg+TMUeVVB9KujKjKfaHFqaMJKEyu4cPfiCc?=
 =?us-ascii?Q?9TougwV9I6gqv/niq6azA9Yx+pvEu2PMHs4w7A3bSBSb4fmeKstTatDTPwzQ?=
 =?us-ascii?Q?uPD4MsEsBX0JMhR5SL6qOUnjR1/sCLWx6gR36PEuqmS3hXBooaiIxBe9+r43?=
 =?us-ascii?Q?V9AMbTgu1CU1ikKkk/41sLTMzBzfeFt4pV9bBMlDUX5frhkDj5gdveybSTwF?=
 =?us-ascii?Q?WeLSJTC0F6PlQwpRkWqRcIBJVI/+ynouC9FegjWnEU87jkyX19iR5CKqy3MU?=
 =?us-ascii?Q?E1K16N4rLxCXw/N4DfYGOEY2qsDYjf9uBXqTA4r2SCjWp7DoS2EZtKESFTPI?=
 =?us-ascii?Q?/XP4h1g/UwXsgAHgkACQE9YWeEtMZ3BDw4NL5Q4Voipdx5qej2hzdHHf3G71?=
 =?us-ascii?Q?uUN1KYTMUirBa/8wYhTnn5O91PyVptjZpg4YridP9hKPFeUQreradj34SIe3?=
 =?us-ascii?Q?eS4GupYUE7heZgtapJFH0tS1YrECNztgtISFEBm07G9X21ahKYZDStn7Tpih?=
 =?us-ascii?Q?zQ6IB9kQsVGYgYct+V1D7DYFoAr8SWLsZ482LBd7vLnDLQH1rLhHFKyg4FjP?=
 =?us-ascii?Q?GCBJuThdfMCZ5GUMQzCpzXCnLbZbZUZ6qTLhjUuay+XjpgrKSWCAz0YrE1f+?=
 =?us-ascii?Q?zkNIqkw7BBfKVuA2wjsZN8qDDDHLJyo69hvYq2o9V+s9VWP1RWY3Ia4F/YgR?=
 =?us-ascii?Q?kc6yZK5s5xGXMUfqp6GgGGiRy84fQO6fVrEWohFPfg8uj6OVNqGvIBdsL3ep?=
 =?us-ascii?Q?ZXm8viW1/Fm/WHhmzZVYHKgSo15H/nsdjVXNJa5O4yK3zvPkyrztkP/+OraF?=
 =?us-ascii?Q?XXvUhgLspS260t0pXTxBED9VHzkYRKW0sLZY0MGM4Ux+udf6sKoh03s6KbgZ?=
 =?us-ascii?Q?tBd/RETX9AM7ERhdSXI3HgGoqL+OO9I98E9chtSP1X+8+b34VT1zs8Gsjz1h?=
 =?us-ascii?Q?xB2PMp2/kYoIJJ+ij6BDpjC0CKwO7YUMJn8hYb0xZBguUPJgYoA0My3es+rP?=
 =?us-ascii?Q?0otplPaeMqCX3PXmDit/NQnpYC59iwhIXRADp37OEG3Q2oc3S7tez5rue4an?=
 =?us-ascii?Q?83ylNBsJ2zK4k91JfZdDa6iKf0ld3ZmT2ZwHBH7ZH4tMbovZHAzb10Ic8OXG?=
 =?us-ascii?Q?LL5sGRnbbcriTUCu9Zb9U3t5xguChk8EgoJG9eqjsGzOlFrWa4Vcj/FOm4yf?=
 =?us-ascii?Q?1HP+gy8uxsLCVx7UE4VrXZo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea9cb01-7a4b-4534-37e0-08d9e0ca64f6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 12:50:13.3071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcIPoAWQSqoXsg611aVXJWQK6+bT7FnTWDh4V2SVzdIgym+RBZ18MQ2vZFFK1/dVAHYJ8ONxlfbwistY0B/f4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7861

On 26.01.2022 13:44, Roger Pau Monn=C3=A9 wrote:
> I think you could also use boot_cpu_data in spec_ctrl.c print_details
> instead of fetching again the cpuid leafs?

Like with pre-existing code there iirc the intention is to really log
what is available in hardware, no matter what was subsequently disabled
in software already (e.g. via "cpuid=3D").

Jan


