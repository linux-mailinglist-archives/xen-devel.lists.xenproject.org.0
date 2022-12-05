Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E24F7642C5B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 16:58:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454020.711659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2DrD-0000nH-FD; Mon, 05 Dec 2022 15:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454020.711659; Mon, 05 Dec 2022 15:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2DrD-0000kG-CC; Mon, 05 Dec 2022 15:58:15 +0000
Received: by outflank-mailman (input) for mailman id 454020;
 Mon, 05 Dec 2022 15:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Zgi=4D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2DrB-0000k8-TY
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 15:58:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f2697e8-74b5-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 16:58:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Mon, 5 Dec
 2022 15:58:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 15:58:11 +0000
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
X-Inumbo-ID: 9f2697e8-74b5-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+63MW8Wj94ip+a7FREeN1lsGNL9LxEVqzMVznn7LMdxvpE0C2rOe/RD0YOOo/gKfrq3lUCvNSh6voioDI0k2MCxxBozqZAQXcRglmdhk8aQnOhMfarRHC4fy7v+MGZNCjpCg9cok7fk6DUbczN4NglmBje466jls1i4PH+czpH4TkA3DLnrYpPhLrfYfJBwuokAzsk3I295NXYak4W0sDht+0cIl8Tq6XUI/wPKLFJJr97Uhxppoqcz4+bm48CDbB+WYK9y33dmkXMm7UfiC4nbDoyQS3IgG5RG4jREh9Ym0bCFFWhE8pXazXgxsibdT02CRJ7hzcTCOj3v76L9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8E3Qu59BIRxRZxqx0qoCOp1o66VJrPenfE5gU8zuxvs=;
 b=aU3WUMkoBUUzfye43Tdhqvq1R8vs8R71akCmV36Ek8NtCXdSYrCGGJ3QtwfbA+SkDD99E8nEeHlWqpK/oreE8iVH+a2TDyiXSJGDiQTVVqPQr1qu4F+3V5z2jhgMZBfVXtbOq9Xx3csagbMZaFCJo2fz3pBYCghx5Ctjb0292clDPged3bBNwPwpFPr/fBkiYhmsazenXvohKPZGn3TZyKpFoIyJE63ZyZ8+TnkkItdhXTP4IZWe1NNZpEoTGcXKpgChIVINdg3H8TX4gz1YK6YFtw4Hx4qsfk16BNG6ouL8I/4fMo4mdrCGJZzAyX6RbOdu7Uvz89mo00a0cWLA4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E3Qu59BIRxRZxqx0qoCOp1o66VJrPenfE5gU8zuxvs=;
 b=Zw3AZilOiqzQOVLieCBRIjZFUWcrSVfhqay4paZYJ5oy+4DcX3xc66rcYk6PWjMj6sTeLOKvOl9kzrBa1OQAsftuakjE18q7/2xkiFdHJ+ChatL0fCbicHYfKzRYfsxDLR8ft7KLuza4wVIjCapc6l4xF61RGshfY+h75zsDQFVXzOfmyfau574UZLsS6aRVVjj3MjmCLMsO/fXz+8E0LQSR/w/iL9Twdr5ALE36TOQH2wu0A+Pf/XpGHvsuiQyfFr/k8cjjwNm7ignpiMVVx5Towbef9pDbuJr/uPLmH2q3bgQPkyEHSpaaI5XScBumQyNoCyx2csa1EPLRRJl+rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45f4cef6-99ba-a37c-3e57-27b270d16f6f@suse.com>
