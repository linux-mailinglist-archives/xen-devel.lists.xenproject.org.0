Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDD35B848D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 11:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406877.649278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYOT6-0007Ju-Fu; Wed, 14 Sep 2022 09:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406877.649278; Wed, 14 Sep 2022 09:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYOT6-0007H4-CZ; Wed, 14 Sep 2022 09:14:04 +0000
Received: by outflank-mailman (input) for mailman id 406877;
 Wed, 14 Sep 2022 09:14:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VL8e=ZR=citrix.com=prvs=249e2d04f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oYOT5-0007Gy-BC
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 09:14:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91a7f811-340d-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 11:14:01 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Sep 2022 05:13:55 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5839.namprd03.prod.outlook.com (2603:10b6:a03:2d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 09:13:53 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 09:13:53 +0000
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
X-Inumbo-ID: 91a7f811-340d-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663146841;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RW/3n3gnlZBydCrVFpd9v+PdkceLxnz1W47cEu+zC5c=;
  b=MZxXRXLMqB8jwxY7yUOMhMngeE03Ac5FX3STw2UIX3fRxIF24JHYEksv
   gCu2Ggg9KcPmVpsifq/t3FykWIE9ReLE96BBvfdKL91jrQlgCQ4YlqIwQ
   802Z1QJm92Fu8eeUiaSg3Y2IF5FpzgUOk+ebHLLPmRK3KiHHMfYfL/pk3
   I=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 80147830
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9iENyaylLx0mg0oZbJN6t+clxyrEfRIJ4+MujC+fZmUNrF6WrkUGn
 2MXXz/VOP+LZDenf9wiO97j8kJTvJOAyNc2GwdpqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Uoz5K2aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1yMWJxNpASyNxlEEh8q
 qMaEDomVD660rfeLLKTEoGAh+wFBeyyZcY0nSglyjvUS/E7XZrEXqPGo8dC2ys9jdxPGvCYY
 NcFbT1ob1LLZBgn1lU/Ucpi2rv3wCShNWQH9Dp5poJui4TX5BZ237X3dsLcZ/SBRNlPn1ber
 WXDl4j8KkFCbYDAmWHdmp6qrunAky3JZaUyLayfqK473BqqwHQuJzRDADNXptH80CZSQel3K
 UYZ5y4vpqga71GwQ5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceWjgCx
 lKP2dTzClRSXKa9THuc8vKfqmq0MC1MdGsaP3ZbEU0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdv207gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:G8RRran4QMfXAzzVDwezKGnjT1XpDfO3imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH7KGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 D4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR8Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqXneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3GlpT1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYzhDc5tAB2nhk3izyhSKITGZAVyIv7GeDlJhiWt6UkYoJgjpHFoh/D2nR87heAAotd/lq
 b5259T5cFzp/8tHNxA7dg6MLqK40z2MGbx2TGpUCPaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.93,315,1654574400"; 
   d="scan'208";a="80147830"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhGOeAlvrTdFoK4yycEoavBZ0yiO8wgOUo0dqh2dVBMBuZbsVOwp1Y2BM18tOpU2i7ZSbNQGUVUabfoaHPmwu2MVqbKz5aFjUPGtIqS9if4/xC69nt27Ye/467a0TKzs6FvP6y471Zj9V+usMOGV0uFDC6Xq+Y3SgQPsXv7mygFTCQz42l0ayLYPLdV1QPxhFZUVVYvPJqqum3tjB2isGI3zkojHQiNB+RMyDsIGSonUf8yaAhQENDYGkSB0sRDOZdihB6dmkaTr+Br0MGrJghoFwXjKSvUHuDYfQEOJ9TRa6v8i6anasXJ5BsoJ6cZwhKeIOZBAG4+78f70xookwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyIRimXdcvsWwDAu0Fp3XuJ3HBSlF0vaJM+TCBloFwI=;
 b=PHYgag/xJQz2kHvvNz+kIWFdRWujChp/nUuH7YpC5qgoBh5sKC/K+/QUuHYyTydmMRIJIPoZdJ8kyS1dG/i5jUMDpSo8cXsSfn0Dv41rcmhB52DotMcr3qy8IBbj6yQeP/zd658pry19bSW3r+SZBB2TOXaBQimLp7v+EVt9uaJZP9ePik9YknYj+3TSfjCfw0DNQDRiryfgxM+AE0p6K6S26xGO49dtTkOX0qqUJhnKXvm8rh48reexr586pL1mwrtg53GAbAT/tX2fMOfLLnJEaQUNv4TLSFIUmlfLzuEO5frN5cRAfwikioTBt1HjkoVdrw7ZTKv7dDV2mBOneg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyIRimXdcvsWwDAu0Fp3XuJ3HBSlF0vaJM+TCBloFwI=;
 b=lAAVtJTXXIbSXQyXe0hmFSCiGYFjVwF3Pt73sd7heXAGenBJgXUbU70/0Aj7JtKfOvSbdpk1WCBSurW0RGjV/3lfCED9OqE3yQA6YnVjWTLJkL/8kcFi+5nrWbUKJ+rfiBv10JkeQVwUdBnySF1MLpyuqhJgPpPCjNs64nbLUbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 14 Sep 2022 11:13:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: enable interrupts around dump_execstate()
Message-ID: <YyGbTIwaO+a2KVFW@MacBook-Air-de-Roger.local>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
 <YyCYw6Hi0jVg0L+6@MacBook-Air-de-Roger.local>
 <74fcfb7c-a699-03d5-c8aa-5f654515c566@suse.com>
 <0ccfe125-9455-8f40-430e-cfa1347b0aed@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ccfe125-9455-8f40-430e-cfa1347b0aed@suse.com>
X-ClientProxiedBy: MR1P264CA0198.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|SJ0PR03MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: a5494902-6f40-481c-1a24-08da96317198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3wQkJS6T8UKLOqEeZvXN5RBx1CHNMXhIu+rtzxJWCljKKq5qGSiqtTxZR9L8PxiylyeoSyb5sqyvg2iTmWM6SeF20x+mT9xGPQt63Lq/nI/XEzpZdjLzsRadv34W12CG37e5t9qJ5qvRWbx6SMWsjG/Mpmn9lpLA4C8rlzi5Q9dsn1D9h0Z532lWei8aDrc0Dfuei1quRE/LNTSkN4wkBt4x74iSUIM7chvt1LSvI4MHEEa0RdOnlo5xopCxhehUgPir7aXmUmaaWFnG7onFJ4uMUB7zlBmB5FeL5QO4W9u3JbAdodwLjW6PRpmmGZ9Ne3LvEkat2ldN6CbsECZ/VVzgjUGieoa47kvJgONMQNrm4CuDeOESeoAtI2UkTLtHedYo7RJuHSHQBiDNJ0+oM9PUVUrIjXYXYaYlknhNUhV67N7Ls3lTlUPFcZfWwV2vNXzpSommM+UYNQ2EMSkJaWhJkRdlRsLt24UDUBUS4mRmJm0rjRjHxCDtUPDzlcW8pnNAXYGrOwirNpkZEnas8qdWprxlNMJTXb+eUiT72lebS4SqzNn14ssLg8NtoAPoBRktjHwgolvrrchtQMqsS69XUUZ+yUfEKFMtXYc4aP5mzV02gX0C5MZndRMcwef0lIpGRTxpCn40Cm46h6r0Jt+TWDH+pXy2HtBEXTi/nGUXhottc44U5eFL8qOVYCnoF6lrWqyQkg7qvog6XhalViEQQF2M8MdRWe+H6qQ/wzprHcSxJ+lOtFiZY3oTUjbecv+qm8ldlLQ/qdup1EN90w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199015)(85182001)(66476007)(4326008)(8676002)(6666004)(316002)(66556008)(6506007)(41300700001)(186003)(54906003)(9686003)(26005)(6916009)(8936002)(66946007)(5660300002)(82960400001)(2906002)(83380400001)(6512007)(53546011)(38100700002)(86362001)(478600001)(6486002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b045S0QyWTJ2eVJlWUc1QjZRVkRWMno1YzVva2duRmI3bHRtZzdneGlpd2RW?=
 =?utf-8?B?Qi9xSkxNK0MraytReTZrOENrS2pTQ0hXTG5qcFlBRjh1YWVDOWFZdEZtb3Fa?=
 =?utf-8?B?RUdsQ1h6dUtNaDlyTWhpcGZTQ2dpNW1MVUxYTDQzMmtCSVhtUVBhWVM3R2xP?=
 =?utf-8?B?Y25uSzhET1IwRHYvV1Y1S0NTemdZYmZ0SzFqYm1NMDJJTkdBYnA2dkJibEhV?=
 =?utf-8?B?dmtXNmVZV1ZWQ3oySW80bGZadUxlbE5uazFqRjFGa1o5YnBZWXZxYjhOaDJM?=
 =?utf-8?B?a0NEbk5IZXlHSFRBSjZxZUE4eEVSNXlwaUhuUjBVMEsrZDF2Y2N4WWlJMm51?=
 =?utf-8?B?UmNGU2dwNk9aM0NpSUo0QWlWVmZhZERYYkljT0kxYlp1cWY3V1VQREpHT1E1?=
 =?utf-8?B?T3FkOEJtU1JlY2lQY3NLc0x2aC9mM1h2d3RXVFZNZGtxMFpFdEZyQUw0L1JT?=
 =?utf-8?B?QjI5QmQ0dlBqMW9yRk0xOG1oc0RBYWFHQ3RPTFNHSmFZWndpUldCZ1VUUzdt?=
 =?utf-8?B?d3dNelRkb1NjZWVhVW9wZENVWU9WTjFPWTJZQ2x0eVliM3YzbmdaK1J3Y0xI?=
 =?utf-8?B?NitwTkM5R1RzMHBQRGFFZTc2a1VMTFJXRHAzRWxmbkJSSmxWSFNRUjhxRWhR?=
 =?utf-8?B?Mk1pQkZBdG0zVGo3WXU5OTFGR2RsTTVNVWxNQXRySnJKdm96a2lTd2diUWxZ?=
 =?utf-8?B?TVdaeG43MUFtVkoxeXpTbFVuMUlpM0dSSHQwamgvK2VNVjZkS0hOb3J3aXAx?=
 =?utf-8?B?SStwMGVEVUxvQ29TK0lFRHFFNnlYSHhvSmdIbEt1dzN1NkNZT2YzWEJRNTJr?=
 =?utf-8?B?RW1ueWh3ejhCTkZXckR4TVRTaDJWQk1xWldxMS8xQUdkWE9RaGxlZThFZUZy?=
 =?utf-8?B?Ym9LSXhUKzVzSC9WaXZTMjRZUWwvMVJLRy9WajgwT041MFZwaDN3Sm9pSjBn?=
 =?utf-8?B?dzQ0STN4bXJpd2svSFZ4UUdTRWNNcjE1VDRBbk0wYkhxdmwzSTBrekg0eC8r?=
 =?utf-8?B?S3ZLWHJ0aXljcjUvRi9RdHNaTlozT3JvTFVSVEkrZ2tXeUxBWUVrSVl0Um1t?=
 =?utf-8?B?TUVBRFJDY3NCNlF2bnVKdFFGZGNrN3BYYXhOU2lZT25FZ1ZSR3JKdk1lbTRs?=
 =?utf-8?B?TGNwb1hrVU9vWmZSazR2Zm1sRzhJd1FIUHdlL3pJU2g4TzdwYUFCZm0xQVox?=
 =?utf-8?B?RUdqSzAyVnB4TVZEbGNoQ1JiY0NMOG9SYXFOSGJvOWpYdmNuYlBBRG5Gblgy?=
 =?utf-8?B?d2ppMFZJSVEyZmZ5VE44ZU80bnZINnhjYWJwUzU3bFZzSkZmVk5XZWV3UjV0?=
 =?utf-8?B?V2hveWpxVURLSjhnUmNkRFo1M0FjZm1EL1hZVU4yNjlXdXc1Z0szRmhwUHVB?=
 =?utf-8?B?SEtxM21ZTEVkbHUxNVZnME5VeFU1WTFqRlAwUnNIQWhKMnY5WmpHc1dCMnEy?=
 =?utf-8?B?aGN6aGxQZndlVDA2Q3FWbUZxSVNZM0kxcDB6REZlaVVLOFJvOWpTR0NDRmVa?=
 =?utf-8?B?MXR4K2ZQRk9EVGxNQS9QejBYYjdwRlJxMkVabEMweTE5YkxPYjJNUkRyRlI0?=
 =?utf-8?B?Smp6cHUreGZYMWVhVVVDUkdOMDg3UTBUSHdBV0hTMGU5TkNOL2pzMXZ4UWNV?=
 =?utf-8?B?blRZd1kwNDgyZ3VsRU44QW9mYkd0KzRWY1hQeHA2MG1ZSCtyaUdzK1k3cnAw?=
 =?utf-8?B?dEkvSDdiQTF6OFU1by9DQ3E2UWFYRi94ZE9DLzcwM3dTTFR5aVRuZ2lwUFBL?=
 =?utf-8?B?NEgyRnQ1bjlhTm5FcjlTbk9hb0RIQ3ZlR1A1SU5uQ1V3ZHJvYzZtY1d6QXY1?=
 =?utf-8?B?dWs1bi9BQWVza1A4V09Ja1JwRVQ1VDdjZWlWNUxkdXpjVS93TnM0Q0Y2Y2dl?=
 =?utf-8?B?QXM5TWMvMHF2MnVINlI3czlHWWorQ2JHbWUxQ0tZSlpJbndscS9BZ24rRUxK?=
 =?utf-8?B?WDlLZU92OENNTHNuYzR5V2grcDVqT3MvUTZJTGpRaGdPdTFlS29QUkVISW9h?=
 =?utf-8?B?OGtJMEhHTUZSMlRDeTk4a3NsZUx4Nm92VWZXNG5sOWIrUjBuOU5YYzZ0Vkpj?=
 =?utf-8?B?TittMm95aHlmOWlKTWxJUUxNU0NOUnlyYWVQd05XRUcyaDVKMVJDRnpZeG4r?=
 =?utf-8?B?eVlaa212S0tzMlZSSTZzQUgrR0NsOCswVk9WMk1KdnNTcWhoMFRaL1ZsSVNF?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5494902-6f40-481c-1a24-08da96317198
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 09:13:53.2515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGTpkVzeKH3LPAkrwsczwC2aM7sd/nJFV48VbJoJcwge5vU9yCPHdPdP0iNzOA3cczAwdpuYHTY+P81GITdLtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5839

On Wed, Sep 14, 2022 at 10:31:34AM +0200, Jan Beulich wrote:
> On 14.09.2022 10:14, Jan Beulich wrote:
> > On 13.09.2022 16:50, Roger Pau Monné wrote:
> >> On Mon, Dec 13, 2021 at 04:12:55PM +0100, Jan Beulich wrote:
> >>> show_hvm_stack() requires interrupts to be enabled to avoids triggering
> >>> the consistency check in check_lock() for the p2m lock. To do so in
> >>> spurious_interrupt() requires adding reentrancy protection / handling
> >>> there.
> >>
> >> There's also an ASSERT(!in_irq()) in _percpu_write_lock() that will
> >> trigger when trying to acquire the p2m lock from spurious_interrupt()
> >> context, as p2m_lock() -> mm_write_lock() -> _mm_write_lock ->
> >> percpu_write_lock().
> > 
> > s/will/may/ since spurious_interrupt() doesn't itself use irq_enter(),

do_IRQ() does call irq_enter(), and that's the caller of
spurious_interrupt() AFAICT.

> > but yes - we could nest inside a lower priority interrupt. I'll make
> > local_irq_enable() depend on !in_irq().
> 
> Upon further thought I guess more precautions are necessary: We might
> have interrupted code holding the P2M lock already, and we might also
> have interrupted code holding another MM lock precluding acquiring of
> the P2M lock. All of this probably plays into Andrew's concerns, yet
> still I don't view it as a viable route to omit the stack dump for HVM
> domains, and in particular for PVH Dom0. Sadly I can't think of any
> better approach ...

Yes, I also had those concerns.  The mm locks are recursive, but
spurious_interrupt() hitting in the middle of code already holding any
mm lock is likely to end up triggering the mm lock order checker.

One (likely very risky option ATM) is to introduce a per pCPU flag
that when set will turn all mm locks into noops, and use it here in
order to avoid any locking issues.  This could introduce two issues at
least: first one is how resilient page walking routines are against
page tables changing under their feet.  The second one is that any
page table walker p2m helper should avoid doing modifications to the
p2m, so no P2M_ALLOC or P2M_UNSHARE flags could be used.

Thanks, Roger.

