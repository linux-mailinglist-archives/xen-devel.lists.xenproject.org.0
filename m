Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CCD791304
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 10:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595016.928479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd4ef-0005BR-U6; Mon, 04 Sep 2023 08:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595016.928479; Mon, 04 Sep 2023 08:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd4ef-00058p-R0; Mon, 04 Sep 2023 08:09:53 +0000
Received: by outflank-mailman (input) for mailman id 595016;
 Mon, 04 Sep 2023 08:09:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vltW=EU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qd4ed-00058j-UZ
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 08:09:52 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bb0eb5d-4afa-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 10:09:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 4 Sep
 2023 08:09:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 08:09:46 +0000
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
X-Inumbo-ID: 6bb0eb5d-4afa-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThPuebcTIf67xv83p8adNHBv47AV6gF9rVQBHdcfCXIKgRM/2jXAQ2NZNvlxuZkXNJcT4dus4LKD9thcrPe8Lbjyr+bFJitH2mJNXZ7RorBRXpAWd9cG88G5oE/OUm/TX+9FtYivJTlHti+JouoPdxee70Z9PUUqMQM8m1qSvLrwmUwWAw7+iO1izbGqj0QCGGzq8SSihxBzWnoZRlre5T2oe6niyWeaWKRavZbA/5KZ4tFctnLYi8Bsl/UyZJPmOaIj0TcH7OBk2Ts0O516G5VFpBxriTBrtdRDR6WFiJb9ItDTnTxMzoPjHXz3ETnhzrJaUhJ0vvAsCfSzvaXzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPV1n5wU+6knr2XSodVZzlJ7DcWx89sqS/gXBWrYl7g=;
 b=ZzNtxf+NhoVRHk9Y8WX1HLWmDKVOc/e8zQSp+nIGFa/yblLou/2YuhvzJW3sfNDw/gdgq7dB59qoEy0s7/P+66PA8aGloA3/whcOybRKlJnT2rZEZagm0IY116rydL43y5N+UhqaZHuujOkDzIMtGjak5YP4888oKRqBQZQDeB+usqdxgJ7w3MxoIzBJn7dG8eyTBwqqCfAoAbB30nJnF0UpgchKkBIteBtg7TFilAFo/E188Pew6I0dw/ikis449K3LmvCcYis83HX5/JOSPEJ9LY3giVh2k+p1fhVOf+GU0tNzkQk0pG6flnhzsxa+0oTNvrQTpvnTVrlBxlO3Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPV1n5wU+6knr2XSodVZzlJ7DcWx89sqS/gXBWrYl7g=;
 b=MKOuBKVYmqH0w9uTr/7gtQlmwAIK9QD1Qy4kXqW9GydkPjIhszYcD0ir+DjE7bmHL6//PoM/6H0ujsGpe/+9bXbtA7CEWm+rXBES2mAkuFNmF+mO9hCR4I0o/+X7n8+L6Iyj5Fx618o5H5qiLigGBqhZwQY88wYJ10Q/tMb81rYGaFf0RlpXBxu4FuPtl6m3RDM76BO4T43OGIDEv1nOrpYWen7sGWsW/DH+m1hn/sqoIvcs0yoLADAOhrLPClmkcMtjXYfF5gmXDhwPLeTYsiZ7JF7nmSa7vpkHSKJJGrMQ7K9G4dF7FNu7HLH0RG95AWvhVrrWgV4/FY+AcbYnqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fff285f4-55e9-3709-372d-2344e7227dff@suse.com>
