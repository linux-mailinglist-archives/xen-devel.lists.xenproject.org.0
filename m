Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06FC4455EB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 16:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221605.383399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mieDT-0002gR-Jt; Thu, 04 Nov 2021 14:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221605.383399; Thu, 04 Nov 2021 14:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mieDT-0002eE-GJ; Thu, 04 Nov 2021 14:59:47 +0000
Received: by outflank-mailman (input) for mailman id 221605;
 Thu, 04 Nov 2021 14:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WbKJ=PX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mieDS-0002e8-9y
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:59:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d761bd38-3d7f-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 15:59:44 +0100 (CET)
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
X-Inumbo-ID: d761bd38-3d7f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636037984;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Egel0g/qjpocY2MIuu9W8MEAndCTPcxwzC0ukdNqHfs=;
  b=NqnwOk2y1cheFWOUjXIubv5w7h3zFNRi0lIopW5/vWrza+/hkefoBhk6
   6g2sa/F46b0pG4s/ipsHxBNew/EsmyTq3FnaXlHjtG/vuEcO7BezQD3cg
   UvfU1elFT8oxviKBTIGQ99U4KVLXjUjQ4dngucBxTaLiItMhPvMaNhbBy
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: z4dxc8gzmRYjVxec+4u/Qc8uHtq9RTkvYHLqWTzVx32PCkZMq1iNLRYtzACCcOIe/C7XzThb/s
 XfaWNSFLB5ktCXVrDq2X0l15hegjD3dWLkOYAjIT4RAXuX14KX9u+OZqo0e1SD03wfMubC/fQ5
 wYQk03Kjk/NNcqljGrrY/c1cHLLptsOTlBdqtSxp/5SlD1ZcyvqZsdaGQtb/qVU9gwuu2KQmqZ
 rkH39eypbzjQPLt6YL6u3QVwAbD010ht0bMYRlVwTRRV7gmtFN8wS0ogt4PJm0dw3zcLNkSzi3
 HTkcer8BYHS6pozCv6bNfll6
X-SBRS: 5.1
X-MesageID: 59027134
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JHycp6MM5tdyojLvrR1TkMFynXyQoLVcMsEvi/4bfWQNrUon0jIDy
 jEbCjyAOfuIa2Gmc9wkaYi/pB5SuMKAmtI2Twto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eo/w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxmvz89V9
 Mh9jMC1GA4oNfHsvr8CfTANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWZo3J8XRqq2i
 8wxdhk2bgTGPQ11eVISEJkiv7iwpkTbbGgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3Eru3AhyTgQ6oJCaa1sPVthTW72Wg7GBAQE1yhrpGRi1G8c8JSL
 VQO/SgjprR081akJuQRRDXh/iTC5ERFHYMNTatqs2lh15Y4/S61IDgbagJcWOV6sZ4/RDd29
 nnSgP3AUGkHXKKudVqR8bKdrDWXMCcTLHMfaSJscTbp8+UPs6lo0EuRE48L/Lqdy4SsRGqum
 2ziQD0W3u1L1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHd4
 xDoeODEtYji6K1hcgTXEI3h+5nztp643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK51gMtcEOZCL6N/cmC25UNyjM5fKwfTgCfqqFBuein7ArLFPXlM2QTRfIt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1itcWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8ris9JAHKLXee1U7cIzjYteIqY4cl0Vet/09vs/D/
 22nW18ez1z6hHbdLh6NZGwlY7TqNauTZ1piY0TA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:vpgrEawIEE6DzAySHYmgKrPxvOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjkfZquz+8L3WB3B8bfYOCGghrUEGgG1+XfKlLbalXDH4JmpM
 Bdmu1FeafN5DtB/LbHCWuDYq8dKbC8mcjC74eurAYfcegpUdAF0+4QMHfrLqQcfnghOXNWLu
 v/2iMKnUvaRZxBBf7LeEXtEtKz6uHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0ihj5/T/M2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1Qc/hb2jf0RCWYsBHt0w7v3HIH7GLj80aRhT/ZrcnwVFsBeoJ8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVjlx/3DE4UYKoKo2tThyQIEeYLheocg050VOCqoNGyr89cQODP
 RuNsfB//xbGGnqLkwxhlMfguBEY05DWytvGiM5y4ioOnlt7T5EJnIjtY8idixqzuN7d3FGj9
 60e5iA2os+CPP+VpgNcdvpd/HHfFAlcSi8Ql56Hm6XYJ3vG0i94KIfs49Frt1DRvQzvewPcd
 L6IQpliVI=
