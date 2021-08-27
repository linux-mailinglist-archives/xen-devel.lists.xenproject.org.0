Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355443F95F2
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 10:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173479.316526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJX7i-00034Z-T0; Fri, 27 Aug 2021 08:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173479.316526; Fri, 27 Aug 2021 08:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJX7i-000327-P5; Fri, 27 Aug 2021 08:22:02 +0000
Received: by outflank-mailman (input) for mailman id 173479;
 Fri, 27 Aug 2021 08:22:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVCk=NS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJX7h-000320-4j
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 08:22:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 966731f4-460d-45d6-a1dc-9a8555ee75de;
 Fri, 27 Aug 2021 08:21:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-NZHe5rMEPtWksAOofqLvuA-1; Fri, 27 Aug 2021 10:21:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Fri, 27 Aug
 2021 08:21:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 08:21:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.23 via Frontend Transport; Fri, 27 Aug 2021 08:21:49 +0000
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
X-Inumbo-ID: 966731f4-460d-45d6-a1dc-9a8555ee75de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630052518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PU3N5PY65csLgKRbI2/M4bpA138YDrKT5AJ5QL9xFSQ=;
	b=kQowqiRFUGVdwIsdnUN5G7F64tKAXFZtEzZatSw5HXJYNJgUiMnHxLNqFvOh5yE7I9NHJ3
	1FcfGfN+WPEE3YG5rmNMUIzY9yXrf0eaA7CfhyheFqF7YDHdUZTyNHFA09YQ5prYlGXEiL
	0dQvBBjSfPa1bw5flOsvEhzRKIMDZ18=
X-MC-Unique: NZHe5rMEPtWksAOofqLvuA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4V1sRVkHc0GzAhGO1yhCzpwMdYqQQtZmdU6m99M976bjSET4Q/R0TPpFDCBrCYUFEXCELjW99d8bQAumHPvQIEj3aqYGG3gef0LspqdFZwuWITSSg7WYxLQbkKH7tzaxnQb69lUK4i10tZ2nRx/tbYrhEmDmIcKJ046PPCV00yNFlrjYH55/aIh1dcLHQn63jn6sru8FtnA5TJcXeagQBEkkrh5tobNO8SUD2W4enG4spvxGqN7uGiSgKf0ra1ulZIoddRWjnqHw0pw9xnXHeAALMKkenu7P32sjd0927jM5gRP8air3TGuq8QfEfwSpZJM7oX2a/WFDFfnBGPRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vP6cngR9CBrvI0Avsdc6PFiaQqRog3EqvxLzI3sl44=;
 b=BPqQ7L8/jhfRfvdTrMpvuMJ3IDh3mP4PPHLJQzapcx2WMxI+vPmQXVFx5s0cFvZwlzq+al6Vb91GW5ElezgaYpX91Gop189IMpwiFlZ096l+6N2lD5qi3kCdoS43jcu6r/UGA5REf6Zp3MYZfsIu9q5bOF5zRs864EF/H0mBaTys35zC3NuWOe0BkDe4eB0DeWGtgqDVNFskKNIOgEATviOQJbGj8PYIjoSKQptL7eKJZrnZVK7XjrrZP7GMS8B6WVAZZjg8UTs1e1FeaT01gLebhwWVzOp7DGB4LoR45uVW8/E38JyB/AQ/mxw7gJROSNojLhQCuqHUyhe2QoHYSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] gnttab: avoid triggering assertion in
 radix_tree_ulong_to_ptr()
