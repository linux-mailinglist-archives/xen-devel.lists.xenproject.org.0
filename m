Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DC74D4EEA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 17:22:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288485.489181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSLYb-0003Dc-05; Thu, 10 Mar 2022 16:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288485.489181; Thu, 10 Mar 2022 16:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSLYa-0003Bo-Se; Thu, 10 Mar 2022 16:22:28 +0000
Received: by outflank-mailman (input) for mailman id 288485;
 Thu, 10 Mar 2022 16:22:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSLYZ-000345-C6
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 16:22:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e549947-a08e-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 17:22:13 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-uKgLZqA-NRiRnniUwSEhdQ-1; Thu, 10 Mar 2022 17:22:25 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by DBBPR04MB7804.eurprd04.prod.outlook.com (2603:10a6:10:1e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 16:22:22 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 16:22:22 +0000
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
X-Inumbo-ID: 3e549947-a08e-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646929346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eo0H5vpXVTB/c0dc53LE4sXeKUot32StKUTjrflCj0=;
	b=cdovFi0qU2NI5+JGlBsVM3RutkiIGENgctrhHIaAI/COK5LpGWVDSx+LYvKST9CGI8fdij
	5g6Kr+v9eiA6oZAEqgYmaGWffDmArJjc5KXPLsj/Of8/QwqTNeABXBXg7zeO2SAoL7UKi+
	W4q74M4n2T7Z4ZCBJukjyuLGGPLroxI=
X-MC-Unique: uKgLZqA-NRiRnniUwSEhdQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeJmPvpdtYrDX3PYSk8WVSfX+F/i9X596nkgABqKtJFY87n/4bO7bbPW4QV1HRYM3tzPmFYMP4WcAuje5jCsv+wUWSeCo9B1BoKHHtQKpPizAdzxEjX8oiP2tfc3ccwl3heJlQMhQyJaO6NQltXEBt/g9oelWc9/fZxPaP8HxUgx0rGh9N2J18qZryYHwOD07yn7dNzGLASb56pbYfntpC+cu2ZJ8IXVDATf3e0rw2wbqdS+car7bI/pdPkP9psbmEcYF2yXi81AUETjy1GII16VxCrJk6M3RGHDeKW/D+Rb17UvRUIm/W/61ZEzavDHrUjnjMJ/WhR7sgZAxE5Ahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hE3q3K345m9RrR8pA2wdk8zDmQNuz0PME4QfC6V/ScA=;
 b=BYtZB7mQU3nfPIKjVFS5BC8hWDdrBlZ6LvVzISSSlElKSgovfSQPe8gE5+TUn2CXQ62Io1CE/m9rw3xY6uNg9NYn1krFifmHnTksBtY0AEw2HNy5XuErJUEMdHHCc74NM98vgJSIvInxJexBL76Hv19Ki8clPmbYo0M50cy1OK/3niLct6wC1s+T4PRnQCWTxwAIYxMP4VK7kvikq4aBo1HaL4RHAc6v/gpmV/BQQ3lvTVqd1MJqQ2Kojv5bEB8do8t60xumwxiTd+zZRp67yPZtsYioCCEQauO76RPFUYlnTpYAukevbxFkQ5XpTP4Su6LJsbDECtm3iw8SpgesTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15d8232a-51c5-77c8-b246-ca0266576b30@suse.com>
Date: Thu, 10 Mar 2022 17:22:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] x86/vmx: remove dead code to create domains without a
 vLAPIC
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20220215112835.99230-1-roger.pau@citrix.com>
 <b254d8ac-8bdd-af65-f9d3-e2fe69ffdde9@suse.com>