X-IronPort-AV: E=Sophos;i="5.87,209,1631592000"; 
   d="scan'208";a="59027134"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClMZJbHnR9YSZkOZ3Za+1KYGzgXnLLgD3LbEQSNHWz12pCXsPlQAwO4A0jL5qrF+6SfYtd5eVg5JW17EAZNIMSMMuwbOFs9mZcNawHz/gJCK4Ybw2mCy+WaYXbGsqXbl7AyylhFjwRLWnqdIOz9iKhHWpZYC1rNlHFYmkIdPoqb451SaJASPKFpJXOhmbdzpTffP3hMDLMQjPNe4Ch017aRbTwEpJtBVf2mN+8vY5gKcCrgNbLXWHe8rlUoyJbfJJyihj4WTm5GnsxsHYDc0eQ4UX1f2y+YWY22kKe13NnxTaUFaPidIdk1jNwTvryZqZaQTMIBdnWUOXE2GeKMZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Egel0g/qjpocY2MIuu9W8MEAndCTPcxwzC0ukdNqHfs=;
 b=kkHry3+LkBxc4zwyNrYLH/6oo9ZEKGlzDSLF6MklBrI4PhM56Z4p0fmwFcrh4KvwBGYsPpYGvlh07OwQgCegLgQ3xeK+5xCm+K+SYSBzvv4H3onwufMtkeb0EiMjHmmmy3/q3lW+TueSOlXS+LjitaPXAmZpHRlhmw5nKnIjTG2DJN91iYY3cfpwaOmiN9n9g3xI0U/ZKzu6qzMCapnR4IdOz1wco2esgamuE+4IGjEpgrpxKO3ojN7vaQGxEOz/n3MHTXo3fy12b4r6f5DqzI7mOiBSAAGsHNvN78/NMe7piO+b29iM3s8gsxd3E+5r+QaEWF4qtfs2TX0KnKg5dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Egel0g/qjpocY2MIuu9W8MEAndCTPcxwzC0ukdNqHfs=;
 b=jXAqx68SVh7DC8tWjgtBKeMGABqsKasxg8moeiofSJ26Qv1i0NiNRzCueMAyBpqmbIXELoyXQ/Wgc60wIjJgVyiE0369sF5xS4/E+Bf6BTPUHItqHJmU2JmYhdrsLA27LkwZVqtpaS/cvjVl1wY6Z9ausCWGgOpCDaH2ujuPQwo=
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211104144242.14351-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH-for-4.16] tools/helpers: fix broken xenstore stubdom init
Message-ID: <54900dfb-c6fa-a2ad-471c-227a4888c687@citrix.com>
Date: Thu, 4 Nov 2021 14:59:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211104144242.14351-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5229dac8-b333-4349-7da4-08d99fa3b8ba
X-MS-TrafficTypeDiagnostic: BYAPR03MB3445:
X-Microsoft-Antispam-PRVS: <BYAPR03MB344559C9D5CDC098C398D0F5BA8D9@BYAPR03MB3445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfUOIqEpPUh/eXN4Dx42kekpOJKhteHo61Cr4/wkcGLGOt81/9XLrccR3qVwu1IRdVd7O0CSnOJ/NoSaEUuhb++VuGc7LRm1ckuiNgk/rUSNzWtcxAHKMx6kgiQaXnW60tgGEMwA9gXYVzLQ5mDHfira73/VUpdIGLslpN0czqvpqZOVYy3JyC7Nuv+qCmjv/NBzK8bzPEqcLJCcNDEuIq4mHTLDLyMGdJ8dHXfK6ioQhU9iYQBjPNExXXd8JSmTnlNyZR7FmE9ENvc20SmdL8LtcaxIGD/aRMEcQ7/gumBvbJvRo+d0rWnBda1r1Lm/o36pTbUsr8kB4cCTNHnR4iX87+V4bd/z+51nvtfbzpp/uVk9wSC9NFXl3zyHT32VPY8myFPX8HSM1nmiB/EII5RlH3lYfR9Exi6x7/QhnaqeLlUxdiWdsWJHtFSsGY4CJgLpWL167on9UB/BTFDcV6GIYTtKqWITONnuqHGhFdiMm/HB9BecI4U5QxKXdaB1dbtHOm+vWoiKdwJdm6W1ckcwAhu085ZFsWMYHL4xdeI9zj+mZPjsrzQUPQqc4Bq91k1rHPoV2PdIExDPvxLWykVcO+dTGXkAr0GRi6wok5YkttNb7VreXXoyQFIDqx1uicESlIvjOP3GFQq2Jb3hl85Z1op3cPBv889cQqocBMuzqSI1tPNeKiKG3ibU/8hgLr81b4WoqmWFcQl8kRVzGtHnJb5iWbDzFNh39L7nGEUwGyLEzUPesVYXcNchIGBO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(38100700002)(26005)(83380400001)(186003)(8676002)(5660300002)(36756003)(31696002)(2906002)(8936002)(82960400001)(31686004)(4326008)(54906003)(2616005)(6666004)(956004)(53546011)(6486002)(508600001)(316002)(16576012)(66556008)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGplSForVnFQL1lZQ1ZDOW95TTBVVEQrV1VQbkh1d3V2Qld1dDNxcWdpOGps?=
 =?utf-8?B?U3FXRHo0b3ZLSE04WmJsZkhPQU9ldDQyWDNrTGdoR3ErdVZrTUlTNmtqZEgw?=
 =?utf-8?B?Qlo4ZGMxa09YR3Jqd0hxTXJuS3FIaDgrWVpXenFHVmpIZXhDZzRUTEFlbTU5?=
 =?utf-8?B?K0QrTU1Kd3hxZy9jVnlXeVBSWUJYU2VzV2lsM3dmOE5hSUNFeVBkRHFobVdE?=
 =?utf-8?B?OVRYMmlIYXpRZ3N6VEdZY3JOcDVTdkVLRTFqb2lQNlQ3b0RGUnRJb1Q2cWpj?=
 =?utf-8?B?dFZOektWVy9PK29EN3FtMnF4cDNnVjJYUkZiQjc3TzA2bzcvWm5IbDJlS0VH?=
 =?utf-8?B?c2psNkVkNGVIdkhNUXFId3FQSTNuS3NNMjZwZlhpWGNlcG5yR1pVSURITGUv?=
 =?utf-8?B?S1lMN1Ard0NrYkVlT0hSSWhyRmFtOG1tR3h6MlBTT0FtSkJTTFo5eGtIRm4z?=
 =?utf-8?B?S1hzTWZ1eHJnT1V4VW0vc3JSWlF2Zy94elZFdXBqYkQxbk1PcEh3WWYrMzJU?=
 =?utf-8?B?QmhOeHlpU05SRksrOVRUZjlESm8zVGZaWnd1TWJtSW90RW15aDlVdXh4Um1m?=
 =?utf-8?B?L25Ib2ZxZnRXZU9nWlRVS1d0Q2VucXJRRE8rU056MWc5MUJtSTFsNEN0WXRz?=
 =?utf-8?B?U3Iwc2pNWWZxNytQYkJtaTMyL2c0bnBTOGRDR201RmVyM0syQ3ZmZ2lHNEE4?=
 =?utf-8?B?WWlhUU40dWpGT3FCZ1NFOGZVaE5WMWVoQklwVU9hbC9FY0g4M241Vis5TUpr?=
 =?utf-8?B?eS9FUU9IRndkRWJtb2t4V0hzSHBJRXZOKy9IK1U3cWUza0pSKzE0eHV1RTla?=
 =?utf-8?B?bERJbjJLMkVJOU5jK1ZoNVhEVFRRK3BjdGd3YXc4NDJIWlVJRlZHcTB3QS96?=
 =?utf-8?B?Sm5YRkI4QVAvYm5aemVMZ3lqN25mdmFIS253TjEwUG02SWlXYU1zdlJmV0tr?=
 =?utf-8?B?eGRDTW1hK3RweGNwT2RyK2Nza2I2eCs3Q3FoOHZ5MVRMYjRCSE9XQ1pIelE0?=
 =?utf-8?B?RHBGSm1jcVlaaU15SW1HTUpKUmE4Y2RyQUErS25sMWoyRzFDb05uOC9PMXZX?=
 =?utf-8?B?UFpkcGM1WjVlRytrS1lxb1luckVLZloyYWt5M0tRRkJWTUt6WWYxR3BRemww?=
 =?utf-8?B?ditJZWZZNzlrcnlmcmw2aWpWTjR6RGJOcWJWdkkyU1VlWDNOcUtyQjgzK2Vj?=
 =?utf-8?B?b0xmQzJZYkVPdGV6R3dxaWZibkZKVXNIdEJXSTRQK2JCRVNBMmxjZXZhZDJP?=
 =?utf-8?B?RGRpalNUQ0lWeFBHMG1WSUhwRVpXUmhNeFdGdHkrcGYvVmRZUjNwL0dpSk1L?=
 =?utf-8?B?TzhwQlowd0taZWwyOTRRVEFHY2x4Zi83bi9OS1hIRThiWHRGUDgzOXM0eWls?=
 =?utf-8?B?czNnelcwNjRKeVRnd1B3Si9kUW9KZndQZzJkcmljcElqcDFuWGg2eS9FUTFl?=
 =?utf-8?B?WmRTYzdFWVVRWnkxUTJSWmsxczZQclptNHBTcWUrbkNPVzlXRFBGdUlpdmpT?=
 =?utf-8?B?T2pPM1ZwZkFMSU5pU2NFQjBuWkZhcExoVkluZVZHQlc2a1lIUGtCdGhkdGJR?=
 =?utf-8?B?WDV3YmpaRTJVa1FXMVZjcWNBSEJPSStFelVCMkNyeEFLbm9OaElHOXNzQ1ZO?=
 =?utf-8?B?R3gzb3A2cDQ3cG9TY0RFKzhNSFpLZS9QcXdTZGRsZDd2SGRnOURuMDYxWTNO?=
 =?utf-8?B?UCt1Y05CbmJxcEkrZkc1eGtyNEoyblJsdHh3bm1sSkN2U2VjYThyT2hVUjZr?=
 =?utf-8?B?SisvNHVrR1RaL3ZaM096cGd6cHQ0VWllMXlBQnd6b2NSM1duS09xMmlMZ2Vs?=
 =?utf-8?B?ZzcvOUV6RlhCWi9nalhsUEhGeUhXQTNBQmNIQ2k0aXhvR1JhOGVMakRaSU5K?=
 =?utf-8?B?dERZYlNPSTN1VjExNGFtY3FibHcra2VMcjhSVU1yYTdlLzVFcmxyQlhlb1RJ?=
 =?utf-8?B?VXhETmFSNm9SUldJYng1OWhNK0pLendCQ1c2ajRFOUVpS0wwZ1dabTZ0WmxG?=
 =?utf-8?B?cW0yRVF1dG8wR3l6MCtDZkVTQzRRcDJZQVFyNWRwM0liVnhjZHFEQW9WZTV1?=
 =?utf-8?B?eHl5MUg2Q3hRMk40cUlVdU1DYU9NaGtaSkRXU21jMDVIY0lnTXlBRWJaM0hm?=
 =?utf-8?B?akdkNW5VWnZYMFR0enc4d3VDWXdyZFRYaEE3OE1FaFBBY1pGS1BMNm80NnRO?=
 =?utf-8?B?V1pJM1hRWWZtbStYaWdRZGNGTmRYVnFZUjRjYWJ2Qlg0NjRuYlQ3WjRTQ25l?=
 =?utf-8?B?VHUxc3B3Y3prSWRma21pTmdhbWNRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5229dac8-b333-4349-7da4-08d99fa3b8ba
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 14:59:38.6745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icVgTG3b5T58DcmG4IMYVD8G18F2oCuhpEPpj8Ts6eUuMkgGFB8qnCiavPlz/vhkObgG3zZFIjv807t3udu0hEiXvop+zZQu7CUrEfbcdwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3445
X-OriginatorOrg: citrix.com

On 04/11/2021 14:42, Juergen Gross wrote:
> Commit 1787cc167906f3f ("libs/guest: Move the guest ABI check earlier
> into xc_dom_parse_image()") broke starting the xenstore stubdom. This
> is due to a rather special way the xenstore stubdom domain config is
> being initialized: in order to support both, PV and PVH stubdom,
> init-xenstore-domain is using xc_dom_parse_image() to find the correct
> domain type. Unfortunately above commit requires xc_dom_boot_xen_init()
> to have been called before using xc_dom_parse_image(). This requires
> the domid, which is known only after xc_domain_create(), which requires
> the domain type.
>
> In order to break this circular dependency, call xc_dom_boot_xen_init()
> with an arbitrary domid first, and then set dom->guest_domid later.
>
> Fixes: 1787cc167906f3f ("libs/guest: Move the guest ABI check earlier int=
o xc_dom_parse_image()")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Release-acked-by: Ian Jackson <iwj@xenproject.org>

This is all rather nasty, and really highlights problems with the
libxenguest abi, because you really ought to be able to ask "what ELF
properties do I have on my hand" without an implicit "and try to start
building a VM using it" on the side.

I agree this is probably the best thing to do right now.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


