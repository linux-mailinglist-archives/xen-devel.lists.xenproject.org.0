Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F0843976F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 15:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215842.375236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mezw3-0005vc-Fw; Mon, 25 Oct 2021 13:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215842.375236; Mon, 25 Oct 2021 13:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mezw3-0005sq-CQ; Mon, 25 Oct 2021 13:22:43 +0000
Received: by outflank-mailman (input) for mailman id 215842;
 Mon, 25 Oct 2021 13:22:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2Ub=PN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mezw2-0005sk-BO
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 13:22:42 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0dde3c0-3596-11ec-840f-12813bfff9fa;
 Mon, 25 Oct 2021 13:22:40 +0000 (UTC)
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
X-Inumbo-ID: a0dde3c0-3596-11ec-840f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635168160;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0dYutoA2H+Szw7GBOYvwjpwZNMRltC5hDnDEAM9Z5pk=;
  b=gdLNR2AKLq4/eYCRBDnWGLZVRQTpK2rfUWYbhXWsdtDh/p6XoqV+cbjW
   nf1vuGvuOWnnaL+JWWMs1VP8tkt11b85FdeOcPLRNMO3EX/MJU828UIC3
   5JXm20FjF4g546zuOt+pUrCJXkubtMmnoaqxOJ0pWm+8It+gMZ0UBdvzx
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CxEpbkzsiDagcuYOyAGPVFBeZAtQZUSU9sR9cMD5gQ0tc7IoWdlspxmfiJSCNi0/jSUYehCPr6
 G2XnzlN2093Ux3h0UeznxQymfPUeAER8UA1l0i524Iy4Inz5h8ojEHHrLUmIFVvgN65I8PIXnF
 OzDEGTVxBGx3eb0Sep7hFow+M9mRlf/XJ/NnFjJTWJqHjFV4/d/LX7C4dij3MztCmxYaO8H5SL
 Wc2v8HDSIaM6m2E6CZ/nUda3Owbai5Z//RfEiPLxpq6Kb+dZ8rVbkHWkl4rXTfW7xHRgj9X9My
 7xt1L9njHxdywoGojKCC1IRu
