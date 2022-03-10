Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B3F4D4CBB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 16:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288446.489104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSKd9-0001XH-Nh; Thu, 10 Mar 2022 15:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288446.489104; Thu, 10 Mar 2022 15:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSKd9-0001Un-KH; Thu, 10 Mar 2022 15:23:07 +0000
Received: by outflank-mailman (input) for mailman id 288446;
 Thu, 10 Mar 2022 15:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSKd8-0001Uh-MR
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 15:23:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb66d511-a085-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 16:23:05 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-chxfSxDXM1Oc_om6l1RgWw-1; Thu, 10 Mar 2022 16:23:03 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM9PR04MB8715.eurprd04.prod.outlook.com (2603:10a6:20b:43e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 15:23:02 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 15:23:02 +0000
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
X-Inumbo-ID: fb66d511-a085-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646925785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0WZt12xJLiZQwOb24FZSzZ4iTWw5/nVhVQs4qp5wbI=;
	b=Jw4/NxGv33B8dgtqI+utjFkzRt/KQaNPKzmRPBEYnInpK71ww3K9mcbodXjNDpNqqd39sg
	wr52tl5Gy3DCrG8fybNV9m4+LI9zHIePj3ws3Wa4/E2M6QmUXrXl9zPD5gG8QJfJJEaFmI
	pkAhYtZacwJmUNOUbj0NlBqz7d5jS24=
X-MC-Unique: chxfSxDXM1Oc_om6l1RgWw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKUP5t/R3cy5BIbWWHjwifDQU4TBmDy+1W2HhoK/AY2mqTxgfiTClXAu+vOD9IJIwafLc3Q9AgoLOh6U8hQl+bBvpCISOPlS9o2iWJFhjAW8SU2BQ3cvCK29cIU5zkVosmffyI22VFkimtxyhQxr6h9oHwiXpZsvXI4s9igy6ovC+oYK0jq8gXuG+fgoDc3H+apCaOaEbmetboRNSUG6t1R59WwkIAML5qFn0W7q4y3VM64CrFaaY9BcuKwx/pJtkEV6Ua9TdvNIcSfLmTneYn6Hyjy33rVEActFk24vlRjVkb/ku+BN7Qn/lAYxkdift3IIWye1S19bmodSQiyoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsZrN3FxF+triV9bB5oQeY6blxKlOudJ1Z1gRuhUxuE=;
 b=h/vOsrUquc+IBUyaKr1TOGYPaeKgrobgALWJ0+1KGoL4dmHFKX1LHyQeKScA7swCngmRLhylKHfN+pPSO8NvEwt7JHIPCKd/1xbLRYK2DhUIGfQ8PF2WA+80yPO4suE754I8VvLTf374ApwIN4EZcNxM9ZIl76vEQ7sAVFyUWAfgNLpcQyT6zFDBNRL2uxzxog+25SCBdn92Sw2NojEysN+Dyx556Frgoa3sj8brCAu8i5bN8895L+AjH2zrsuGHXD8fF/6RXkj5AC+UE8NrJK1gNODAxTW1bljHvwi8VvD16geFh0alY5PwXrqSf26ncah+Uar83/6PIopSXB4tjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7acb2915-5a9d-c1f1-4b7b-2bc6c2055ea3@suse.com>
Date: Thu, 10 Mar 2022 16:23:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0276.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::34) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e82a928e-de3d-44b7-2bdf-08da02a9ddfc
X-MS-TrafficTypeDiagnostic: AM9PR04MB8715:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8715F7EBDE4980B1F68622C9B30B9@AM9PR04MB8715.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CCvj3jDJiTOE/36BGwz4Yjl4X3QO92GgQzqj5w6RGR+/hA1dmBGgG8gh0VuvAu+AlmNjL2f0oocszx8n4fOoIvuUlJRFfuo1ZWTyit7DpEoDAGpeH2JCxywiqX4eJfmwU9WmBDhR0ItrCMj9IumRPWEIlN/YwKkeJdHIWpeEHo93RVdXJHOFrJ8PbrE+0byMHY4Xx+uut+QEhs37cULtv1n32dZUt5lztQN+eNPI5pZcVzzMGuuvzxeerJCiruF1GRR80Z+CjqpX0HLYvyKCbj9fYCpZggGXzh4bqpMKvvUGvS89x4lOpMkJJUxacvaPf+HvuY5DX1NtPtiVYTIPTOSFthBeH0YogOEpBzf7jqaJvkT12zeI3EO3SmEpenivmpNDRbQ0IoU83RLgzWAjyABfN+KD1h10HrJYdes3oUWJQqX+oBpzF3Zxvkuwf/mD+1YcahmkMY0wpdKs+IyprnEmjfhnxpNHk+nEgn6xwjBpbMs6XoTY6Wzm0XeFe6yX35u0yLel7i7pFxQwvviYfzHeTgXIqMLD4LwoTlY0X+pz7O0DuZtkWr0kBqfXj+ofKOD8y/+3aa69Ltg4Lr+Na2c4E5d0jw0aXFAUzGoIDIBJeGW+SVetEbMh6ja8BG3c4+mFSIst2vFymjC5FKAciXq9z0aiNgK0PsZKWuTREYm6n1UVduHr/nwwIfJTDvLiBgH4QIYtCHTjiLY+gW7W/YBx25n9zZO2G5Vdmnw0JgI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(4744005)(66946007)(66556008)(36756003)(316002)(186003)(6916009)(8936002)(83380400001)(2616005)(26005)(5660300002)(8676002)(4326008)(31686004)(508600001)(53546011)(31696002)(86362001)(38100700002)(6486002)(2906002)(54906003)(6506007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PtOLJnATt4LSymhG8MSOvDevEgGvZ6woxCwObtGHY6NyAjyXdRgbtEN0exiB?=
 =?us-ascii?Q?yDvfGTBjnD+NyEmQSftDLPWb/0gYAf5H7ctFlZ6yRbc+TQ7OFBzzioMVVMSh?=
 =?us-ascii?Q?YlRPE55Fa3xfEQUzxHHTMBlunO4TuRuq07z2IWUNrHXIGZ8Q+kRa1MS15nF9?=
 =?us-ascii?Q?wuFnRQgFc299XxDFsZL/NID7ytixTJNHanOEUMUKsv5rltwYdk38MY7P5QDY?=
 =?us-ascii?Q?bapWGj+xklqxdQencEbpWPRT+Vep6jWvs4iPxmi0gbH4r9zc4XZ8Pfts2mHt?=
 =?us-ascii?Q?r+0/0CNSNxRzXtn/e1pQuod5UYKRgodO8E8cMO4fRuW6GcfHqTmnyeHuAlXB?=
 =?us-ascii?Q?XKWaEjeXy10JsPv+OR2Jfxxc3VgVhkxpi/CJJxaFUQ1N+YlsAUXuHrzqYCQm?=
 =?us-ascii?Q?5rlANXR8o+0V1wo1xHyaCF1TK7VQwOJF6H/CfqdUbgzjBIpDBPQdy2zTTQc3?=
 =?us-ascii?Q?UVxSvzZANraqUCZH82YwTA8VdWlsZ6wV4fLFIxIopBxjGTViETyTef4dpgKv?=
 =?us-ascii?Q?S4JtZ3G4viVbbWnlMkQZIjNvJZxQotq2szzXKazV+yYF9IoRDcypA6esA7Zu?=
 =?us-ascii?Q?vYJ/ocbN0nNWTCIUFK61/xYnY8+MUuomQOzPd0ltFF4aabjGWd6HLDl+0zdR?=
 =?us-ascii?Q?hDZLouAzgjAJ2YR0M9YF2kZxXVXRQ8lDc4ImX9fPAla5FfQAvsa/ASM9TfUq?=
 =?us-ascii?Q?ZvWaLsZjzcpbJWqH2jG1jVew9y+yP3pQsV7k7UF81lGxXu1Gw4a65D3/qhbm?=
 =?us-ascii?Q?NLGWZMClpPE8ICC3VSx8623nPjph1DrmW531L3E645SPo4KYZA/Ilqah6VZi?=
 =?us-ascii?Q?fJml0Ocrdvyz5uJDkDZqO9larAM1yxGMerdvrFGneeupvo5v9lHeooAEWEHC?=
 =?us-ascii?Q?GduME3MhTTqkQAgRqIxF5+qaGPYjNzozeotHGoPckcfnbanrnxHCMsOfeCc2?=
 =?us-ascii?Q?G/BkDKkB2ZdcEUHiOfhcH2ccNLY4rQbFFyx7HE0ctlrh/aJsZKn/jRf3Re9u?=
 =?us-ascii?Q?+Q0m0g00txw7/7pd5VzdyhYYuL7QMaenN9FAyO5s+/efw/rQ/wzlLV8AB8BA?=
 =?us-ascii?Q?+3mdNMFTgjKxSrNFgIr6zGxYXtlbGhTrCEWYFhlHrrUXezM7zMWAmU2OnXCG?=
 =?us-ascii?Q?OMU7ay0gMa1oh6gHW0By0MqVv/Bp2XfDHxtl3ybMn9vpo9mMuDmrr6hkdyuw?=
 =?us-ascii?Q?ImSsQiejuOW9ejMANzHjugXHC/r9JTPsisSyJ9Tse+YpOeWhn3jbSC0CMoOm?=
 =?us-ascii?Q?qiQQRYvkiZiY5ZO/TQVIDkTkljAms13N6HpDuwM7mnYSF1BbsoEeWYN4DT0N?=
 =?us-ascii?Q?t/is8eM3SRTovwmM/hVYgcJTVgwRJvpQRI+jzwvzibM52nBmSckOOeWd7gvO?=
 =?us-ascii?Q?hLfgYP1S6uN5DGKt07fkcK9l1v/OOLxHpRH1J4eRH87/zL970K+gvowg1pWQ?=
 =?us-ascii?Q?NtLbJ0o0Ex+QGtce3ycVswjg14GOdTs9XmcqZtz4UfGcewXdwsNB6o7GD7Yk?=
 =?us-ascii?Q?0Fl5gGhPWLyUSBzlKgyUq+7/r78c2vSs3+qXb4CA7Wpc2WpTGzdCGSpKALVY?=
 =?us-ascii?Q?7z6eibl56wQzApIOMZCzqZXD6JuCADC/2Sq97/+umsnjP/zJ9/YLvE09VB8O?=
 =?us-ascii?Q?/7N4MF2tjK7f2LEkRuI2/BY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e82a928e-de3d-44b7-2bdf-08da02a9ddfc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 15:23:02.5397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxS1+T5sfkwQO4LpT/adNOyfiqSaPSVrxHmb0tHpgxuquqXOeLy256slZRHhG4w9PLftOroRtZBZWT7buHK4tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8715

On 10.03.2022 15:34, Marek Marczykowski-G=C3=B3recki wrote:
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1221,6 +1221,9 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_a=
mt, unsigned int idx)
>                              pci_conf_read8(PCI_SBDF(0, b, d, f),
>                                             PCI_INTERRUPT_LINE) : 0;
> =20
> +                if (uart->irq >=3D nr_irqs)
> +                    uart->irq =3D 0;

Don't you mean nr_irqs_gsi here? Also (nit) please add the missing blanks
immediately inside the parentheses.

Jan


