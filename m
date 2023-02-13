Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F9694721
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 14:34:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494513.764600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYy7-0002Yx-8f; Mon, 13 Feb 2023 13:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494513.764600; Mon, 13 Feb 2023 13:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYy7-0002Vg-5W; Mon, 13 Feb 2023 13:34:07 +0000
Received: by outflank-mailman (input) for mailman id 494513;
 Mon, 13 Feb 2023 13:34:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hPdT=6J=citrix.com=prvs=4018836dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pRYy5-0002VV-2I
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 13:34:05 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12c8cfd4-aba3-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 14:34:02 +0100 (CET)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Feb 2023 08:33:47 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB7000.namprd03.prod.outlook.com (2603:10b6:8:48::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 13:33:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 13:33:45 +0000
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
X-Inumbo-ID: 12c8cfd4-aba3-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676295242;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fU3C5XFJST73ONsVDOydkoum9yzfaDwok36FqCyALos=;
  b=C1Kp9csBHms3QdnfBVVpxrN2hZH4cG86tGe89QhpdBRDGKXVJhueLIOV
   oIVE+42Qb3Ylppw3KNWb9xTuxBKr8d8tO4HCYOBtUZgoIxis2S7Xh6Lvw
   cFuF4ueOf3+75QeoisDJcqL89ltsoIxN0tytH0kc/TwS+fkwvtuch8e2M
   E=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 99229319
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gXG3A6zzFRqDQPXZBqF6t+fexyrEfRIJ4+MujC+fZmUNrF6WrkUCy
 mMZD2mGPPmOY2akeNxyPoXgphlX6pbSzIIwGQpp/yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPKsT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXlM9
 aMyOAk8VxvAqs3o4LWEcPBLmP12eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQpuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqCdhIRebhp5aGhnWv6E4fVzdOfmCJsMeJsRSeXtMEM
 2E9r39GQa8asRbDosPGdx+lpH+JuDYMVtwWFPc1gCmPwKfJ5weSBkAfUyVMLtchsaceQjgn1
 USInpXqGCZou72WTlqS876VqXW5Pi19BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWr6Uei4sH2ru2+XjDgimwvd7ZQwgt/ALVU2m5qARja+aYi5eA7FHa6bNMKdifR1zY5
 HwcwZHGtKYJEI2HkzGLTKMVBra16v2ZMTrax1lyA50m8Dfr8HmmFWxN3AxDyI5SGp5sUVfUj
 IX74185CEN7VJdyUZJKXg==
IronPort-HdrOrdr: A9a23:VNKv6qr9JMnEZkyjfZwM7tAaV5tuLNV00zEX/kB9WHVpm5Oj5r
 6TdaUgpGDJYWgqKQ0dcLC7Sdm9qL3nhNdICPoqTMCftW7dySeVxeBZnMbfKljbalzDH4FmpN
 VdmpZFeaXN5DRB/I3HCUyDYpwdKPfuytHPuQ719QYJcelSA5sQiDuQ4G6gYzRLrXB9dP4E/f
 mnl4R6TlibCAcqh5+AdwI4toH4zrWh+f6ID39ndn0aAUu1/HuVAZHBYmKlN3wlIkdyKNkZgB
 74ekDCl9CeWzDS8G6/64eFhK4m1+cJh+EzQvCku4w0LSnpgQDtRKkJYcz+gBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5T/gwRPp3joC42LrjQbwuwq6neXJABYBT+ZRj4NQdRXUr2ImodFHya
 pOm0aUrYBeAx/slDn0o/LISxZpvEyppmdKq59Ls1VvFa8lLJNBp40W+01YVL8GASLB8YgiVN
 JjCcnNjcwmNG+yXjT8hC1C0dasVnM8ElOtWU4ZoPGY1DBQgTRQ01YY7NZ3pAZdyLsND71/o8
 jUOKVhk79DCuUMa7hmOesHScyrTkTQXBP3Nn6IK1iPLtBbB5v0ke+o3FwJ3pD6RHRRp6FCyK
 gpEWko71LaQnieVvFnh/Zwg0PwqGbUZ0Wu9igR3ekqhlTGfsupDcSyciFuryKemYRePiT6YY
 f2BHsEOY6lEYKpI/cT4yTOH79PNHYaWMoW/vIyW1eLqsWjEOfXitA=
X-IronPort-AV: E=Sophos;i="5.97,294,1669093200"; 
   d="scan'208";a="99229319"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQeOVUHMnvzR8gIWY+fgsXIztf+G1a21NpMO9rV8tawdNcbR6qpQoToTiQaa0nvfC+q5ATVJVQ2S5HKQf8HvgLKhwBYtenu/rs5/8MaUBIysNz/NquPRhwTMiDAw1qXadVG06QxnJW3Q2AYr8g2QuN+qYhLZG7PnH6sogtoqIoY49y0PtrwpF/pYFxcf9cDmw1I6he6x+ma+1yre6Ym+AZ2nonwya/hFHWbIydCtVvvunxs/UCTrB1Zn+pkoILJ05s9DdtugpxxWJX1dgK+Wv/QNv6Seh+yyftt44Nh45dgm1/SQ0ib42IN/jC1vYGbeOkEi7JILFgtFJLmzzky4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fU3C5XFJST73ONsVDOydkoum9yzfaDwok36FqCyALos=;
 b=Xp92Zs2tuEsZfYpO6joqOrNMmU5eCYtcUp/iTa5sTbX1enZAuiRp6eswVuNsN53CYJDhcQOrkvlVHMfvcce3LtJbPyIPBs2cUW32hm9ZTDJcYXNojwkKRKyYKwMRdXC2utzCZoMHr+bVb1rpmBs53wa0Bt4ul/pVQjNrAzGSVAovLI3F1KfKUWjXC9anJd7gqUy00GTWuBauXnwG0YSyC8ywbtgTaarxPWzQvAxbLvOFW3tBbe6JCXfdntVbA2jbCidcGcANsHIsHlfFGph+X4r6JkJAbEj8nC5QQFvVt0bJcy7vOiXcRquC5RHExHH5dZA6z1FYne7T2B8VuxZy6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fU3C5XFJST73ONsVDOydkoum9yzfaDwok36FqCyALos=;
 b=QxppqNfXd74bjFS1/E8svnLpD9SrGUn0pasF6RnT5Cnz3c0Rd4cSFJeMtjFU1tGVsiRz+f869ENVQNe1M8so0qe2i+czRBgFYJJQiwPwvv1jPTedNjOk38fLri9BnHwQBXqb2/SvQdmo6avD+7o8Mj4WDlqoXCHBACok/IH7g5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6ff62711-2826-72b9-5864-a37a56d8b74a@citrix.com>
Date: Mon, 13 Feb 2023 13:33:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <64aba76d-1746-9f6c-109a-e8c3bf1e1b61@xen.org>
In-Reply-To: <64aba76d-1746-9f6c-109a-e8c3bf1e1b61@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0593.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: bedd9fa8-6208-41c2-d47e-08db0dc6edef
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OOFE6hfTzU+ubRk33hB54nmiL+OLantx1uRAati39o69BPjvUTmK/Amvk2ygJb0sQFCNmAFpfahWK20t/GrwyjQL/TtpgO+ryHSf1wdyTxJvO1Jzj705hE2U3m1SOoyUS79iCtNHGDu4jeTXdRYagK9yiP04GNyw5Y6RtfkNnNmA0QcWp1GLBfeFMOf6nUSPoVW2kwhmDzqN6fSGB2Ps7+YRz52uNwUn5wKGej+pCD281jJCURjWw7XVczb6cPJNsHC9HQqn0tbDDhZyO2H7Bz0xDFTneyPIZVYUa1TeCFn4sYf7u44ursQjrEpAFVUhvNL79H9kHM/b8Q7rm5WuwkSsHSmDCd0zgy5l79lPoXXQlTc5scCcok252sr2BEzmGQN6bs4I7IpnStFNPn5VmUvTy8c6yD0i/yGS0mAxva2RdIn01NR+u2XUbuR+vRLsM5AhUYdiPdaetm/Ckr+NhVelp5RBZhJUGGJZETnalZJPPPLjKIuHg+88M2zFQLDXk4V7Zm3djTob92anJBiv3eXmiQNVSii7KE5rQUIGmaPgi7MFrM3QysEBhQcC+iGPlTkOQZ51IAaBRJ4OJOjefh9tVYNx+ialgBiOpmGFxSVLCKl1wErjjxNJk0YhuHndIESZTqs/xNr+uUSSr0kWVxP51GpK/Eq973Mr0Uc0E1nSTI49ceJp/6WSy15mGww1MktF+EnnS8P99YXb5J3+jgRxcbdPVa2C5JRPzpH+yIsFApLkJx8M92P1ArPR4xBt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199018)(478600001)(2616005)(83380400001)(53546011)(26005)(186003)(6506007)(6512007)(6666004)(2906002)(36756003)(110136005)(54906003)(316002)(6486002)(41300700001)(4326008)(5660300002)(8936002)(8676002)(66946007)(66556008)(66476007)(82960400001)(38100700002)(31696002)(86362001)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1llOVpHZlJ1MUNBYitHcGVIeFpGaC9LOUVJOTFTOGd2c2ZDZnFhQWdUNldV?=
 =?utf-8?B?MHU2c2RrTytlVWxNejYvSE5hY3NGUmw2M1djRXQxU2Y1YXAreTJYSnZCZ0xL?=
 =?utf-8?B?aHVSd3RFcWN6aGJaSE43Uzc4Tms3WUl2UlJjc09ieERQazAzSlk5ZDdMdUVL?=
 =?utf-8?B?VXVIczVRMkFGRlRVQWVxaURTNTV3MHFnMnd5akFJenJiYjIyUlBRZXcyK1BZ?=
 =?utf-8?B?TU5RbERqaFpTZkhsTUpCckhpbzlYSW9DZDVEQ1hra0ljUkxYZ2ppWSt5aEJ5?=
 =?utf-8?B?MHh0U0FlOHI2SmZTWEY5ZkRtUUcrZHpoeEVVaUtsbGFYb1FXMW9RVkk1cGVo?=
 =?utf-8?B?c24zc2x2ckNBd0NKRjh5UnptRElpaTRGU0EyLzRaeU94bnBPU2FVQloxMGJ1?=
 =?utf-8?B?QlZyeHd0T0xYUmpkb3gyaDN2VG1PcENDUXo0a3BxZlhCQnZacUtBRWZHaEF4?=
 =?utf-8?B?dG1qU29vSXRSN3FVcmdMd0pqTkdVQ1lQUGlsK3F5YzhrQ2djMWtqemMxSEhv?=
 =?utf-8?B?RlIyZXgxSTEyMWIyenVHMzczMVY1SGJReGhvNUkzTGdNME5jOGRDbjBDdVNL?=
 =?utf-8?B?WC9vTWZKbU41ejB6MkNXbjRBaWJVbTB0WFlXTzVGWEduUjcxdjd2bTBreGE2?=
 =?utf-8?B?TUtpbmd4OU9OV2NYOWlLL0FSRUp1dU5TWVRydGl6RmVoZGd4bE5jTlJjQTU3?=
 =?utf-8?B?bExaMG1EQ2ZXTnIvbHRTYkZNcGhoaUlyQnQzbU95b2tVUWlTam9nYWJVd3B6?=
 =?utf-8?B?WHZvZm4zY210NnRwb0tSU1Q2c0lpVytsaHZzMUVaaUJ1dGlBc0p3SVZyVTlG?=
 =?utf-8?B?VGp0ajRWS2gwd2F1YUF3S3U1bkpvVkVQMjlzeWNubU9uSktGaXRFSW5peWxz?=
 =?utf-8?B?V2kwZUpac0FwekpqMlF6bnZjZktqK1BmYWZrejl1enpkbEhnSGh2TU1lQmJ4?=
 =?utf-8?B?OStmM2Jsa0pOUjhpOWRUSEpIdmxWQkZrejR6Ykhxc1RqTkdLU1BJSkZXcFVF?=
 =?utf-8?B?d0h1eENZN0pnTFNuNFB3bG83anpBNUhVcTl1TXQyZm5SMlRkMTYwU0p2dUlD?=
 =?utf-8?B?QTczT3hNWnQ5a3YvOVhTU0Z3d3U2VHRZSS9QZ2JDNmFpR010Q1FrSFdFSzhJ?=
 =?utf-8?B?b1ozTnVxRkhWRGQ0cktqZUFtSGloSVp2ZVViR1Q0NTVYS2lMelQzZTNnSm9N?=
 =?utf-8?B?MmRrZ3hrTTljUUVmQ1c5WjZpaGFJc0JUZnd5aWpFSmR0dDkxM0hoWE80blJx?=
 =?utf-8?B?eStVejNjTVAwZ2pveVFSSmpXMzdsVHBSa05YZitYc3R6TGxQa3hhWDdPUlgv?=
 =?utf-8?B?aVdZbUhLaHhoRkRuSUlVYlp2ajV6VVFCWDVkUkFydUcyLzVGM0JNejA4cFVL?=
 =?utf-8?B?RG51aCt5MmhROFdibitBa0xFbXFEZmNBeGtzQks3Y241NVBhOXlOcjdaaUEz?=
 =?utf-8?B?NVh1THJ0NEJZOFpWYlUwT1JodXo1ckRRaXVPMWMvMWVaVlYxdHVCVUxKdkZh?=
 =?utf-8?B?aG9VR2JCTFN4RC9xNjdjNTZUU2htTHdNQUV5d1JHTkV5d01iLzVVWVMzb1lN?=
 =?utf-8?B?WWVHMFFnMGYva3RFczlpNDFUQm81Qy96NmZ5RUVwVXA4ZEdKRnZYeEVkenlv?=
 =?utf-8?B?QVg2K2RDb0Q2dGpkclJEaU95T2NUWkJyU2JNaFlXb3RkRWVCb0xrbEVFWFVz?=
 =?utf-8?B?YTVMbXd3eVVVM29rN2RwY0tNQWcvQVZ0RVR2ZW5adWpLSXBLN21GbmhVYmds?=
 =?utf-8?B?S1pjd3lyaWdnNWRwWm9sT0lMRjJ6bnQyR0VuK0h6L2d0VXV6RVdjd2tOMnIw?=
 =?utf-8?B?ekFpVFFEVFM3SDgrUHcrL2RraFk0QVZKYit3Wml5ZWNSa3dGMkcyeFF6TVRp?=
 =?utf-8?B?RHBNeHFEYlhxbkJOaDNFb0YvUFczTGJ1Q1UzQzVac05XVTFGTW40ZjNDVTF3?=
 =?utf-8?B?c0JYU3BvNm9Nd29uWEFkS0orUkcwNE1LR3hmOE1VaGJaZnNCVjN1czRDZmE2?=
 =?utf-8?B?aGk4VlV5UDdadUtCeWZ6ZnA0dy9Bb0NROU41amhna2lIZ2lNM1J4VlY0K0Vx?=
 =?utf-8?B?UDIwRU91UGZFRHlyYlVVNU82TmhLZzlXeHdtNVpxRTZsMmpVdFdtTHZ2YjZN?=
 =?utf-8?B?NHBsQ25UV1hjRHBGWmU2UnIwY0NkbnpxYlp2Uk5KRDhJVllFMWlxcDBMd2x2?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2OuuHt8aJCJaMJD53GFqnAODBW3NLp3khvzEuP3QLAAezZUTKkKR65zt4NKaGtPcHyjKtQjPwdR7e0iOF484ugg9NILCersePf6lvX7n5ifyG96chk8TSiBKT/fpmS7u2cod7vY4NQ12vpqWEehQG5JZuoc9UTltIiNIbABscS5lYpZAUZSiXYdpKHdp68fPDIwNHNBhaJi/OTeW5vR//oT8AooGuoEPM6Z/SKMhE3hCMoJJAyW0kpzQXxP3F1OzMfrKfVJxmtCemwYNoYeoWrTezOtnRF5xgVBuknViGx9wkRdpHNVidSLIE2NTEd02T1DX49m/3BT5Y5hOAC5Wh9BJEK6eDbgd8Kp+xfXmgWInrwPVwKPt1HPY0zOEcRKJAgAaBcJRfEyV4GJSaR3a/wkeT8Q26D40JRzLxkVqoZTkhDu1kPNEyoaFFLhr2UPUkIjp7K0PuLG1GIbhXI6vYSp340xyWHblDxaJy9WzKpOQuAHuaC3lxfuQs1eijVMs01Xrdovnhw9DVTub7yHyRqteQEJKPkYdR39uhUbaGg87uPlsCQqrDo2UYWG1AueXmOnAW2elQ4HMuRGgIQvJuCdtJ7DUtr5MIj4qnpa9J4cNi5HYy/z+BUSAM37aYEAJzSXm3Gs+yMS+YHDOoX+2GxBaTbcwTbxC1HJgA5rEs+rvj6A7xZxCeq7wtu1BXgBomOnmxD2FYJGMszX9k0XFcb36o3Uxv4webWXBlWd33F89d9yKXTK6014RcYQO3MdSGdTq5XQ+SRrpKW21DHmMz5WrQWDqLPy3LuzywRBzWrBZPSSyN1ZY7Kz2oGI+elDgvVYlzIHmJyMaurEfT/+xnKKS2rnAhO8nC2kE8omGwqgzNhSUGj7zXa+BpX8GS182
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bedd9fa8-6208-41c2-d47e-08db0dc6edef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 13:33:45.2160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPSfFlMZdeUjFKyiKJxKfARKjkZfJZKACIMXdYcbOUoIh3qDinr7WipmbOEqOVleb9sOIa5hHJd4dzPwWvB73xW4BXLLoJs0p0iphuWYIS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB7000

