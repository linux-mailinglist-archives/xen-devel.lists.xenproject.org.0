Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1792469767
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238991.414228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEJu-0004PE-22; Mon, 06 Dec 2021 13:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238991.414228; Mon, 06 Dec 2021 13:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEJt-0004MI-Uc; Mon, 06 Dec 2021 13:46:17 +0000
Received: by outflank-mailman (input) for mailman id 238991;
 Mon, 06 Dec 2021 13:46:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muEJt-0004MA-3f
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:46:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e21f08c3-569a-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 14:46:16 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-PJoQsTZUMxqc8g2lI-lDIQ-1; Mon, 06 Dec 2021 14:46:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 13:46:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:46:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0145.eurprd04.prod.outlook.com (2603:10a6:20b:127::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Mon, 6 Dec 2021 13:46:12 +0000
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
X-Inumbo-ID: e21f08c3-569a-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638798375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fM6hAJ2Gk/MdXKd56GTzhYd2Gh0RSVIo21mXClaoYUg=;
	b=MmAjfiwYZuWI10Sx1QhYPvFkmwTXM3UuBOsDZDU0VzacYmmOgQnvZDYFhWycAiL7VwpWlw
	ODErHDOS8D9LuajFvW5godqtF9Q8xfgXCx6kCeHcef9pjUXWR0xshYHuozyVBkm3MXgy5z
	esnzh3FIX2ZbNp1ST0E3jkKMbZVMVH8=
X-MC-Unique: PJoQsTZUMxqc8g2lI-lDIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZXX2S/2J3ODvb9nJEEwv8iyXo8yxCfMXSu+Iggt5bM+8jO9JnUnVrIlFz/9iGsOh57cX5tBInWMC+J+ZsuBsipZGtRtHm5yq+8yG3LTTMOu1Sa4pTRUTox1ErM9Jv1I9+aV1er1ncUCRL5XWSgiA5cSM0Dv8SZeim6HrHuz+njlcWv+u5oWNI5xFcJuQDlT71gV2T3Jn/J/HPSYfLOezNWlRP2ChZ7OksbvrEIEkTOcSa7bETXft4FLRnT1v1yNA4H6RoxKbIG4UEnB2BjvQeAHGRV9tCifSaWJW7BqlMthheudl2W7AX8pJzngMce3Y2AXJSCzgd1FVMhYPtPy9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fM6hAJ2Gk/MdXKd56GTzhYd2Gh0RSVIo21mXClaoYUg=;
 b=KIjESMT6ed1weWD568Iuqi99jF/5VDz65YsR2xcV927Zzi+lEWiskM/ovoWfAw20Geu/PX6f7TvnLvrdcUQzv5AZ3gXZdcbNSR/dWmDEjMPo94u60uaDx6/wcYNKeFHjht1772+Z6ubNyBnG+TjlCMGzM0HCkWKOfDtf24Fql73zx15zqy9bX63qywvc/hwDNcCAhigfDBfSKLh7NeEebUr1UzMkjAMBPlih7TpG1rBqPxKu7TFRYO8dBHwEuqwg0bNWoPnRsmQ91wxfcNuCjgXUoA1hBBpyHmpkAY0H43OaBB5MSqOCEElVYS96vkBx8EraetMWLjddMt9YmAKc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec046d2d-9a36-200f-59d7-9137c35a7497@suse.com>
Date: Mon, 6 Dec 2021 14:46:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/build: Move exception tables into __ro_after_init
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211206130725.13511-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211206130725.13511-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0145.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fbb0bad-7b24-4850-63c5-08d9b8bec49a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70404430E9B6FAF4DD448A24B36D9@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KpN0rO0ZSpsZk6Ct6fQJUQNKq/FJ6Sk2C4cNCnW4CPA9ErmFdChQ6vv0MOlrG8IWubpaVk5lC+z9SHviZ0y5B+zTJgOxUSuddOTkFTEK9C0tF4kwFI280DF+8R2OzWoUh4nJwkrrLMDmk9P1W/naItuAXPv1xCoDSKI30hVQpCLF3sEec2FBYJvHOZAQuYd9ZzYRmy4Rc8w55wetioWJ1nZGn10DfW8zzkWQ7ylsBYuYq7JrKzlBOpFNWiXe+rC2S5U9ioMqD1uuWQPgpZYA/CJyhZ70uCSTGZ2hj0hxa8FusW5iSFja0d4SSWb5NK6N6HdpeaFxgyyfrYfh3DI8h9rtqmPJLY9I138cq+0yWSu4zCBuF8ZjPgym2opOLP2mopZfdXggVebP7KIn85H04+hl0oSKf15694KB8k9XyPw4dKRcBu1V8jvErrLTgTGJDHfCgUM8ozln3MdjKBb+xciWwFhnmh1TiQ2ziZlTrVtuXbYqBn7cX7y7DbinoIrmZuQUwMTRY4HeePrhpa854dW0CQwumbhIz3FWqMExj54XsfNrjxz8BSYIm9vmlpnjxHagwtUigSM+ZYU+AKqfIgSim55kcBMwIXIi5JbUaFAEur5WlOmvFHIWZSXqYbtiKY8pmojZsT+hGRPxH9MLDflDd+ZjrUVHrIVgwJbfHuN0d/Hm4wf9YK91MGbV3wqywo0vKRYLSY5B+imTzRXB6j9bRpfsxvbViGfyD+n5o6s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(86362001)(186003)(6916009)(316002)(2906002)(26005)(16576012)(4326008)(2616005)(66946007)(956004)(6486002)(53546011)(4744005)(508600001)(54906003)(36756003)(31686004)(8936002)(5660300002)(66556008)(8676002)(66476007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1ZmM3hGQ2YwMTlTU0dNei9TTTFxQWZWemR0SzVidzM0TFFmWHJLWm1qTita?=
 =?utf-8?B?SzZMSXdLSDZDQWo2WnYrTWJWZEIzbU5GVmZmUnNYNnd6UjRBVjhQenJvelNi?=
 =?utf-8?B?bkg1RVlDU1B4eE1KQUlaQk5KT2UyWVdMQVd6amNmQ1Y5QXpCWVZqRENTTlRh?=
 =?utf-8?B?bkpFNHJyRVBURW91VktqeGJiNDNvcE9kaFFrNStwSHlNSEJWRFBpcEpCYUNr?=
 =?utf-8?B?cGt0Y3ArVU1YQTZHQlo5RE8wRmZ1SEhLNnlycHM3K2pwZ1BYUjJ6R21wdTZS?=
 =?utf-8?B?cStFZ0lMbHI5NmdNNWVPcHBFendGWHlXMWtDeGk5MmcrTGNOYzFBdjcwS3M2?=
 =?utf-8?B?aTRQci9oWVRDemE5ay9CSHBmSi91WldZcEYyTVEzeDBhbWF4cDR3UDNJUVkw?=
 =?utf-8?B?M0ZJWWZCN2Mxa2pjdWFYTjZXdjFyeVpKZEN2OXlGdDFhSlFJQWRHdjRZdWJB?=
 =?utf-8?B?L0pkSkdVMURxQ0lTZVU5TmpzWVNTVzc4QkN3OXVNbUd5RXNlSWtUNnZGTGw0?=
 =?utf-8?B?VjBIUGlBZGY4bGkzRU5ibHo0Wkd3QnVhVGlWVUxOQXRRUmgwc05JM2haLzhs?=
 =?utf-8?B?RnZxZnN4eWRqV0FEOExhRjZxQmJuYTl5d3RjdlMwU3BOVFJ6V0dieFRBbzg3?=
 =?utf-8?B?bUpLZTAxdGNackw5bEE3Skc5cTMyaHNyV2dFOXpaNW03c0ZiU091ZkdlNzRh?=
 =?utf-8?B?VXZjTHlIMC93REJQcHJ2SmI2UFFOMmcrQklBVFl5bXE3dWdmZTNsaEE0Ukd2?=
 =?utf-8?B?Wkp5UkZiV0pDcjl1a1hkVXNOU3dZbWF6RDc0cW5oVitiOTB2eW1NS2RhcWsv?=
 =?utf-8?B?RjBXMmlUektES1B0U2dlWGhOYndlZWF1dFFCSmE0eUJQVjdiK2pnVjZ1Yi9y?=
 =?utf-8?B?aU1FT3FYQ2Z3Q3c0M1R0UGE5bjFCSjdXK3pGdUl1WmNMbG10UzNld25uYzF2?=
 =?utf-8?B?N3N5enlzMTJTQnVzMmtOS2FVK1hDYVpjK2g2RjFlV3Qwd1RHaGg3VmZ5ZDlr?=
 =?utf-8?B?K2pmbUhwOFMzWTd3bGQ1NnJ3eVdxaUNweTNVeGlxUTkwTlpZVXF6K2NQemd0?=
 =?utf-8?B?TkJZT3NTQUFYc1VweTVBNUo2MDRUK3ZJYkUrV1FRRitRcU9Ha1pQWG5sdnI5?=
 =?utf-8?B?NlcycHVuYWZBaXcyRkw4M1hFbk5ZQlJ0NThRTHFEdHY3Zjlmc2tITjhneFRJ?=
 =?utf-8?B?WjBGLytyVngzUENDNi9pN0IzNDNSZUlCYk9RcndGOGpnS3k0R3NpeENWM0pw?=
 =?utf-8?B?d21pSXlkK0QrSHNLT0RPWk9YTEpybVRjN2xiNjVHM1Q0aklyYnVTNDQ2bTBE?=
 =?utf-8?B?SG91N0pQajFsTlJsa05nTW00TnlkWE9OVXFMallvV2ZCOWJ1NFRCZHJqYWJp?=
 =?utf-8?B?ODRJT1g5TGU0Ym5xd1dTbEJ0TVlhMHVhY25sOTRSYUs1VVVLU0haTFgzbW13?=
 =?utf-8?B?K1NvZTR2d29La1JoaTRldlhQSEc2dEJQZXE2bnNXQmRQdExPQmZUSUhvVnd5?=
 =?utf-8?B?cWdzUW8yVE94RFEyZHlGcXJ4eDV0cE5SbHdiT0hIeU1PRVdLazJGd2F5WDZR?=
 =?utf-8?B?U0h6ci9ZOUp2VHNFN1NpbUxta2FYZmdjNmRrU3ZMRkxUUGJKbmdpMDBCNzJE?=
 =?utf-8?B?VTN0eS9MNUl4U0p2d1IrWmE5cVhVdUdBWjRUc0x5MlY2YkJNa2psNXYrZkNG?=
 =?utf-8?B?bVUwUHFYMlhCdDVxeGs0K3k5Wm9UdDBucEdMQ0t0Y0lGd1E1TllHNDNKUzlX?=
 =?utf-8?B?V05rVnFzcFlFMkJIYjF0N1BNQUFGODI2N2FEdDl0YVh0bU9VakplVHNyTmlM?=
 =?utf-8?B?ZFhsZDR1ang0Z25NNEc0cFJCdnYwK3U1bUVkK3M1WDRUUGoyajFxRnUwOEJy?=
 =?utf-8?B?cFlra2kyRmNLTmFBdVlmRUtZY1JTTHF0UkZxV3FienluUHdIY1VRYkZpRzVw?=
 =?utf-8?B?QnJtMXUzNitPOHlrQ3c5b0E4YU41OGNoNVNLb20xdDlvcWMrbk5QZXdLZm82?=
 =?utf-8?B?S0sybi9zSHVYQitUVDhyaklSWHJKcFZDRkx1VzhpRHJmTWh2M0xEcWhUNlR0?=
 =?utf-8?B?azdjQkg5RUxDZWoyU2NuVzNTdDhlRXZVcWFORnZ0YkpQcXl0SVpjbkptS0JG?=
 =?utf-8?B?K3VDOVVyWk0vNFZaMjF5bHY2YU1hSEpPbk5NR3I0TDloWVNSNjlUcUxVY1hn?=
 =?utf-8?Q?lcw8NLT/TxxaRkKagyx+Pic=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbb0bad-7b24-4850-63c5-08d9b8bec49a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:46:13.2974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4dS0eUBZPJotCoz6XKdWIXVI2vPKpWBR963H1eA3L+hGdsKyTzMYRrZAQX7lmIVlzw4V3OdIjQ6qNDVZNQDvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 06.12.2021 14:07, Andrew Cooper wrote:
> It turns out that we've always been abusing the fact that .rodata is
> read/write during early boot, so we can sort the two tables.
> 
> Now that we have a real __ro_after_init concept, reposition them to better
> match reality.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