Date: Mon, 5 Dec 2022 16:58:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 3/5] xen/Makefile: remove Cppcheck invocation from the
 Makefile
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221205154052.14191-1-luca.fancellu@arm.com>
 <20221205154052.14191-4-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221205154052.14191-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a9dc7e-c887-4f68-b148-08dad6d9827b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U2rs+vQVz59cl4t/+ZZrVSu/GRuiV02PfBnkGAZ2xbXLvTT54qW9uSrfxl5I46dxQGDXzEjiERDbuRVKc3iHlwJwz+whfrGEtc/UGl/UrS+w9n3EdHySryjBbBrUwpGMqZhu1GCquAv+vZcDiLbcN8jwBfBWicst/Fy30q6Qo9eO4Me9SzAZcZLhLxS0JfA8nNvUJuWjSVDrL/M+GiLBKxdZYHuB/V6sMZqOu3TXXDSeu2dCETem6c7icUkNJynsou5gLaV699FG9BTGDHp2ew/8kp7jw8++xIw5Pe9psRAhyNjfH9W97MGpfDMIfLbx4XFLnNAHeTAetJLH1RRlbOKj2SxBVue71jcb0lRGVfHQSip4umSdOQEHb4BCALbw0xeOxwhj419IEPLhPagpCtjxVofCUG/cXJ6zyTHm/glsxJcD9E3+Uc1dR6G9+Xn4xPmwRc1RSlITLsyfcYO7/nH+/ICjeY4yeQ8hB4PAIEO4IXqCbaaQSVVZaMy6FAzZA6LM8epSE9AvsYyxoB/AF9MVSOqTHHztaUWouQx8944LFyTfMm07Py1pjMeIsoKHl543TsQih/1HN2x51/xPtJGSsw5YFhTZUeqirOEeM4zKlKtmILMUVYyoat3zrlFOT6lT9ffsZTB5COcjlQ+cF9yEjHcDwcNSHKAtrrlwRDawiFIs5GClAtFXjUZLBUDEi2Av22nSyIpfr9VT6cnf+fFSh4dxXFkLzgIndDry6o4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39850400004)(136003)(376002)(396003)(451199015)(31686004)(86362001)(31696002)(6486002)(6506007)(53546011)(478600001)(36756003)(26005)(2616005)(186003)(38100700002)(8676002)(4326008)(41300700001)(6512007)(5660300002)(8936002)(4744005)(66946007)(66476007)(66556008)(54906003)(2906002)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWxuWWJqNUVXN0NmZVp0dE92RFRhcVJrOEkvV0g0RWkwaUk3WEdSeFl3c1Q4?=
 =?utf-8?B?Uks1elVJeWJqQXBxa1NUdG5sSEZpL3N2UEZXY0gzZ1BDRzNib2FjOVkyZ0V0?=
 =?utf-8?B?OURLdnVHcE15N1dOWkdWUzhkdjk3UHJMTzN6MzNvczhnVnI0bTVRTUZlOG94?=
 =?utf-8?B?ZnFEVWYyYUlvcEcyZ0FJeWEwVjdJZXhqRnVUSVVQbXhXZUgzNzF3d3U1NzF0?=
 =?utf-8?B?SVBhcDFtMEpLZElzSVRBcmpzOFd3cmxvVk1EL3h4MGtCUTZWUlBRcW0ySi9U?=
 =?utf-8?B?TFVHb3ZTRVZ4NVlubVVrUHhmK0JXOEY3dzBLRDUyZitvTnpTZEEvbGtvZDJh?=
 =?utf-8?B?OVdnV21ITVhqanNwbG1hQlN3cm1BOW11NFNhRFhGYVg2WDVoWTFrUEpJbUgy?=
 =?utf-8?B?bGVFaDFQaWRpRTdlRnhZaHdpdHBJWXBzRVBpTHpJV0FTdTJpUEpPeFNNV2g5?=
 =?utf-8?B?M1RZVlU5U21Ic2xvU1dlNEFjTDI5NExDLzB6YWxJY2crMWgwWVhVRFpJaGhv?=
 =?utf-8?B?Sm03eHpCbmcvRGVVZnlNK0FGeVhZWWRBTnh1NnhIMzBBbnJrMXNhUTRCTFpV?=
 =?utf-8?B?NkpKSWZZTFVGTVpGNjJUbktUKzE5WU15R05JQWg4emptT05jU2lPdkpUR3pl?=
 =?utf-8?B?dUlJendJYzNlSGVoQllLNURPRFoxaDFBUU10VjJaMGlrWnRURVU1Rno1b0w5?=
 =?utf-8?B?RFlMMVdRV0VRZzNpZHZZTHBTSkhoTXdQUFl5RVM4WllFWnBFSVd1K2NtSDA0?=
 =?utf-8?B?SGsyWGQ0Q3RSdWtCY3AzNGpkVHNadVhtNDRuSWR1c2ExQzJaVm5ReFBrYWlv?=
 =?utf-8?B?b09HQnMrSUZ1L29KNEtCZ3gxQVhvTzBncUVucTRrVVVBbktqN1Rhc2s0QSt3?=
 =?utf-8?B?NDF5TVcybWtYUUMyelRnSURTR1hlQ0poYVMvRk10b2tkK2V6cE5hRDIzNlMx?=
 =?utf-8?B?bEIxakpod0ozOWw3SEY5OWwrbmVGaHVQQkt0WUtobU1jeHJrVWFZZXV3SzBO?=
 =?utf-8?B?ekNlSGU1UU5NUyttN1N1dmFUWDQzRUs0ZWV6L1c4RnBPVHdJa0dDQXFZRjRx?=
 =?utf-8?B?dERXcVpnK3JBamZ1a3k1WEQ3SUpBSGdMdHk2ZmFYcitOODF1RndGWWxZaW9H?=
 =?utf-8?B?ODJhWlFKeHpyUE9TU2NuOXVYRmFGRjVleFpNY0puaEhXd2xxR3orVVhXS3Zu?=
 =?utf-8?B?WHNnZkY2OUhjYXhncjlVOG5lcm80MVJMZG9jdzlFMlkyWnV2NHVHVndxNXYv?=
 =?utf-8?B?U2lWUlRpOWFkZTJxR0NxKzlSU3prd2NDbXUzMm81L2ZSOHJTMnp5RWl2L1M0?=
 =?utf-8?B?aWJHL1ZVZ243b2o4WFY0ditlT3RaNnRrMUc2YldrRFFXaTUwMlVueVliVW1S?=
 =?utf-8?B?ajArdlhIVUwrdEJwQlgzbllPeTFMTG9aaTZzTGMxa1VqSzBHSXVXbis1Zys5?=
 =?utf-8?B?bEtWdTdyVmV5S3lpeGpGak10RXJvVzJ5YWZncDhxZXhqejU0WmVOTDhRdkRu?=
 =?utf-8?B?OHU1THVSVmMvL28zVDE2cDhYS1ZMWVpjTDJManB6SDJkWEVBcHFLdTJLOERa?=
 =?utf-8?B?UkVvQ3pBQzJrSlJIV2FMYWNGZS9LN20xRDdOZHIxUjBZNlBBaERESStMZVlX?=
 =?utf-8?B?ZzBpVW1RSDVldWpXQm9aa3dPa1RnOGQ2cjFwNkp3OEZIOG1ZUTVBbXZSOEIz?=
 =?utf-8?B?RDYvbEs0dzFNeDdCTGduL2JGdEIxRDNoYmFmMlEwQlduQ0dWd3Q4aTVKTFhM?=
 =?utf-8?B?ZWFsMHhsT3htMFovaGJ2TmNISWszRUFiK3d1bnBRMzJtRXAzUzgwTHNrd1g5?=
 =?utf-8?B?aU85dEpQM1AyZlltT0NGekhMQ2NhNXZpNzBGejAwZzI3VXZxeHA2QXdqc1c0?=
 =?utf-8?B?aG83dVM1ME0xTUpRZTR5Ymticlo5Z3ZlVHJQNHRrVlJrS1ZqUXN3MkFVZ3Ry?=
 =?utf-8?B?dTJqUEM2QTJoYXJiNlJnM2JaUVd3cmNZSWpRSFpFZ2lxcFBUM0xIcDNTak5i?=
 =?utf-8?B?bHA5M3dBTGEzUmlsSiswTXZxVlhhQk1haVV4NmE3VG9qakJucDVSTG92MGQx?=
 =?utf-8?B?S09RaVBCWkhjUEx1T3F1Z3YrbE8rSE5zRTA1VnFDWWJmaXVhWWNuRXNreVhl?=
 =?utf-8?Q?ODMFNjf+crVWOh2u4QK5YA5Ra?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a9dc7e-c887-4f68-b148-08dad6d9827b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 15:58:11.2519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYC7sw+d1pzJaGIjxKpj10P6vgFRJi7K4tvmyjcU+YtmufujCt4r2T/hzbJF862asIOcP1FoU4iM653Ln25SAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776

On 05.12.2022 16:40, Luca Fancellu wrote:
> The script xen-analysis.py is going to be used for the analysis with
> cppcheck, so remove the rules from the Makefile
> 
> The python script xen/tools/merge_cppcheck_reports.py was used by the
> makefile rules, but its functionality is integrated in the
> xen-analysis.py script now, so it can be removed.
> 
> Remove some entry from the .gitignore related to Cppcheck invocation
> from Makefile
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Is this a proper revert of one or more earlier patches? If so, you want
to say so, for being potentially relevant for (at least) review purposes.
If not, it would also help saying so to clarify what is being kept.

Jan