On 13/02/2023 1:19 pm, Julien Grall wrote:
>
>
> On 13/02/2023 12:24, Jan Beulich wrote:
>> On 03.02.2023 18:05, Oleksii Kurochko wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -92,6 +92,12 @@ config STATIC_MEMORY
>>>           If unsure, say N.
>>>   +config GENERIC_DO_BUG_FRAME
>>> +    bool
>>> +    help
>>> +      Generic do_bug_frame() function is needed to handle the type
>>> of bug
>>> +      frame and print an information about it.
>>
>> Generally help text for prompt-less functions is not very useful.
>> Assuming
>> it is put here to inform people actually reading the source file, I'm
>> okay
>> for it to be left here, but please at least drop the stray "an". I also
>> think this may want moving up in the file, e.g. ahead of all the HAS_*
>> controls (which, as you will notice, all have no help text either). Plus
>> finally how about shorter and more applicable GENERIC_BUG_FRAME - after
>> all what becomes generic is more than just do_bug_frame()?
>>
>>> --- /dev/null
>>> +++ b/xen/common/bug.c
>>> @@ -0,0 +1,88 @@
>>> +#include <xen/bug.h>
>>> +#include <xen/errno.h>
>>> +#include <xen/types.h>
>>> +#include <xen/kernel.h>
>>
>> Please order headers alphabetically unless there's anything preventing
>> that from being done.
>>
>>> +#include <xen/string.h>
>>> +#include <xen/virtual_region.h>
>>> +
>>> +#include <asm/processor.h>
>>> +
>>> +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
>>
>> I know Arm is using vaddr_t and RISC-V now also has it, but in UNIX-like
>> environments that's redundant with "unsigned long", and it's also
>> redundant with C99's uintptr_t. Hence when seeing the type I always
>> wonder whether it's really a host virtual address which is meant (and
>> not perhaps a guest one, which in principle could differ from the host
>> one for certain guest types). In any event the existence of this type
>> should imo not be a prereq to using this generic piece of infrastructure
>
> C spec aside, the use "unsigned long" is quite overloaded within Xen.
> Although, this has improved since we introduced mfn_t/gfn_t.
>
> In the future, I could imagine us to also introduce typesafe for
> vaddr_t, reducing further the risk to mix different meaning of
> unsigned long.
>
> Therefore, I think the introduction of vaddr_t should be a prereq for
> using the generic piece of infrastructure.

I'm with Jan on this.  vaddr_t is pure obfuscation, and you can do what
you like with it in ARM, but you will find very firm objection to it
finding its way into common or x86 code.

virtual addresses are spelt 'unsigned long'.

~Andrew