Date: Mon, 4 Sep 2023 10:09:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH 1/2] xen: apply deviation for Rule 8.4 (asm-only
 definitions)
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693585223.git.nicola.vetrini@bugseng.com>
 <a260399a471b84f3c37c15ac735dc7aec6bd33ea.1693585223.git.nicola.vetrini@bugseng.com>
 <efb3dfa7-0fd0-83a5-67dc-eafad0a2bb57@suse.com>
 <babbc14aff87b0d8546f4c617eccac3b@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <babbc14aff87b0d8546f4c617eccac3b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: 3218a493-2751-4023-95fa-08dbad1e4db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hofzn3YrCuTHJPtr/vl7oebQcoRvkm4IA71kJnBDuXFgnWY0lJkgLcpJwa/l4ZLqjbmlRjU1C5oDXCPhaZhgrY4pTe4j7O8Xba1zHpkTddMnM1ItLgIPA5WVyj40hTWI0gtJ77grx/5izfsMXt6TlUBrf5U7I6FGp21LMzJ28moTmLk0Y+1OkfMIl9U/oJBwBwEwjeX6Tfiysg8m6un5vcPVyFbtOxm7T+08tjSplkpBplZsxMMkDAe6F88+PF3U9LCYlfFHD9iUxuuV/uMSRGp+tFjvr8Lr/AqXYS1/bqyNexlJn8kyushUm2wF9LePjk0/clQdWh2B6zAB6IyUsTpWUnz/HwXrRFzv7L1jgR8a85W4A3a//p12tfP/NlsLHCa5ZptCKkPQfx8V7H2O/ZbCT3AtpyWllOLT4FnPuqvlbdU08aJ7oIZRHDKx2WjsvbkaG//fJg3EILpGb2VL9c2e6pfM43Avw1y9c+njQxwLPmGFrCl22KZ+328HmHGY/LAlvZLu7S8zW+VZvOpuswNipey8i/rw1L/qX5JPl0aEhlyX+sIezZuzRKpYOxTq3Xbqn6wP4uMbQByxty6wLigfd0KjiTWEy5f1RRgL7/9CjHp65/4zBSM2UcAipKaa5W5nRbT2WkYKCDoNOWuu4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39850400004)(346002)(366004)(186009)(1800799009)(451199024)(26005)(6506007)(2616005)(53546011)(6486002)(6512007)(86362001)(38100700002)(36756003)(31696002)(4744005)(7416002)(8936002)(41300700001)(316002)(54906003)(66476007)(66556008)(5660300002)(66946007)(8676002)(31686004)(4326008)(2906002)(6916009)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVBWRUJtWjd6QkFibE9TT0FJVCtQRllmWHNWa3U0R3FOZjBOc1lBTEw5SWds?=
 =?utf-8?B?a3VSQ2VuR1hIWGVOcFNHaVBzb2N6U01vOTAzdzA5SUQyM29OV1B0azhvWUs4?=
 =?utf-8?B?aEcvZ0ZOclFyREVmTi83cG9QZnFZdDBvQ2hLLzA1dkJRcnhzbFoxbUZlVnY4?=
 =?utf-8?B?Y1ZDTkdiVHlXazFPWFdBbHMveExWNTVWVDM4TXh0S2JIekZSYnlpLy95Z2Z1?=
 =?utf-8?B?UDc1WFp2dERxL2VDOWdiYWkvRVlwdWZHdld2YTlzR1kveHhjMHR6MTVvT0Iv?=
 =?utf-8?B?cy9WNkw3WkFBbThsbGVtZy9RSDZIcEg0SExZMG0vYlpkSFNzOEowRFo0Yi9Q?=
 =?utf-8?B?akJEeFhyNGp6Uk5IdGE5V3hNd3AwSUJRWHEwdEhyQ3Z2dU9qMVhRek5IUmZC?=
 =?utf-8?B?RldQVi90bW9wQWZOR1lTd243LzZQQWV2SXRKUzFvSWFOZ05hTDJwSXI1R0dX?=
 =?utf-8?B?L08waFlJZC9sbVFReE9rMTFsRXpic2FFdTVSaHY4ajJxY0dOQjJEakd0QzhC?=
 =?utf-8?B?VUhPcEE0TXQrYzBHYTh3QzNEUCtGUTU4cGpkWUFzdU5kK25lQmtwWkVkVUlS?=
 =?utf-8?B?ZTMwYTdvdjB0OWFWRXRIT2FvQXdZWVJBeDNzQU1ZMndoWnd5djRubVRXeDQx?=
 =?utf-8?B?N05GRDVaYStYRlcrL2EzTGFxbGo3VGtRb29uOHBHRzJ0UFQwUWVINFcxb2li?=
 =?utf-8?B?K21hajA5UlNOYzFvWkxDeWFxNWU1a0h5V0tyL2dNbW9rcUZBN1dKUEV5bGMv?=
 =?utf-8?B?dU52Q0VDWXczK0lrMWljUXdyeGpBdDZ1OVBQVVpwVWZaSHpvMzhrMUNLd000?=
 =?utf-8?B?N0ljNHhRRVdwVHFwZm5QRmM3NGY0eW84MDJTd00vZ0Z1cElQM01RRGh5QnYr?=
 =?utf-8?B?d1RUM3ljYlNzaGFOVTkrVStIVEFYeEt1NzB3TmVCTDQ4SFlmMFVuZ1FjKytC?=
 =?utf-8?B?VVV4L1FNT0QyMktHL1Yrd05xT0x3eFZYZ0hvdW43OTJBeFdpaWl3TzdweExv?=
 =?utf-8?B?ZmhlalFmYW1ONEsrM3VqOXloRDFFM0YrenRGbjFZaFJXNGFaZlBESzh0KzE1?=
 =?utf-8?B?MUk4YVRLZHJFeDJSZ1JuOHFJZzRsZEJGVk5DaWwvMzZ4QmlTeEFUeTd0TXR6?=
 =?utf-8?B?VDV4VUxvenZMYVRkS0h3WU1aeVNlQUdjNlRuaFdOLzZVQjJFRjBZRm5YZjMx?=
 =?utf-8?B?bnpSakl3MmRzM01oR2NFdkZZSWhnb2tacjA4Tks0Y1VSdkxLdE5OVStCQ2NC?=
 =?utf-8?B?bEFEeFZBYTlENEdZYlVmQ2J0bzFDb2JESjY5ZGpibnY3ekl2ZVBGeXFCd2lH?=
 =?utf-8?B?Vi9yM0ExZ1duaFIrQ2d3WnJ5ekVqTStwVSt1U3FnK2F4UjVQMEVPeENzaEpT?=
 =?utf-8?B?eUk5R2xzTGpqR2tCb3hBbVpFd3VsSnpCMWEvUk1OZUkrbG5hN2hxY3VJUFg3?=
 =?utf-8?B?bGNmdzhSK3VnMzlOeGNlbXhXc0dsMnpNNmFNeGRMS0tFOE10Lzg2VFNxWVgz?=
 =?utf-8?B?U1M0MUJhclNBVktkcDNCVlphQUwwaG85WERwYmM3SHlRZnZRNVl4c1RvUG9v?=
 =?utf-8?B?a0ZzS2NUMmE1bVlIVHduMnJxWVpaUUFnaEdlRjJCUFJMU2pudVcrUERsSXlw?=
 =?utf-8?B?Z3ZVazJmNW8vN3hjOWE3N1lmQXlJRXNnVzlrN1pSRE5pWE5KRTI0NkZtKzZk?=
 =?utf-8?B?Y2s4MTZHUStLMEJaME1vdWlUdmoyc0tJWjljNTVMNHp6a2Fycm9EeVAydlFZ?=
 =?utf-8?B?Rm5RS2xYRk95bWZwMDdQWDFxbHd5UmpaZUVJVkxPMW5jaVdaTzdLQVdLdjRH?=
 =?utf-8?B?Q2c3bjdCVmdmR3hCRmsvWC9yenNjZTRnbzBuSXJjYktydFZ3VlhwYUZGK0NE?=
 =?utf-8?B?SFQzM1NjK0Zmc3VOZExvaEYyOHJ1ZEthTXo2OW5DdzBONmRiOTBVNXQ0bS9n?=
 =?utf-8?B?dmd0Y05LR0hBdFEyOU5wbnZnRkM3c0lxdkQ4dU83TUxKWWtkUzg4L2pFOTg2?=
 =?utf-8?B?Z3VpaDljRWlsOUlOd3NMZ2Y4MDFKTnN2ZWJJT3p6T3lSY0tlQmlONHlMUzBU?=
 =?utf-8?B?SVJaM0gxSU9OdG9qN2YvV2lsaS94N3N2MkJDeG5Rd1o2ejFXUmRpczlJa0tt?=
 =?utf-8?Q?a78GudFrjJ0LGq9ImSkA2y2nm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3218a493-2751-4023-95fa-08dbad1e4db5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 08:09:46.8947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHbCGh00Rb9gN/mkqj5bof4WwQGUD9kQYwXYwALly62nkOdohjCTTF36ZGRDeBE2hgfePnXOqiVcpji0QJB1ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9738

On 04.09.2023 09:19, Nicola Vetrini wrote:
> On 04/09/2023 09:02, Jan Beulich wrote:
>> Further in the cover letter you say "Deviating variables needs more 
>> care, and
>> is therefore postponed to another patch", yet then here you annotate a 
>> couple
>> of variables as well. Could you clarify what the criteria are for 
>> "needs more
>> care"?
> 
> I see. I did not intend for those changes to end up in this patch, 
> although those two are
> clearly only used by asm code and therefore are excepted.
> Most of the variables I left out are also used by C code, therefore they 
> may be eligible for
> a declaration, but where to put this declaration requires a careful 
> examination in my opinion.
> They are not too many, tough.

Anything also used by C code (and not in the same CU) clearly wants a
declaration.

Jan

