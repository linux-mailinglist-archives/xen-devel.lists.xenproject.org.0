Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3C82B8040
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 16:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30029.59736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfPCg-0001tN-CK; Wed, 18 Nov 2020 15:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30029.59736; Wed, 18 Nov 2020 15:17:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfPCg-0001sy-8a; Wed, 18 Nov 2020 15:17:02 +0000
Received: by outflank-mailman (input) for mailman id 30029;
 Wed, 18 Nov 2020 15:17:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfPCe-0001st-O1
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:17:00 +0000
Received: from de-smtp-delivery-52.mimecast.com (unknown [51.163.158.52])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc6fa6f4-d158-4f00-a0a2-15f2bedad7c4;
 Wed, 18 Nov 2020 15:16:59 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-qywAWm4IPpyoZtpppVvoEQ-1; Wed, 18 Nov 2020 16:16:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Wed, 18 Nov
 2020 15:16:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::6882:d72e:9dfd:349e]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::6882:d72e:9dfd:349e%5]) with mapi id 15.20.3541.028; Wed, 18 Nov 2020
 15:16:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0174.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 15:16:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfPCe-0001st-O1
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:17:00 +0000
X-Inumbo-ID: bc6fa6f4-d158-4f00-a0a2-15f2bedad7c4
Received: from de-smtp-delivery-52.mimecast.com (unknown [51.163.158.52])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bc6fa6f4-d158-4f00-a0a2-15f2bedad7c4;
	Wed, 18 Nov 2020 15:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1605712618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9miUL1ycQ/wKVbdU7D8a7KBAYMk2rSnGMnl+ZgVXSLo=;
	b=GTO2ViiQ36Ruc6TGf6RnW4+kBmIovd2rugqa7C8+zkN1E2evExutIyV5GDfLYYAHSxzJ3A
	FCMCUY8VX4T26HvG36F/OecC4VHqzRfvH358i+sUICuNQ5HxkbpImvFD2ditVEtIFTceN9
	LXPWzVRd5I6IW7nke6tnNg8I340ahfI=
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-qywAWm4IPpyoZtpppVvoEQ-1; Wed, 18 Nov 2020 16:16:56 +0100
X-MC-Unique: qywAWm4IPpyoZtpppVvoEQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AR+N9GTmzvmgxDnk2Uln908lSLQSneNZya8bk82gBytrtSeOAYLsUALZ1LpsJd9soxuEhk8RUuwuw2bGus4gnid55XqulsFoN15HZFOc60X7oMdcCwH5RKnTBThaX5Hi5SGXyk9ij4RHrXQmHVrQnNzgZyaf8l3LeqFtv1NoTUgR3IHWmTdtv7Qr3N1M9Jzu5cFhgb33JPm2r7hCn1Yb61xwajRhRKMWYh8e/g8zfoLanXpKADCAuUvz/PjItVQYjoLWy2j79dfUFewtHjzrZbOQckX++F4SWMwkd/+PGznsMy6juLxeQrqAfzgHTCkVjKoGTXukqhlR6AkaHZctnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9miUL1ycQ/wKVbdU7D8a7KBAYMk2rSnGMnl+ZgVXSLo=;
 b=fK717Lv9jB0WcQNOu7Y0lsR/MyzYJTTReBOK9l/wFe+7GVNgPgHyXN+8s5Aigy/px3BlpA1zo058+aHVlGLecQQqUx9InDWw5a+OUny9xGxYqMlR5SyUUmE/K+JAr1Iwctt8ra+9U0kBFxpA2MS8PkXu0MxLktQl+436SzMMy3pi2ii6xJiaC2IBqU5kWzXAgOeuPYusKous1TnQw4dyhszqWOTK9i2zr5/d93DkvUZvRrduQcCP73i8S9h1fpbPoTBHq05AsRXdamccEXfa9H2zlWzEcHpHnyda2tq/SYuDJa1BBBNHdn4MmQpk8raorfy8XFLNucaV3QI661BkxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Wed, 18 Nov
 2020 15:16:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::6882:d72e:9dfd:349e]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::6882:d72e:9dfd:349e%5]) with mapi id 15.20.3541.028; Wed, 18 Nov 2020
 15:16:55 +0000
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <bd5fa7bb-7c44-1ec0-fc57-3ecf01c7d651@suse.com>
 <CBBE4253-F244-418D-9EA6-BC39D1BC8DF8@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1530c2fb-8def-37eb-8a22-d7f9fc4e38b4@suse.com>