Message-ID: <257a7e00-9bdc-0f1f-fc64-a5147ac4157c@suse.com>
Date: Fri, 27 Aug 2021 10:21:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P189CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08bb5024-ef28-4d9a-4946-08d96933b7f5
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7024C03EF26864A0CD0FD146B3C89@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h4YU2bQI7vQ6flGtEKEQefnNo3NasbG2RAYsuna0zCdydngAS1DA1EV5dHPEsJL0DQGqgCsQB7CYcxVmwcZC2O7r0WBNvCOrwlfoSf9e84qMSPiPkSoGCZrMC9l74YMeSz09EjVtLoUzXhpCm3I4kXmxI1TnTWjXi9KQYylMHGdyKQEq/6iUwxIaHgEaDQ3zPFDmw9iFze84yJVlfjOMN/O4IP4fWbttE5nD9egveLEMwpW3wvOp94r46E3iQjF8E58k8t5q2SF+ef3Qa9wwaAZxO6s5bCWgiIl7APdx8q6iC9i6tOsyZ+kr7uyb3vLQTQWBUiDRgq4l9tGZhPnrW8FS5gpPMgh51fCdZXl2TCVkWkS3roOvIMMYHhCr44NKHqcWMznUYQnXYlqLLY3TwJW2V/n38eoTTKUdBHPPARzvcRd216WQJcoUBSX1z1A1hAjYAYotJ1/7RHYQh1pe4cljmlGXR9rl+VsVQAZdGv8diA9y1/fAxkCe28e12+4Imm7RgoCQQ7e4C51hzN8zyzct4FfF0/dpWSx+rx52Qyub8VF3YRpHeC7Yc219AD++8tYBkfIn6VlWsQgnKgchtVgyZ2BgPvwtS+4VmIJjoCNVpBQwaHkBfN1PAoL5oFCp5NhERar37WVahkfdlreOffY5IEfQKNcChFZD9upk1CNNGSbrW6x1uAvBuXGO+3nG/ytVueBYi+J2lmbrbTWsyVt3MnWwoxjllpacHHtInx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(346002)(376002)(366004)(136003)(6916009)(186003)(16576012)(38100700002)(8936002)(54906003)(8676002)(316002)(26005)(31696002)(956004)(66946007)(4326008)(86362001)(36756003)(5660300002)(2616005)(83380400001)(478600001)(2906002)(66556008)(66476007)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qQubRLudb/QWC7Q436p/72E4lrDPWuWbGQIhjkWogO7aOPzuYiTP1gkOisgY?=
 =?us-ascii?Q?8e/kcMEHkHJ7DNX4BGZLUDi7T6yBN/r3EESQWgx+d1+QYze7YNzWpBDI+LIr?=
 =?us-ascii?Q?W052xfrOhJ/3ikI3MSqjnBiE77r+40iUTzb0+sd9fYwz0mcr+HfZ+T/fGh0F?=
 =?us-ascii?Q?63L47bSuszgUzvDfgvpa44JNsJ4CG+U9UOl2B7CK6ECQlt43JfFZd/dFf3aM?=
 =?us-ascii?Q?5EMqUvAn3iSN+QMZvkgzGgXeeQ2WHSH0ecpzUxCLYOs1PEYl6b/A2/FCVEHB?=
 =?us-ascii?Q?8r7cGlJVQoMNzesSin5TiexUq7ABr1UPna196B71JKrQP0a+usmbkK7mHpgX?=
 =?us-ascii?Q?OaU9iDoD2roQFJ5+gu+YpdQtiey/RoS/N1FZD2gfJm4hWJ+tWB0mnvKxVC3H?=
 =?us-ascii?Q?0t6txX8FkQ2GV5mUcOVHbiJ6RCsvGKz9Z/dUFKZIVz5mndej6lViQoIzAAkr?=
 =?us-ascii?Q?2S3xRWwcCiKUTdz8iKvLC37LmxegsQIRjlbmA7xu6hlR2KBJ3xGbo/WQsxng?=
 =?us-ascii?Q?alKDD8M5bS5xLJWxN2LrRT7MLhGlQ3praQp4gj7boutRRx2MleIN6OlJscSY?=
 =?us-ascii?Q?wgtVPh8iQcxecTR0MhfctJAsQCi+X3UuUnI2XFVDmQPrlIepssjmxzjuS+yF?=
 =?us-ascii?Q?Zn2XmCp+tEgZid8HL/l20nnOyQPkF/Gj7V3wZ5wWTDuksUttVjmk5kUGyHsF?=
 =?us-ascii?Q?eUkPiWJg/sWIbXOoTtItLFQFYGYp1Qg/RX0zBCtXgpzFX4qFl6mr6AzwcSl1?=
 =?us-ascii?Q?toOmyOVaL2JGPsKtqAVi2NzlPCXBVjvAxjvVfQHt7+7cuUCzJ2XyVc1j3cF9?=
 =?us-ascii?Q?++yeJ0LlBaSQEavaXmoMGcGeGd4fGYVE8vkIOEivn1cIjuPTYtbRgd+KS8wr?=
 =?us-ascii?Q?kL6vYV7c2s1sofjlQiUF6TnIELgwklKAnyI578Qiz8d4fVqKHjeiER6n2M9X?=
 =?us-ascii?Q?6SAxsM0XLhw1gxkhDLmT0hoNGjS9GzXGgaMOnzICc5uAnaEMyq4puczunAZ6?=
 =?us-ascii?Q?vYtUV4CHffLxIX0vjH1+cVuqBqhcwoqOKiN+ikLgxFetaSiMhqTimUROhqXL?=
 =?us-ascii?Q?Zve95E62bIrXcBkT05RS7Eq4TAZdcR0Rpull2J3y9NQBFjGzHPGQ6UM4tuJW?=
 =?us-ascii?Q?QttrRBcyMQ7pAZeRWEr0jMm/AviHfFHlFEyPB90pGRPoOz4cPgU63z9Gjibp?=
 =?us-ascii?Q?0TuNm32MobyDUQWuLSmg5LrD4MhpeYOsW/W7p+A5V0X1wQryzKee8SvXHDAK?=
 =?us-ascii?Q?7m4pYiJM6EsD7stKL3W6hnpv3j12xhNopkXmXO7HlK9bJ0Qx741OrVf8DN+1?=
 =?us-ascii?Q?n4ZdsaWMXa2QH1fxqVHHUxwG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bb5024-ef28-4d9a-4946-08d96933b7f5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 08:21:50.1449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIJuAQ3I9eaIRF0YXkZ9bK+zmr1PxXlFIyGtJ3El/qz/nfv3n6HM2lrjCfs8j6QQ1bQ5ZWLQLYuc3TE8pBkYcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

