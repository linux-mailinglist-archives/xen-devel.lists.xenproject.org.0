Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3474B5313
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 15:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272331.467129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcCs-00014H-GN; Mon, 14 Feb 2022 14:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272331.467129; Mon, 14 Feb 2022 14:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcCs-00011a-CS; Mon, 14 Feb 2022 14:19:58 +0000
Received: by outflank-mailman (input) for mailman id 272331;
 Mon, 14 Feb 2022 14:19:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJcCr-00011U-6V
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 14:19:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ed231fa-8da1-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 15:19:55 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-4VP5IfGNNQW7i7v3lsNzcg-1; Mon, 14 Feb 2022 15:19:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5832.eurprd04.prod.outlook.com (2603:10a6:20b:ad::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 14:19:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 14:19:52 +0000
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
X-Inumbo-ID: 2ed231fa-8da1-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644848395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eIBMFJoRrQzjeSs7y+hAQfYO83nR9GrxY26fC53/D28=;
	b=Pj0jM6IMbdqc4SMBdomFu7UgTGcK8ROqgcHMA29faoVDI5Lq3rR3Eq2lECMaWOvmZEY40K
	mviqAu1k41tcU6GZ4eL6DoJe7P71gfLSfT5+F/o3ye0KYvCcH/r6ePaBHzF2wMYULbPqE+
	YncdpE/EXS1qQysyoZutXsBgporrhI8=
X-MC-Unique: 4VP5IfGNNQW7i7v3lsNzcg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2Ehfshwq3BtVCmJ8yCWnjWYHMftAqpKvHfFdjnBortp2DuZBykvnnB5AiPFu5yGhfgTaFVOyuGFeuK4TWGzGkVpXkXCy+G6n5OrinPavYmMKrVSRbIurbKEQeyDvFRkTbXMPixE7LfPse3xhjoRE1+eisK1B2EkjFIDq9edcp1BCtYqL62iUqVBVg0YsoRwIpagvqtjRXMlM0Obhgalq+vCtSNB9ojk212VU4bCZYZ78Vh9Z3sfXS0dUFI8KsRaWiZsT/qdy98HjyRD3FlbyFQTNeCKzm+hj+A6ZELEqbeqc9wk2SYZkkRelfBkDawS7vHvnQTrbQJznV0vDahpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIBMFJoRrQzjeSs7y+hAQfYO83nR9GrxY26fC53/D28=;
 b=Bgws0JRM60BRWckvRs3OFkDGaJ2dxcZ+8iFj013fYowUkEODD1YwJBRqpybmGdcVvUoVuVGa9DmzMWNIvn8it1ynXhFSu9KuURBFxu0vNa4L0IFEAJL73DMHx+/ueWuEjTINUm8KupAB6iTcO0Jj4Ph+S4rP+DviXelHfrWjJoa5Uu60Fli4VJ4wH+MFGAL4ChNS2x0vdUlnRh3xLACEUqIs7Ae437rKs9u1QG0W1bTDC8+hwfEsH4HygA0ONsixLPb4L4kGFlT5WGLbdTlJ9+0QH+jVtgKQNFQ/7BZt77ckenuQ6vuDBEJ667EKZZiBVKWPY3p+Zu6SqLcCjptX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77f818a7-fe8a-20e5-3f1c-8fb7aef7984b@suse.com>
Date: Mon, 14 Feb 2022 15:19:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: roger.pau@citrix.com, julien@xen.org, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com,
 artem_mygaiev@epam.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220209133627.959649-1-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220209133627.959649-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0043.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98ef154d-a58c-4203-5c50-08d9efc51115
X-MS-TrafficTypeDiagnostic: AM6PR04MB5832:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5832D38E86DAE5A0D50F38DAB3339@AM6PR04MB5832.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hv/1rCVzUzHal6OKp/rPWypu7/CtQIeT/kDKajpDa6ILeAjYDA3w2ptaCqAI802XOkZBl7nDxN3yHWdwoDwZBSz6zyhCW6SMSo2MH5jTSlg7HZqAwV2+wUY2tkJhBvCwQe/I/1qPMOSDNdWRF33fOsnu/p3Q2p1pEs3tOd1skYavKYWxbX8e/pf6SJ99O8ZJSMmC+2L0xcyWWQe2yZLZtDovL4+JTd38zof3vqL0mw8Vneyq0efk2IFl6t4b409EAvHMYsW6zOHzbmJzZfO7BT3180eEV53DLMxGYwPtiARSkvlWuj4HRUskZKTCBiGJTYypCOwLzOtiYrsuwLL/ckWCq3aEQAw/3xGjXht0Kcu6Y8o2G4PzMD3vagvoUykgBM4xs4KDm3BmfyNVXHTxsFemNqwEzHmIiX/BKMDUmOjTHQY5Z90c38npaUX0dl4ZPoKoARoSCDXxAPHVw9pEPqpH9FqnfA7MLn2b2OFJAsjWr2dAYhDmReEI/QREPGo3qyIIOpPOlFJ2l6v+nlUQ+dIqojJsWEgZ6pmBZCHl98hLhcrTqF/1Fg2bmMAatbrXzUhlzQ2FUe/H1FaTPl4rYbFAg7BlFXiScKuzjAlTzkG3HT/VDeaJcRvsIgyz69PR/B6SBe4s2PuWOOsnA4injqafeAHxxnIyfy/n43Ga0bCdNXfLdqtjXUCxZ3EAph9Y76ZKvRsfjIwiKOf50fbs2kind6Q//qoVmCzh0YQ0kCU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6512007)(83380400001)(26005)(186003)(2616005)(8676002)(4326008)(66476007)(66556008)(86362001)(316002)(6486002)(66946007)(31686004)(6916009)(31696002)(508600001)(8936002)(36756003)(5660300002)(7416002)(53546011)(6506007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXNTcVlBREN0d2pFMk5GTzFkV0o1enNDZkZaOTZCWld1ZU81RThwWU5acnhM?=
 =?utf-8?B?aG5sSDlmNWV4RG1jbDNUbWV0Rk5vYjhKT0E3eGlTdU9NTWVoUHd4aEpqdjZt?=
 =?utf-8?B?aFAvYWdwdHhoeng3SUVUVUUxZS8yVmhVeFZGcVE5MS9lWHNNaTVuMy9mUWM2?=
 =?utf-8?B?NjlTME1McVJDc3FVZVlUWEJ3RXZuY2ZTeldrL3hLRzhubzA0ZUNNczhvYnQz?=
 =?utf-8?B?cTR3K2ZURUVxTmY0aEpHcGtqQmUwSTBOMXJrUDZYdDF2VHpuSmR5MlVybE1G?=
 =?utf-8?B?RmVBSjRTNlpQQUFQRVdnOVZHN2kxOGV2MzZnTXpvQU94SEEvaWZLQVVwa0VI?=
 =?utf-8?B?Zlc4YXNMbEdiSVdJOFlMdHAveVFzSEh0MHhqZVJzYkhBcDJ4VmkrN2xWMEts?=
 =?utf-8?B?N3U3WjZ5NTBJdndIRXFpN0ZNQmJ2SFREcmQyQllnMWMycVdRQWZaSjJNUVda?=
 =?utf-8?B?cGxtdnlQeWJOeDlMZUQ5Y0lLUlczZUl2amNtaVNxOEJwR3kwYnpsYkpmWXNv?=
 =?utf-8?B?cDBpdmpLL3Awejg4aStoVzFlRUxNa051UTJ5VlFhbW5Mbk00bSszNUZnTWhh?=
 =?utf-8?B?bm95YWQyOTVhUjNjOFFUbGdQRlMxNndZV2tsSi9FVy9JdTR5Y3hmTTQxNjd3?=
 =?utf-8?B?ejNxM3VlTWd4WUpxRFpRdW5BbXdyNnFuTHpnMmNrUE1EQU9Kbk9wWHN6QnRk?=
 =?utf-8?B?Y0lmUWxGcHRzWUNSaFMxNlhiVFpaanB0TlNkeVNrUjYxK3lWVzZacXhCUEtR?=
 =?utf-8?B?bmtCb1A5Z1BWRG1xNXB4NTJrQ0czem41OWtEdkNUT0RkbDJjMVhZMjYzNHJL?=
 =?utf-8?B?L0NKMGMyVjdUM0FudUE0Tk91UFA0UHU0eEgzdDJjdkl1emFaM2pJdHRsQnpv?=
 =?utf-8?B?U2tlRWlCSUxEbS8vUVQxSGlsK1BQUDh4RERLVFVaay9UOGR3My96N0plR3dS?=
 =?utf-8?B?TG9GSGl4bW1rY3BubEl5eUVlenQ5TW1qaEpPSlBSL2pvQXJyN3NxWXFNdjEz?=
 =?utf-8?B?Y0E0STl1c0k3U3RhMjBtcTNzc2ZOV2NKK2dESjA5N0U0cEtraEtSUkdhVFk4?=
 =?utf-8?B?aDdiRUgrclcvV29QbEJqc1RaNXFHK2tSMlhFYi9wL1NnTHZKT2ZZYm9pekU3?=
 =?utf-8?B?em4wTUc5NVlYUmNzZ0NwQ1NRSjAySXlHdXB4djAyWEY3S0l2R1dYeGl0cEN6?=
 =?utf-8?B?NnBDbElMZWFiNEJwYWpDR2dRSjhFZ1d0TnMyQW9lcnhHN1BhM2tNNHppR09W?=
 =?utf-8?B?OTNYMTlRNTUxaFNMZ3lBVW84STJ0Tk1HOUpCLzk3VlIwR01ORCswa1UvbGI5?=
 =?utf-8?B?K3dEVC9Edjkzd0dEdHlkZTIwMnl1Z2laOUZuK2xrOVdGSlkxRTNQM0tZS3Zm?=
 =?utf-8?B?NE9PTXIrZ0pManhQTHpLUkE4Y0tWbHQxaFNMbVJIYWFINEpwMnFYNi92TXVJ?=
 =?utf-8?B?STgvaXpYSXF5Z3pqUWF3cjNBd3dycU5QbUhUWWErTGtNK1lNUzB3RFRCUWVq?=
 =?utf-8?B?VWN6M0JRNWswYmVOZytvc3JPSEpKU2hUUEpySElUazZhcEd5Q21zTGV2SmRJ?=
 =?utf-8?B?bm1MY1Ayc1A1aW9mUzgyeGdQM0NuMEJ3UWxaUVdRZ2k1R29TN0NtZ21obkp3?=
 =?utf-8?B?SElMOTVod203N2lrSXloUCtIM1hCVTNEL2xwYm9xWVJlSjVrS0N1Y1A4WEpv?=
 =?utf-8?B?UUdORjIvait6Y3IwMjVoWDNTamlDNmhsOXZ3cVAvdGxLUWNyU0VqdlJuV1pU?=
 =?utf-8?B?b3ZKQTdQbUhoalIxVW82WlpzTFNPRjVmOFJ5R0FaNEx3dXZhK282T08veVor?=
 =?utf-8?B?c3JsdWp2MWVxU3Evd1dQZ3JJMmFHaXFhRW41YWFkMmxyOEMwMkZkNmZBSkpl?=
 =?utf-8?B?WTBWOXg5R1MwNTE3SnFIWSt1a0RhOVdzNVpIM1RLWFRVUnNoMUZEV09yNWRS?=
 =?utf-8?B?TEdDR0Z4VzdEZHZlaHNENlRiUlZYWmlYVGpQY3M3SGdKQ0htM05pQ2JuL2xq?=
 =?utf-8?B?M1RMN3BUSGNucUgzdEEwV2Y3VHB6aVFyNHhQUDhqU1M5b3M2U3hNV0hrK3Jm?=
 =?utf-8?B?cTRYUTZhdU45SkF5ZUg3S1pzOGpsSGZRUVUrQ1FIVHZoMk5id2psaEhuKzNC?=
 =?utf-8?B?MVkzOWdmME1sZTl3VnM2ellHMEc0T3d0TEkzZUhYeTBXWUc3RWE1Ny9Wd3I0?=
 =?utf-8?Q?dIJY1UR2T1dzeTyo9bJ0uY0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ef154d-a58c-4203-5c50-08d9efc51115
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 14:19:52.6344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UU85FUlWGcOQC315ugzAvXvfgpAGsaw+GXqHsdCWzocP/2+vVktswLD+cC2zba8ZF3Zhvger0pmSQaJv1kAkLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5832

On 09.02.2022 14:36, Oleksandr Andrushchenko wrote:
> @@ -410,14 +428,37 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>               r->private);
>  }
>  
> +static bool vpci_header_write_lock(const struct pci_dev *pdev,
> +                                   unsigned int start, unsigned int size)
> +{
> +    /*
> +     * Writing the command register and ROM BAR register may trigger
> +     * modify_bars to run which in turn may access multiple pdevs while
> +     * checking for the existing BAR's overlap. The overlapping check, if done
> +     * under the read lock, requires vpci->lock to be acquired on both devices
> +     * being compared, which may produce a deadlock. It is not possible to
> +     * upgrade read lock to write lock in such a case. So, in order to prevent
> +     * the deadlock, check which registers are going to be written and acquire
> +     * the lock in the appropriate mode from the beginning.
> +     */
> +    if ( !vpci_offset_cmp(start, size, PCI_COMMAND, 2) )
> +        return true;
> +
> +    if ( !vpci_offset_cmp(start, size, pdev->vpci->header.rom_reg, 4) )
> +        return true;
> +
> +    return false;
> +}

A function of this name gives (especially at the call site(s)) the
impression of acquiring a lock. Considering that of the prefixes
neither "vpci" nor "header" are really relevant here, may I suggest
to use need_write_lock()?

May I further suggest that you either split the comment or combine
the two if()-s (perhaps even straight into single return statement)?
Personally I'd prefer the single return statement approach here ...

Jan


