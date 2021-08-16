Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8483ECFCA
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 09:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167217.305210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFXSt-0004rU-7L; Mon, 16 Aug 2021 07:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167217.305210; Mon, 16 Aug 2021 07:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFXSt-0004oh-4L; Mon, 16 Aug 2021 07:55:23 +0000
Received: by outflank-mailman (input) for mailman id 167217;
 Mon, 16 Aug 2021 07:55:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFXSr-0004oZ-5L
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 07:55:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d0f9a6a-fe67-11eb-a447-12813bfff9fa;
 Mon, 16 Aug 2021 07:55:20 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-EzRdqzXXPDKtcubA0f5tzw-1; Mon, 16 Aug 2021 09:55:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Mon, 16 Aug
 2021 07:55:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 07:55:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:208:ab::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Mon, 16 Aug 2021 07:55:15 +0000
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
X-Inumbo-ID: 4d0f9a6a-fe67-11eb-a447-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629100519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GBeqSVe7TY9AdmaPAyvIh9BsyGoNW4bFgLClWkxfydY=;
	b=ZC55I0N207FVdZx4err+pIQ63HqhqY1B+EbCIfcLt/VpryuzS4O55rkA97R78KQ1dd7YW1
	HfAfLkloNcgfPeHZDdvSG7H0FaLwiHjtBPgJkVvZ1NfyonJW4+rIOmP8BZSeAP6KE30b/j
	qkcFJp7m4Lqlrv3B7Pcb+YKLMSDqLcQ=
X-MC-Unique: EzRdqzXXPDKtcubA0f5tzw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFwU4NtIHrV3O74N9KnB/emxBOZ86NemWJ0IQ2+YUp3KSD0YwZwoHVS5po58orO0eW81jILxVZ6jJE0iLprptMNic561ZnRsKSMGMTHs5aows1BtZLiaMOp8zTg6oy9o6W3KJpHw9nbMrYRkHZBdz2bOtNSf5P6GgPtfb2MMS4AfBhVEx8ApnxqBha6h6nugvY6LepQoUtY64lmc+LcM/AUgnu0s/nEVHBnG9ETPZ9CVS43D5FZE82gH2jxMImI2JaQmALY3wsIpVlBrbhSd28JpSm0FeHAEpxScyKsG3KEW/5quoKvGboIDBPQl8+3MSPFRtlpC3/G+ScUQUqpwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKFeOKusJpquxtd00pOoP6vf9uFbiqjeRB5MQoS5kfE=;
 b=Rj1MfK+aUgwu8oSlphIbwcQaNFOW5oRRJROw3rhs95pK5BHeUAGqN1KqfUbZGxMZQK+Q64bsPBu9CVsTAynBZDV7nNqHdQEESImIhedq0mGKo6PC73ejus/QfV3s1AOXRQdseuOpIJmrxmILIpZ0ELjZfkHMRksdJgCazEq7vZffSlvhUgmzXdG2oGRxv/nE5hUKAhF7loor/4TsM9EftOJ4avmWIZKY06SHsiV3fYKf02PDtX/yHU2zTmWF8mpkEIRUl2L/Dka+NhlqAQ/1uMVkoW05vUChDWRGF7tv4Y2Bi8j59a4+xyfbMggV2C3+P79m6fAh7hkxuLumYetL9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] ns16550: add Exar dual PCIe UART card support
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210813183139.391546-1-marmarek@invisiblethingslab.com>
 <20210813183139.391546-2-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0326eebe-2ec8-1c2d-bf2c-8cb4c16312af@suse.com>