In-Reply-To: <b254d8ac-8bdd-af65-f9d3-e2fe69ffdde9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0075.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::16) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81d0cf24-2ca8-43e1-02ae-08da02b2281a
X-MS-TrafficTypeDiagnostic: DBBPR04MB7804:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB78041D4ADAFEED50E9C8CE81B30B9@DBBPR04MB7804.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CMG/fYOQlh6Lj1oQ7+AC6ur4qnUGQY2JUDSvVphNHzRvGOUEJy9jHwzZUmHF0b7gpWszy0ydPGd0W4IG3boaoOlNLH7cUt3RCMPWJEF0biEAFODEYaKl+I3soE7Re1rv4udf4/uRiaMDJNfIO0IKYZqjmoJ6vd1yyTHG4RFuSira3FKn7+Ad2oicxkXxMDFBJDdIn3MxsgQl5jawlH0iGQumQRcwTvo40XAV+GfJ21jp+PF1/eTuW7ZY01Lg4bpHbHBFl/7nOD26r6b2Z8pgGNSc2qo5U7SxFF9m74FDy1AGglI0vmZu7DitFGEBt38SEecNqKdAUzSPyhoaFg0Gb2oY6eLMnWVEBHqA1E4AYXqIVYFm9BFGGR94/+ALGTEgJrBxhC339KxsY/XopU1uzZg3OCc7lA1E+V5u9qm4tzE0Xr0fHk3cMJCDvlQlVGUzavlmBYSvxeurWWYN+OnUJB6uB/ord1SpH9xA8oloWEsic686M+n32hoej4o94qM/uyAA70kLYkvHdyh8AT+vblvXioqWPOYh7JsGGHrxEv+M6ibfnTTnEYxTRTuYGkYuMojJRL9YWiovgQgFntPo/B/oRD4CL8AMFHdhWS0w2e6mBlyt7bvYk2P8JZIUyDHsFa8SWPYoQyoAA0zKmm/h0hE/SNYsglT4zyJyYn+N9ZnYHC30kOrD0SO2IZZOYXBlmwKOtNVYwaclcqqVXp3RNzDU0IUEFO69k61ckRV3VAk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(31696002)(2616005)(4326008)(26005)(86362001)(186003)(8676002)(66946007)(66476007)(66556008)(110136005)(316002)(54906003)(38100700002)(4744005)(6512007)(53546011)(6506007)(2906002)(508600001)(36756003)(31686004)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZPxSihY1AsxNDVWoNqi+7LgzpMbJW4mRLfFnsomEUOsd1nThPoztQ6f/kd3S?=
 =?us-ascii?Q?9cIIUBu40IHmBDTyBM6+P4Wk6NRflZ/92GyfHy3HNQOJs0OsTU2XBKcDtuoU?=
 =?us-ascii?Q?AMHGD6mENYUcYnCboRp9Bll6VYzJv6aMmM5BpiJFQ4gFKAliGPhkTFsU/J1i?=
 =?us-ascii?Q?ZEV380M51QlDK8ExatfhXLKyIss+ecN+zK5pKgD3bjqWMArhTRuppKf0mIXo?=
 =?us-ascii?Q?RSI0iYjE5Qivnmn4Nh7+/e3i3UbAkEJ6ZMEJrqu/7XSWbYfdJQ42eYhn4Ck7?=
 =?us-ascii?Q?8uVFV3tS9jHmQxhRiNmqlFw4eehFhHyaxjVf+I9HOXD46C6JLfWUE8+rHYNp?=
 =?us-ascii?Q?O3uhgsezkFSAF0GmwqvGuP70RKjW6QSUBMP2bjl8/S7BQb0ttEiWWJzyFjKl?=
 =?us-ascii?Q?IxNCAdk3B2XGmFW/79YREJCnvr92NdL2fM2wjR0Oga43wOKMJ6G0nY9QdknM?=
 =?us-ascii?Q?df/76fHd852aE1J2RF8x2SsCNhGpQ0pgmvKuhLkZ4zTsk+nesK1AMbzGRIJE?=
 =?us-ascii?Q?2hYHi70pcKCUUmXFWQ7vTAeNezzwX0bLPlUCexuBuAvT9Bi3tAR/3DPgyWL3?=
 =?us-ascii?Q?qQu5V69oR2EmyP52yRkEj+TqNyqvZIdFqHYJgs+yuGfcXzLstJQXg+PuPXVp?=
 =?us-ascii?Q?1VfTR95qeGDjBrf9m+FPOdoMUBFrDBM9jirVdU2dq/aqeurbohH7RLB9kZ7B?=
 =?us-ascii?Q?YI/9LeI97D0UhgtVLej+TNH3W2/U0xh44ADV+Of065lRaiWiWF4nhpTqXpXA?=
 =?us-ascii?Q?p1Mebg6Q053NRbPX4rCtCIEEfKQCwinFDGyLVRZXn86vRcL9zGdCS5+g5zsJ?=
 =?us-ascii?Q?NqxQr8vAUOr4a7C9ugh63qpGs7Lv0552zaRTKB87lNGjMbiUb2S23hV1ymX0?=
 =?us-ascii?Q?DkEBWSFwhv4jgd+UPlL2O7077bEdgLLRZadg19E22LIC19hnqvU2yWJRjCpi?=
 =?us-ascii?Q?GJjHC1v9jhbqQdie5jubyUAJ8uSrBaAT3DaOdc0PmD4nq4RS7Uk4qYaH1w0H?=
 =?us-ascii?Q?gFp4h4wNxEP+59VTN7ziURTWjjU2DP1llx2tbnxNCbDiipbMYd1Nv3hNuFAb?=
 =?us-ascii?Q?DIwm1tuYfK1zX1TQ7PWs7tjgt5rYWToJwrt2nTtXXi5nQrvm0Aq/yNt/7aFV?=
 =?us-ascii?Q?aweS9n1CxM4/ZOsmfOzX1MvnwkpD0UD4/pwSsGKdyZCDRjLe58akpe9hdbv3?=
 =?us-ascii?Q?JVRL2BWGQmrxLOxiyNYLt2OCU7cT1dQ0QBBF5rBQujgb9y+VMr1mw7cuFdk6?=
 =?us-ascii?Q?i5bynK04Nk0Q4ywtnCFQRF4zrKj6YSKlHoQUyu/9qUek5VlSNCX/+aRSsfk9?=
 =?us-ascii?Q?AK8liu6Rxmkyy4N68BWY5m2luvjwQgMT2bAeMGHe83yiYvsq/EPR84n/48e5?=
 =?us-ascii?Q?FKihpWPIO6m920STl7nCxK5UNGIvsy+ItwyuMPvE/S73ucOEorU+B//iFZsC?=
 =?us-ascii?Q?Yj4Qkdx0Bm3PMxswzPRf9Phmx+GCnNBs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d0cf24-2ca8-43e1-02ae-08da02b2281a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 16:22:22.7823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KA/CLoEiBX8QL7l4/CBF/UHCX8X1vK+/jYo2SSmD202+SafIaDkkTc+mUtdjd4v2gVDPxOadl7sXf4muNANhlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7804

On 15.02.2022 14:27, Jan Beulich wrote:
> On 15.02.2022 12:28, Roger Pau Monne wrote:
>> After the removal of PVHv1 it's no longer supported to create a domain
>> using hardware virtualization extensions and without a local APIC:
>> PVHv2 mandates domains to always have a LAPIC. Remove some stale code
>> in VMCS construction and related helpers that catered for that
>> use-case.
>>
>> No functional change.
>>
>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Just fyi - I'm inclined to put this in without further waiting for an
ack by one of the two of you.

Jan