Relevant quotes from the C11 standard:

"Except where explicitly stated otherwise, for the purposes of this
 subclause unnamed members of objects of structure and union type do not
 participate in initialization. Unnamed members of structure objects
 have indeterminate value even after initialization."

"If there are fewer initializers in a brace-enclosed list than there are
 elements or members of an aggregate, [...], the remainder of the
 aggregate shall be initialized implicitly the same as objects that have
 static storage duration."

"If an object that has static or thread storage duration is not
 initialized explicitly, then:
 [...]
 =E2=80=94 if it is an aggregate, every member is initialized (recursively)
   according to these rules, and any padding is initialized to zero
   bits;
 [...]"

"A bit-field declaration with no declarator, but only a colon and a
 width, indicates an unnamed bit-field." Footnote: "An unnamed bit-field
 structure member is useful for padding to conform to externally imposed
 layouts."

"There may be unnamed padding within a structure object, but not at its
 beginning."

Which makes me conclude:
- Whether an unnamed bit-field member is an unnamed member or padding is
  unclear, and hence also whether the last quote above would render the
  big endian case of the structure declaration invalid.
- Whether the number of members of an aggregate includes unnamed ones is
  also not really clear.
- The initializer in map_grant_ref() initializes all fields of the "cnt"
  sub-structure of the union, so assuming the second quote above applies
  here (indirectly), the compiler isn't required to implicitly
  initialize the rest (i.e. in particular any padding) like would happen
  for static storage duration objects.

Gcc 7.4.1 can be observed (apparently in debug builds only) to translate
aforementioned initializer to a read-modify-write operation of a stack
variable, leaving unchanged the top two bits of whatever was previously
in that stack slot. Clearly if either of the two bits were set,
radix_tree_ulong_to_ptr()'s assertion would trigger.

Therefore, to be on the safe side, add an explicit padding field for the
non-big-endian-bitfields case and give a dummy name to both padding
fields.

Fixes: 9781b51efde2 ("gnttab: replace mapkind()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -952,10 +952,13 @@ union maptrack_node {
     struct {
         /* Radix tree slot pointers use two of the bits. */
 #ifdef __BIG_ENDIAN_BITFIELD
-        unsigned long    : 2;
+        unsigned long _0 : 2;
 #endif
         unsigned long rd : BITS_PER_LONG / 2 - 1;
         unsigned long wr : BITS_PER_LONG / 2 - 1;
+#ifndef __BIG_ENDIAN_BITFIELD
+        unsigned long _0 : 2;
+#endif
     } cnt;
     unsigned long raw;
 };