Date: Wed, 18 Nov 2020 16:16:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
In-Reply-To: <CBBE4253-F244-418D-9EA6-BC39D1BC8DF8@arm.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR01CA0174.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.236] (37.24.206.209) by AM0PR01CA0174.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 15:16:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83c48390-681e-46d8-06f4-08d88bd4fc0c
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70389249F8ED807015396150B3E10@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GoRdTsRjX2dejbxbBVlBC7FBVsPY8iISFhHlzI8UrWM6+Z+36Te1/7fISZMXWGRUI8MZ9GZUTV66CRpntE74ePO/o0XlFHs8TP1e7lF3C/DX5L9NtkCqFOe97GUv9e6NmOZm0TPGgfsVhoWHey8u/d4hkHQMxfbGb6tGOiuTx9HSTCL4D75cD6ut1IUPQBTAAKxLVI0/KFDxlzCHiOy0VAIWLZ9Lg6gX1RI6U4INrPD4wbrLleICW6I6Gg0itA3TutDDi5LkP7xn+4FHDhzJCFRMU6zwUmYUwt1dBJNX0/XME0BX+j2fBQ4k960dPbigjcLzndum6Ws4bvlUMggN3kxvvsQjy8IutWpZyDCquTlK423fV94q7YYVCXdFm1CS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(366004)(376002)(39860400002)(8936002)(956004)(52116002)(26005)(54906003)(53546011)(2616005)(478600001)(86362001)(4326008)(5660300002)(31686004)(36756003)(8676002)(66556008)(2906002)(186003)(31696002)(16526019)(16576012)(83380400001)(6666004)(6486002)(6916009)(66476007)(66946007)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	nvf2YtTgDyBWhmInhhPiZ46k4CdudmsCRSSGEGJrKZjykSc8L85481kQ1vMp2Ujtl3BUsP/eaSLORzCyQztF/9t56DqfmhRYhvY1PlvFmgA91UGPYcaAzN7Ko+FUKo6jNjMLHWg7i46f+HYua1GIVYB7JQruK7gkCm1YD7Nhz/uXTnuyIBaQfBeyhjJcLFRlanH2ig3zshOvmtkh1MV/Y1q5pOWxK+nD7kTTCNEz9ozg58LYTViTDz2LTp8EKimrlOEWdNMFBt4DuJy7tVhP8PWvTALvcfrSJzaRyyviS65kxyWLq87gb15h7K5L5Q7mnnIDSFYVpif73iARkzwJXPUTk/c5xty6D8nZVvOvAe/79NiTxxQCnGg0Vlld59v0dDrhqySScJ1pdWh/BRv8t4mZ0Bg9J+0Vw+uHbCeF1PSwsx4uoME/BP4ND5ekvuG4PY0S6GNT9CGL9LI0f40F0zIYUrBxu5EyF16De4oEoDcApihXsj8wpVsiOhtzInNyUFuflHlVadw81i9/ywLx5xSXTCCUUzLTKHBDWATJxc3caipsgzKlO4xHvozMtnmJO1zxycVpZts7rwHauGGndCO/1O8ZXJatKNEUJ4C2a5D8a8zqOvT6FXsfVNrS7QqVtM/6DTiRykxKbLR9YwNDSxag/5HJggOnaPrZiaN6mt/85+tlMo5NPyg94XKFI/WKs+spT9/QcVpnsyBgWwk3c3rMQIsPNbTLUFXbFn7ysabEKGHozulSY5jSEFWFP0wJtrGBbGfVDd8N8kiSI4Q65OfiUy+k2OffeMRHpMG9Z1/UwdclHWX8MjHxNVjtlrvPxYThj4ERBIVktJtyNWRgzHHpyvHbTr0QY8e0qoF35YfRlLznuwthJZatirAVYPgadlpn82P72+59FFk/z2GARw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c48390-681e-46d8-06f4-08d88bd4fc0c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 15:16:55.2228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4FgQdP/TCrr116Qp9HFmSRb31kcngMLKdbjKId4BqQNWqdorysrnFFmdmy3R09G14UoFUF8ienQpeG5LKR5BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 18.11.2020 16:02, Rahul Singh wrote:
> Hello Jan,
> 
>> On 17 Nov 2020, at 10:55 am, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 16.11.2020 13:25, Rahul Singh wrote:
>>> NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
>>> is enabled for ARM, compilation error is observed for ARM architecture
>>> because ARM platforms do not have full PCI support available.
>>
>> While you've extended the sentence, it remains unclear to me what
>> compilation error it is that results here. I've requested such
>> clarification for v2 already.
> 
> Compilation error is related to the code that refer to x86  functions (create_irq()..) and MSI implementation related error. 
> For more details please find the attached file for compilation error.

The use of mmio_ro_ranges is almost quite possibly going to remain
x86-specific, but then I guess this wants abstracting in a suitable
way.

The remaining look to all be MSI-related, so perhaps what you want
to avoid is just that part rather than everything PCI-ish?

>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -16,7 +16,7 @@
>>> #include <xen/timer.h>
>>> #include <xen/serial.h>
>>> #include <xen/iocap.h>
>>> -#ifdef CONFIG_HAS_PCI
>>> +#ifdef CONFIG_HAS_NS16550_PCI
>>> #include <xen/pci.h>
>>> #include <xen/pci_regs.h>
>>> #include <xen/pci_ids.h>
>>
>> ... #undef-ining CONFIG_HAS_PCI at a suitable position in this
>> file (e.g. after all #include-s, to make sure all structure
>> layouts remain correct)? This would then be far easier to revert
>> down the road, and would confine the oddity to a single file
>> (and there a single place) in the code base.
>>
> 
> As for ARM platforms, PCI implementation is in the development process and I am not sure if after completion of PCI work, ns16500 PCI part of code will work out of the box. I think there is some effort required to test the ns16550 PCI part of the code on ARM.
> As this code is tested on X86 only so I make the options depends on X86 and enable it by default for x86.  
> 
> I feel that adding a new Kconfig options is ok to enable/disable the PCI NS16550 support as compared to #undef CONFIG_HAS_PCI in the particular file. If in future other architecture wants to implement the PCI they will face the similar compilation error issues.
> 
> Please suggest how we can proceed on this.

Introduce CONFIG_HAS_PCI_MSI (selected only by x86), if there's no
immediate plan to support it on Arm together with the rest of PCI?

Jan