X-SBRS: 5.1
X-MesageID: 56375137
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xMIyDKoQUeN27lYZw1DnZGJBQ3VeBmL9YxIvgKrLsJaIsI4StFCzt
 garIBmFaK2ONGD9Lop2ad/joUIAsZXRmtEwSwJp/31jEigWoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2YLkW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYW6cFk4ZIOLos8QUitfNT9ELa9AprCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0QRqmDP
 pFGAdZpRBHPcx9GEH0HNJ0njvWsgCH9YxxGuGvA8MLb5ECMlVcsgdABKuH9cNGQWd9cmEreo
 2vc5nn4GTkTLtnZwj2Amlq0j/LLtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684makUtJCL
 woP+ywhrYA77kntRd74NzW6r2SDpQU0QMdLHqsx7wTl4qvL4S6JC24cVDlDZdc68sgsSlQC0
 VuEnMjgAzB1h7STRWiA7befrT60Oi89IHcLYGkPSg5ty9v+pIA+iDrfQ9AlF7S65vXlFDe1z
 z2UoSwWg7QIkdVNx6i95UrAgT+nut7OVAFdzgzRUnj/tlshTIGgbo2sr1Pc6J5oN52FR1OMu
 HwFncm27+0UC5yJ0iuXT40lNau16vOyFSzTiF9iAbEs7z2ovXWkeOh4/jZ6I0t4N9ceTjXga
 kTTpAB56YdaOT2haqofS4W1BscxxK7sD+P5R+vUZdpDZJt2XAKf9SQobkmVt10Bi2B1z/t5Y
 83CN5/xUzBKUsyL0QZaWc8E24Z113oQgln4SJHJyDK566qcYiCaHOJt3ES1Usg166aNoQPw+
 tlZNteXxxg3bNASchU74qZIcghUdSlT6YTe7pUNLLbac1UO9HQJUqeJmdscl5pZc7O5fwsi1
 kq2XVNE0xLBjHnDJBTihptLOe63A8gXQZ7WO0UR0beUN5oLPN7HAEQ3LcJfkVwbGAtLlqYcc
 hX9U5/casmjsxyek9jnUbHzrZZ5aDOgjh+UMiyubVAXJsA7GlWRooW1JlO1pEHi6xZbU+Nk8
 9VMMSuAGfI+q/lKVp6KOJpDMXvo5RDxZ96er2OXe4IOKS0AAaBhKjDrj+9fHi3/AU6r+9du7
 C7PWU1wjbCU++cdqYCV7YjZ/9bBO7YvRSJyQjiEhYtawAGHpwJPN6cbC73WFd0cPUupkJifi
 RJ9lqCsbqZfxw0U4uKR0d9DlMoD2jcmnJcDpixMF3TXdVW7TLRmJ3iNx85UsaNRgLRevGOLt
 oinoLG24J2FZ5HoFkA/Pg0gYrjR3P0YgGCKv/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHv2AA3NtumjzxP8zjeJHI3TKh65IoRB5Xmi1R3xwgaM4DcECL//LqGd85IbhsxO
 jaRiaeb3+Zcy0POfmAdD3/I2eYB150CtAoTlA0JJkiTm8qDjfgyhUUD/TMyRwVT7xNGz+MsZ
 TQ7axwrff2Dpm46itJCUmagHxB6KCeYokGhmUEUkGD5TlWzUjCfJmMKJuvQrlsS9HhRf2YH8
 ejAmnrlSzvjYOr4wjA2BRx+s/XmQNF8ql/ClcSgE5jXFpU2e2O40KqnZG5OoBr7G8IhwkbAo
 LAyrup3bKT6Mw8WorE6VNbGhehBFkjcKTwQW+xl8YMIAXrYKWO71jW5Ikysft9Aeq7R+kiiB
 s0yfs9CWnxSDspVQuz30ULUH4JJoQ==
IronPort-HdrOrdr: A9a23:t5ckBqCSzfGlguXlHemo55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.87,180,1631592000"; 
   d="scan'208";a="56375137"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJ40aC11ENc7AltmFdumDt0RYoet+EUfZ8ExjRd1ro7XPk4c/qQl2fI6tQv371Xtt0Kw4+RaIcAytP1UL0g/1IBkr7Zz9mMIaQ9Ks+FZPDS2yUC2Vh4HLpWzpBtEDgB6SD1ESQ4KBBt+2UO2ze1c173PKI9DcV/Ik7UuxLJd8yhdEqR+CYnP5PsMAdB74myw179Q0Dqerxnx6plWV51EXdHey7Or0PQtzCUuPdCtuTz3ddOKRut5xf0HsbTwtHo3eZKw1Ah3hMx4g8fHmLnEYCryRGi0s0lwMq1mtDVW24tZ7bsBKTkwjaFJQxMyJaxc4okCLbqW9WAvWS56mPWjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3XmvPIVlrJ7wzpYkZsw+kaaK2vyAPZ04wfI0gd/SsM=;
 b=Sjhgqcyit3P3bOV8Pylb1OSjl8nZ7g58xkFUO5zONXAoqoRzjWxFnFUl0KKqAped0TombCb8BXuslJGHiCpDX9QROOiRqEYSuBodcrlqOeP5BBqmWS8Njxv5A6CPs0wfE+5vGkP12TqX/6Z6Yh+KdTsUi7OhwsBRSYWe4EmX5qfj3cC5wBpUO5paSlAY1gGOEG1pPGYHN1vYcIDbdwFS0xckZXfn44bKbfxlbAI9EE7/1GG1218VmX6VdsxXYxW7yyos+ctoWAhoLhny/WUS127mLBCpRUa1V0VjRlMLlR8bqtySlpYx9VOI5HO5QA6lCL62nHCHL+Np7OfQRNjOUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3XmvPIVlrJ7wzpYkZsw+kaaK2vyAPZ04wfI0gd/SsM=;
 b=evyJc3XCnUBjgDI6XGA86Ito+HRtpfQg0grc3R2lmE27m4E7bcFNVNnSbprW8GmeFJaKssJtUlmBnJt0zght20AR6pDy6Ur3HmQCh8cKEs63xsnD0YRWXJUsYg+nQ5hO1UrnLTUpqYAIeHdTjmrpFDPjqeIe1BhA4OSDcYgKd0c=