Date: Mon, 16 Aug 2021 09:55:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210813183139.391546-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51b04212-5cc8-4806-2c02-08d9608b2f3e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48483BA6CA38CFE0604F3903B3FD9@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uT66AEajXcwsp0MJPyYBvkv912qP0oIpPgF3YIwdYT7fUTATugKQhOdwWdEzDOcx8k+5Lk3PRFc3wkjGfVp5SeGKBozGWSFOxkhXmahFVqDVwdpHU34/MtuKqgp/HWDnV5Gb0AXSYo9++R0SlAsFoXcG/1ifrGmqwZQXOyh1Bh3Bf7Ji1XeG90DWCaZgdrDx3CIF4QL6eRF/ENrIfj6Qp0l7VwGv4FN9x7sPks3k84SWs33mTpubSy2i8Bm77xubjEH2koS8aRYaFHjQ47jE117EFY3TJdZSjMoo3/VxxPZL39xRerBpX+zTcpivHTWOEuODoaN5b/bWqTOKcBDgomrvNWePw8vHykxQukEjZMXv2qRSsgbbHzBEqI6e01/kohWr1rJ5dpUTTlBO4T3fs4vQ0CniLtqHaYYnLNOY1VSojX0qgKlLsTYVwvtKfHhc1QTGt1IKggAqT0d7WLggpM7QQfr6gQSu1SH4BbEsrQOet+tSYa75qbAK+fn9s43dMwEWoHqOyziaLUkLiuf660r82swe6czf+vJX6MlDeP/KKQ4VZ4JZy+jyeE2IoD+J6B7cKHIRlSneg0SiEVdgCVl4YfXgDjHvA0PmTneTlhfEunF4nWCWxICxsShtcPBNk0VMK8mmyaEHUAUps+x7jNqd4L3A0qIj2CrGlioMkjlS8HGkj6Ketnce5gSEN12YckFRAD4KM1mTeSkmNeQeEQ7qa0uYmK27r5cqwoCGb/Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(376002)(396003)(39850400004)(2906002)(66476007)(8936002)(26005)(8676002)(66946007)(86362001)(31696002)(66556008)(316002)(956004)(53546011)(6486002)(16576012)(5660300002)(36756003)(186003)(54906003)(38100700002)(2616005)(4326008)(83380400001)(478600001)(6916009)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wVnnd2bSgPQvbmxnMAY8zmjQZs6nLsoEzPmS0Gy3ljCaDRrzpDLOSO7klq2N?=
 =?us-ascii?Q?0wVfHlZGtb6VGHiL2quqK9FjykzkqeykL234nWMrvqSaxkNlHqsem/PWGuLf?=
 =?us-ascii?Q?2DinjGQ+qsyy+rgFOuFR/mWrCLkviJsNOO4y/RV8GzMW2JJ3xc7okKyhmac7?=
 =?us-ascii?Q?HIocpTyky57+CjalbmxhQwXiBt6FHCAZh3mXj9B2ebIB4NEsdeFe409jPpqL?=
 =?us-ascii?Q?nbbiIb7Z95OZb2DTZdJJfmgda+maxwKXOqHgmfcXwgBulDljN66eHFaLYH/u?=
 =?us-ascii?Q?UQ3mcIE35Ul6YmhGetnX4yke+x3Si5+DclFuMR/eSlUDS71LCRH5Pt2utn1I?=
 =?us-ascii?Q?ZHLzgQZR+6tg+F9u4POS5CtMT0xSJk+eYB23Z1jLW+Z0++IXm9XNAf/9X7YN?=
 =?us-ascii?Q?OPi2g8kYFlG3yCmyyg5rVbKK2aKXICsgRUztrFFi+izzFpX/muyDDX+eiX2f?=
 =?us-ascii?Q?yEdu7eIzoqkF2Pn2PUMtvH+YiUvsH9rrDrd7tXlxF2Vds0Bjvf/wjTxUYEcE?=
 =?us-ascii?Q?0DAmF4Lwu0BdcG6f7etEfRy7vYOczn326fJdUUJan5DANdGZksneJ4LKkowb?=
 =?us-ascii?Q?W5nqPKjpM7wbzApf6IiypNgxydp01Wcf7D4sMZbjXY96SDk7VdXjcud+Ubmi?=
 =?us-ascii?Q?V9SuCJKwpvu09WP5Xp0yXoqDohp8+9ucmrsvByE5Ju4JafOM6qJga48CkEaW?=
 =?us-ascii?Q?SMHClg7K5JgHnopdlF4pYZJrftSG4xWkdABMVAshAv8rz3kEktPim+ppw3OL?=
 =?us-ascii?Q?lOJqFaC6i/DYTcG6H3LZQocJDETeU7D+KOaP/9pZaNY0Wf9OrIXSUWt4bG3v?=
 =?us-ascii?Q?XxS3qK88mr/R47vVpdnVpZozvybZ+I8vMcTGeYm7VTDp66qa7e6c8zc6xvrq?=
 =?us-ascii?Q?KN6bD/ymUvLMdDsl+WfHnogsBo8wTDk+KjyaSugmWq4/bWM1IJ80x9AZMLhi?=
 =?us-ascii?Q?fWdEq3bk70mvYMtXrMPLNcsUiiBaTugXofUR4KNefdk0SLT1yiGK+rAHnLLB?=
 =?us-ascii?Q?spgTbUew8LQEEHFixi0eaGMVsWthp0Wf/Lq9hGaWLDS5ZZwb7YzdL4dvSXmw?=
 =?us-ascii?Q?2GoRydlb3X4+nrlnc6eTcoll8HABBBr5Z/QTpv9p/iozzFEuu/cjUsDBlltT?=
 =?us-ascii?Q?0XFu51xedj65c8YBRhKiwde/g/o6rLR5utt6q/IwLv/qV7J0ZKtZz5GLeXMS?=
 =?us-ascii?Q?pSofRt4NfJCFk5yrgJQLcJZJiLxdXmFSbiHM6qeYRqsxZEahtXtwDiOXJmyR?=
 =?us-ascii?Q?x+WimqAFfRxdjrG6uB0qQdERx7KdkmSNBBhjSjT6iwvbAG2xdWgpsGNun7Z5?=
 =?us-ascii?Q?fiLcoAI/PeOrK+vJDbGMQFkc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b04212-5cc8-4806-2c02-08d9608b2f3e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 07:55:15.9729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7JVJHvX70kaqvS/jB9OND3PUz8mMfqeacNkR3WMir74Ia8bCvVworhyzM6X6YkP61SZ7KwlbO7BgbudqxQIWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 13.08.2021 20:31, Marek Marczykowski-G=C3=B3recki wrote:
> Besides standard UART setup, this device needs enabling
> (vendor-specific) "Enhanced Control Bits" - otherwise disabling hardware
> control flow (MCR[2]) is ignored. Add appropriate quirk to the
> ns16550_setup_preirq(), similar to the handle_dw_usr_busy_quirk(). The
> new function act on Exar cards only (based on vendor ID).

While on IRC you did say you have a datasheet or alike for the specific
card you have in use, may I ask that you clarify why the logic is
applicable to all (past, present, and future) Exar cards?

> @@ -169,6 +170,21 @@ static void handle_dw_usr_busy_quirk(struct ns16550 =
*uart)
>      }
>  }
> =20
> +static void enable_exar_enhanced_bits(struct ns16550 *uart)
> +{
> +#ifdef NS16550_PCI
> +    if ( uart->bar &&
> +         pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[2],
> +                         uart->ps_bdf[2]), PCI_VENDOR_ID) =3D=3D PCI_VEN=
DOR_ID_EXAR )
> +    {
> +        /* Exar cards ignores setting MCR[2] (hardware flow control) unl=
ess
> +         * "Enhanced control bits" is enabled.
> +         */

Style nit: /* belongs on its own line as per ./CODING_STYLE.

> +        ns_write_reg(uart, UART_XR_EFR, UART_EFR_ECB);

Wouldn't this better be a read-modify-write operation?

> --- a/xen/include/xen/8250-uart.h
> +++ b/xen/include/xen/8250-uart.h
> @@ -121,6 +121,10 @@
>  /* Frequency of external clock source. This definition assumes PC platfo=
rm. */
>  #define UART_CLOCK_HZ     1843200
> =20
> +/* Exar specific */
> +#define UART_XR_EFR       0x09
> +#define UART_EFR_ECB      0x10

Please move the former into the group after the "/* Register offsets */"
comment and extend the comment on the latter to establish a link to
UART_XR_EFR.

Jan