Date: Mon, 25 Oct 2021 15:22:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Ian Jackson <iwj@xenproject.org>,
	"Juergen Gross" <jgross@suse.com>
Subject: Re: [PATCH v5 07/10] libxl: Only map legacy PCI IRQs if they are
 supported
Message-ID: <YXavl0e0zainVKT9@MacBook-Air-de-Roger.local>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-8-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211008055535.337436-8-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0191.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::30)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b58c8d80-820d-42e3-891a-08d997ba8200
X-MS-TrafficTypeDiagnostic: DM5PR03MB2491:
X-Microsoft-Antispam-PRVS: <DM5PR03MB24912E7EE3BBDC1192D86E9E8F839@DM5PR03MB2491.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cm4k3ad2N/lyQUwFZ27ERtIoAd2HTWoDc+Aku3SEqC8XGwTM7zQFND5b1AVNYbYnMW2GZ3cpVNk/mzzP0YEL+nFBZt48POkQeS8edoBRcP7extLPD96TGX7QqPpCktWoqH5Nh+dEioRluWp1J6Z2wx2qNF3BfXOsEnLtMrPpUc99W3Rv033T0ExDi0omZLFgXCy7muXghYOMkw3apUB/Y1VlO/XegJszbsIdKVBc1iUjZmjY+DkVOmuYvj8ziXQpHbn4MF0eeA9GaJa0vvpm3ED0sIKYtYX44jUZmqM+jx9BFtxVF2607leZ3prrMy3ZVqxfdty6Ce7j4xPxkqLD5UMlSA1B3lGeN5uQiIkfQLmQ2GWJN5/Km0/SV3uK71KBwS9A9n/dk8/oKziECANs8nsNemw/KwOzrHsPaUt9ZTNgNZt5qknByUgE/hiDyHubdnIf9dfOUqOO/UnecEfMMkqzY0Yfl4R5G39qgh92ylW/KuUWX5dHyPDxfiNSPFcUFTmLi3qCyzBkpHsU2YWJLxBR2MZ9uOhBAzaYAOIn5IaDr9/F7hZW5Vl0aicjOOzjxvS0yHWRwSf1eEiz6T0Xio8lVGI3AqprNND9DCMbmBs4MhYEPPrnkUh/mVsyRFY7bEMF1Gd4ejIL/b2On8TXXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(82960400001)(2906002)(7416002)(6486002)(8676002)(6666004)(5660300002)(4326008)(54906003)(508600001)(956004)(6496006)(66556008)(66946007)(66476007)(26005)(186003)(38100700002)(85182001)(316002)(86362001)(6916009)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVduN3FUV2pISkh4MU8wYTRidFFPbFh6Q3kwWlJQeDNxYzhyWktUejBielpp?=
 =?utf-8?B?WTFLa0VNbXFHeDJ0RUpMMzV4S0JEYUxDd0RIUUJHaUNCZzdUcm5BWEhwMU1O?=
 =?utf-8?B?VlZQcVpuU0taNTg4ZEdQa3dNcEZqRHI0N0RBZjRXMkNEdkdONzlxQWdxb0pn?=
 =?utf-8?B?dU5iOGNMcHRkSGFzUzBNK21ncjBTR3cxcnFDL0FuYWgyNUplUnFRWW9IY3R1?=
 =?utf-8?B?Qkx4VmpRVTNBUFlnOGVEVmJvNk8wNlhUYjFsTkxxWEhOeFI0a21ibUc3RlNW?=
 =?utf-8?B?S3lwaFlvY1pKVkFMaE1SQ0JsZVRYZmFOWmwwaEhVcmp4SXlFaC9UZWswL1Vr?=
 =?utf-8?B?bHI3ZnF5VzFaRGNnQ2VFa0w2Mi9TRkxjcnNQMmFKK1oxNTVsR3h5Tzcxb1pG?=
 =?utf-8?B?elFSMWI2V2IwQ0NobFU1T2dLcmNtdVRUbllJWXI1RWlFdXNaNVJBSzJsU2tN?=
 =?utf-8?B?Y0E3a3BLem9nUkE5UU1uM1djMjhpOXpvTkFSditHM0JxWmF6Y0w2M1V3NVNI?=
 =?utf-8?B?d0ZESmduWDlRNkJDZ0RMRmxWd3BVUkZGLy9QZmc4OEQxc1lZTERYb1VzTjUw?=
 =?utf-8?B?bTJZdkFseUVQS2l0UUFQUVNCdFB3SFRjLzVvT0NaRUdaYTlwbDY5NVNTNHhj?=
 =?utf-8?B?VkJjOEJuVHhjNG5LcStPUTNnWXB3NVdITExxRGJibmMxUkR5bnoxZnpSTlNx?=
 =?utf-8?B?VVdLYktuZDRWWnRyaGRiZVFWNjAwalJOVXZzUmFqUjhaVXg0TEhhTUpJMEx2?=
 =?utf-8?B?bGdjeEFrRGZGVTc5OTYvTTNDQ3p6K2dEdnZTK1hQNVZmUS9GVU45Vi9rcGN5?=
 =?utf-8?B?R20vNENSR0pHNFk0ZHBKVHJTOUxLRit6QTNnUlpQQ0RPN25WaThOOG8wR0w3?=
 =?utf-8?B?Mys5YXlFcDBvWDRuak9qSTRvTDhiVHVFa2RYOW90NVo1SmJJOEVKQ1JtcnNT?=
 =?utf-8?B?Y2EvOVArRXZieGFCaG5OUVZ0REh5SVEyMU01SUpubTIvazlsbFNwek9qYmZz?=
 =?utf-8?B?SFFxU0dGT3JZbThRM2w2dXZZMzdMZFRuSjdNZzZVaFdGZ201YTBpdkZrUnBU?=
 =?utf-8?B?TklOL1Y0aEE5cHZtV1NDQ2FCVmdGVVhWVWhwdWg4TDJySVpLQUdGNXRWK3NG?=
 =?utf-8?B?Y2pZQzRHbmVGNHRYV09nbzVvSTZDVDA5S0k3V2NQWklEM1YzSTNyQ3F5OVJO?=
 =?utf-8?B?dG1POVptaEhFMkUvdC9EZSs2M2UvR1NXTlFQb1dQR3RoUlpubUxUUG5DWVFV?=
 =?utf-8?B?QVlwU1FHdENKbHRreVFUU0ZuRldLenFMazd4VVVNamt2QlA3NlIwaW9jaFlp?=
 =?utf-8?B?U0EwaVl4MldJMUxXMWRtcnlnN1p2aXNRQWlJQ1UybHdReFhFdEkrZkN0cUxL?=
 =?utf-8?B?dG9uYVJiMjJsRVdzVmNNVlVxRyszWkJ0cXl6M0U2MEgxbHlGQWJKMUZzelJ2?=
 =?utf-8?B?TzE1QlRLcVhsRmJKekZ0VnVJS0psZ1dnbkpsVlpWN3F6VmhITC9oRnJpWEhV?=
 =?utf-8?B?aTYvaFhGNEEyRzAzZHhsZ21WTmVtL2lvRGVOcGc4bmdVMzc3aFFDa2FSODh0?=
 =?utf-8?B?cktDd1I5VTFOUURpQ1pMcldkRlhvSWx1NzdEUHBTajNWcUttZERvRlRrRjNs?=
 =?utf-8?B?azllYzJYN1BQU0N3SXVQOXhrSERNU2VhOEgzWnArSWNqMU5jMWtVRjlTTnhM?=
 =?utf-8?B?WU9LSmJoRkxrUHo3RGkyNVFwUUFKQkRsbXVHbit1emU5WXluVnRKM1diZnRS?=
 =?utf-8?B?bDdiNDBsZnMrajEwN1ZaQzhkcS9iMHVZa1NtSDBPbFIxRXFjL3JGa0l0U0FQ?=
 =?utf-8?B?d2czMngrc0taZXR5WlU0d2IzL09HRnNTOUNPNjZoZ1I3Z0Z2NzRvK1VLSC9S?=
 =?utf-8?B?TW90ckY3TS9mZXozVlA0ZVJBOG9qOHYyQlFncEJrblg2ZGlndkFyWUk5MlA2?=
 =?utf-8?B?QS90QmVMWUxnTkJaM2lZVExLSHJ5aTdEeUlBNW9NR1NOQm9qUnl2Vmhidnk0?=
 =?utf-8?B?YVUzZVBhZSthVC84Sm9yaERsV2IyTnZKSWVQUEJrTnJPZENSM3ZGRHk3Ky9L?=
 =?utf-8?B?aU5XMXFSM3YycWk0SFdPZDBTbkhnTEorUG5CajRiL1NFek5qR2F2SEhYL2Yy?=
 =?utf-8?B?ZWEwMk1FME9TdS9BbGVIKzg3bkdKNW43Y1VrcTc3LzRCOFV4ZitKT3FvY1NH?=
 =?utf-8?Q?n7hqjxOmRAsPkCVwWX4+Njo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b58c8d80-820d-42e3-891a-08d997ba8200
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 13:22:35.1415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UtYaTJ8hzEYvJ/7NApWDShraLVkickEmaYhYipDd8zGdkuHRvMsmEiJJ+i3oNTP5V0EipNIgHJdQYht/S9SsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2491
X-OriginatorOrg: citrix.com

On Fri, Oct 08, 2021 at 08:55:32AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Arm's PCI passthrough implementation doesn't support legacy interrupts,
> but MSI/MSI-X. This can be the case for other platforms too.
> For that reason introduce a new CONFIG_PCI_SUPP_LEGACY_IRQ and add
> it to the CFLAGS and compile the relevant code in the toolstack only if
> applicable.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> Tested-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Juergen Gross <jgross@suse.com>
> 
> Since v1:
>  - Minimized #idefery by introducing pci_supp_legacy_irq function
>    for relevant checks
> ---
>  tools/libs/light/Makefile    |  4 ++++
>  tools/libs/light/libxl_pci.c | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index 7d8c51d49242..bd3f6be2a183 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -46,6 +46,10 @@ CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
>  	-Wno-declaration-after-statement -Wformat-nonliteral
>  CFLAGS += -I.
>  
> +ifeq ($(CONFIG_X86),y)
> +CFLAGS += -DCONFIG_PCI_SUPP_LEGACY_IRQ
> +endif

TBH, since CONFIG_PCI_SUPP_LEGACY_IRQ is used in a single place in the
source I would consider just using CONFIG_X86, as I think it would be
clear enough that some arches support legacy interrupt while others
don't. Not sure it's worth going through the obfuscation of defining a
separate one.

> +
>  SRCS-$(CONFIG_X86) += libxl_cpuid.c
>  SRCS-$(CONFIG_X86) += libxl_x86.c
>  SRCS-$(CONFIG_X86) += libxl_psr.c
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 59f3686fc85e..4c2d7aeefbb2 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1364,6 +1364,15 @@ static void pci_add_timeout(libxl__egc *egc, libxl__ev_time *ev,
>      pci_add_dm_done(egc, pas, rc);
>  }
>  
> +static bool pci_supp_legacy_irq(void)

A naming more inline with the PCI specification (since we insisted on
using ECAM instead of MCFG) would be intx, ie: pci_supports_intx.

Thanks, Roger.

