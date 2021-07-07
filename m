Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CA73BF23C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 00:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152729.282137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1GHf-0001qp-8Y; Wed, 07 Jul 2021 22:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152729.282137; Wed, 07 Jul 2021 22:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1GHf-0001oD-59; Wed, 07 Jul 2021 22:44:47 +0000
Received: by outflank-mailman (input) for mailman id 152729;
 Wed, 07 Jul 2021 22:44:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tWQe=L7=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1GHd-0001o7-WC
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 22:44:46 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec960d4c-df74-11eb-8539-12813bfff9fa;
 Wed, 07 Jul 2021 22:44:44 +0000 (UTC)
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
X-Inumbo-ID: ec960d4c-df74-11eb-8539-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625697884;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Y/RFHOmTQxWHCYhLL7X0WF1Y7NYykfPgGvgb6Wpa+UI=;
  b=bcVCs14dqgSFWW0sx9oz1UKKL0ZGlASn/IICRl3eM6y7qqgbeZPmImli
   ykc77HhL6flQvXXgtWyPbtnH5MlQ2oc6inH5v5xLbu+7KuTCJ4JODCBmW
   XJp56+TjtrKM9cyrH6HZtDMYDqJbvBWGBEoRjwuXnnxzAEJ2QGzgfsO0D
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qAmZMXx0XsueZ65rLp1MBxQTOCasSDDJowkhWez65gaAwDwmIRrwqTGTR3LnTTB6n68zf3S5Pq
 oZxJYXrnG0v1dPGrFAZsKYU3Lz42gA3oQiY7GjZP92jOFxVgmKb7YRVm9ye9jiUuDOt6MFUPgs
 eCmWkyjFuenhVSFVAS65j+DBykvwlNEIVvnuNL/bnNTKeBhSJnK6kneKVY0MIkjyjPJxlANZau
 312SruoFgoWGirx1dPZ5pnpq2Slh4UErwNEXQ+5OWy+ubXtoiA4nI0gMZorXf5t6SzxuYxFBV2
 EqE=
X-SBRS: 5.1
X-MesageID: 47847642
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rnkXxaCbgRB5IHnlHehAsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkNK1kJ
 0QCZSWa+eAfWSS7/yKmTVQeuxIqLLskNHK9JXjJjVWPGZXgslbnnZE422gYy9LrWd9dP8E/d
 anl7F6T23KQwVoUi33PAhIY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX222oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iCnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeol8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4K4uZkRkIM4jgYJq3MgiFBs/KuZGIMu60vFnLA
 BWNrCf2B4MGmnqKUww1wJUsa+RtndaJGbMfqFNgL3N79D69EoJuXfw//Zv6kvowqhNA6Ws19
 60R5iAq4s+OfP+TZgNTtvpEvHHR1Akf3r3QSuvyBLcZfk6B04=
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47847642"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUbqnUnlnXgD7fHA7L+tQLTGi1gEKD3NFi2c1s/OycF5WP6ugJ+e2Aw7mxJtFyBZgurP3tUB+ONTmumhhVawsNLQa3w7BweM3i7cPadjtzK1FJDQuUWA0xj4NubEVyWrs1OVCtVSKRj1t/l3+eAGTG/S3hDyuhE0SHQVR1yVy8S88RVKwS6W2hW5qkimw6JMBexZgJPkZf/F0oPZhTDkBlEkb0l4JdhXWl3zN2Q2cY5/HbZ1xf++zw0ewL0lkDDOy2trjJVcniqBzFUmCFlD/AHJbQpHUW8bnpxeWrnVQfPLFkgKCppkWZEREuSMOiUsZ4E4nuggwZMlbdudrq01Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nkNjb8IYpxIhW6PeEExFbSvyORj5H+a+dPsoBFjZ4Q=;
 b=ObseIlRUsECwicSSLAPDkmt1MWXBMtwDF+WmPgfL6lifCeimrRJOFxExHfSsqZdIZUHPgzchKBYHAEOEQ9v3X7SFzw+GV7buKYGJt96pjNVNyIpTLs2f+yJbEP5HNNDJu/Wlbs2jIT41eG+Mxb3pnqxFToJVteVhm1TE+ACm+47ftDMjGz0SIbhSm/OQ+mS+/+9eNdvhQhX9rGsQRxwdx44ckgoLNfawT2qbyfmo2938+Fey5wvHVquOBhmdeUgwO7h4Kmz1lRSw1WdauqCz/ikYgeAWpyJOJYHSk69XBNa5gCUwSFUD0ie9V4X+lU5bgvfhAax7RtG6uyK+tMQ6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nkNjb8IYpxIhW6PeEExFbSvyORj5H+a+dPsoBFjZ4Q=;
 b=Q7gOnnzTIw8RbXtYa2PLOQHuwkfd5k5tV3Xt/fnLek5Npsa+Vk38LM2jy2L6IWqs9OUN+vZ635QvolKqJOrALpkBETvP3EnYCDaCAPJrfVZXz0MOhrEKE/yoassEikXv6SjdLwQ+maYeyxHD25Aitrf9eOm49FO4tyYRC/VI/aw=
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
To: Olaf Hering <olaf@aepfle.de>
CC: Anthony PERARD <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
 <20210707164001.894805-3-anthony.perard@citrix.com>
 <e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
 <20210707215235.76f15361.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <930b58b7-326b-1855-6f24-2e2a4b3ed4a8@citrix.com>
Date: Wed, 7 Jul 2021 23:44:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210707215235.76f15361.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0132.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9491f18-4250-46a0-7394-08d94198cde4
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5454:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB545454A687DEF486851CD3BBBA1A9@SJ0PR03MB5454.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ut/sCRfwLbM9PpSUFsmZqhzosisSJwSoZ3CPBBNIC6P66Du77WAWWqQ238EXXgZKYsrJxGH+AeAIb4TWX26VKLJRHEDktPzSp0r1pMArvZPmxnc8wwdzLWyhSRd2t8ZTkFnhnRLUey72tQWiA6wHJhhOScIOfPvviakux8Ym0kOo46wr6Rcr9JgzPig9RKzN7P+2CnU5TKiYf1Uv8YlxgQSct+6e9PDLRtPtS6099fDqM+GtRzategcas9GqmNJPMCG/PEDt3Osy6WxEWVdGOF/bgVL0CPR8fZOJp1QjzXyogbXVsjcZ8a/92zgb8mLCPIU2stQizkPpJvApHxFoNDW+oKla+c6byLvnzlPrGLbhAQGRFcJ5T+a2HHBFt4vmZcp5ZQ6VmXqirQwxHw7/okhdxmba8AoW0TpPF0g+D1yTM20CyKELKfSktGSnAamLRuCKC7jliDWtEZyV7DADI9UQS2x1uPF3Z0Z/wde7ZhPNmlM9CbIRNDOikElC5SLI8FE1Tq8rZVP+625jiSD1A/soDzuoWdpqMaVU5LUweyN4SebtqMGY7hRVobPtFp1lN7jmt7/Aw5iJf8DAPlFkIuREUrylmoFmKgEfBOABHW0vR4D/yXD/f+cK9vYzamPwu/uBKPfbMepTbJ7xJoLtU4TcaPIaPsX/7Scjg2Z3KmXj5FmJvHR5aR3fdM4++9JomNiqVMuSkSp7FFYehmckIahtMM2Sr4qd7Daob+ODugc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(8936002)(53546011)(2906002)(2616005)(16576012)(316002)(956004)(36756003)(54906003)(8676002)(26005)(4744005)(31686004)(4326008)(6916009)(6486002)(83380400001)(6666004)(66946007)(478600001)(66476007)(86362001)(66556008)(5660300002)(38100700002)(31696002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?HbvsyQeJbqoAjFoHvbwEX+lk8cR0zXBrU6LzpY1yhL4jTt53UEtvbKOE?=
 =?Windows-1252?Q?ts819y8dLYWLyTxsEsimJxBlZQSIsoF3x+l1uppXhI/9p1JoBpq5ivMV?=
 =?Windows-1252?Q?ZzODw+bZvtqaXVWiYA9hX6gUChG1xg3uWvWMiBa4Uy6bxtLoIBlQxaMN?=
 =?Windows-1252?Q?UHs2Y7B6bOd3a3f9Qjk7CJEmTXwj8YhZHOK4yK2Hm5NkG6m9dHLmKEom?=
 =?Windows-1252?Q?YU9rHjPHVfvF4trJI14XMXP0KL4YRqK6zb13dLcQzO+KaX0vRpg4VrDf?=
 =?Windows-1252?Q?MmxZMh/6uEWgmz0MBmj1uqiF4SJ9tFH+Sd2hsaAj6rMgFpN723Nku1oi?=
 =?Windows-1252?Q?EXtVqkBwTk+AKKAkpNE354tMjwiJGxEn2LcLwZ6sGf3VWz2DsK6Cg0JH?=
 =?Windows-1252?Q?h+iCN3/T3E511DRajjAvZctu3TUnyoGdp3Nl9Mfqe87J6btXBCx7VTpa?=
 =?Windows-1252?Q?nqdWZ++XFc1hyVPGUYyIM3raehFOdjmylzV3IYDvTK9Xzf4md2ATvfz+?=
 =?Windows-1252?Q?MC2mwpavuiAppQ4eyvl2qba2vsRumcoLp9YWks+KaByLr3GYfWgHqxIt?=
 =?Windows-1252?Q?cZHCE6/BnGG7GktUMpEs5FksVnoH8lLvFVCuhdSvDS1tx2U6KwqsQux+?=
 =?Windows-1252?Q?ImJvgcDArm7dGCIhWlHYvuCkuzepiIyrnEpdjvVrhEijP2sj19q5F9Ji?=
 =?Windows-1252?Q?AqJ9/FMqtaXPPDKzKdu9f2elBlN2aoCjpSCimFb14kvOY2WZVYbIU+KC?=
 =?Windows-1252?Q?GcTGt7gFfabAT2uPie7XgqPqaMMD4tDuCv3oFfzHEkHC0nWbKGd1gp2D?=
 =?Windows-1252?Q?IkR/fgDtEgRnZoVpuHdhHGqDT8VIKKMCDVZtafjA3wGf9rlfzLamIEac?=
 =?Windows-1252?Q?JiPpeNI3cHw/7b8ZHcTmPYhYuJ5/DCrnLFSJGb/koKLwOEOhFyCV71cT?=
 =?Windows-1252?Q?i4EO5wkzdKKv0iIRIPN2EKJ6ICnsgYfNkOW0E+V73qcPXAliD2kCElUE?=
 =?Windows-1252?Q?OW9+HkTOMhTsJ8Wt8BfB/oZDvlY3VUD4JVIRmd2TS74TqJGLB+B6O4fO?=
 =?Windows-1252?Q?Xc+pH5QEFdGUqeJl3qyx+NFkoJaMkR/PXShSWBt2jY5oltWp5et6cD5t?=
 =?Windows-1252?Q?/+1S+J4GAd9R9kq3xJ8RoOF8rQkxKcfPQR/qhtj+ffbwejSspLKbL9R1?=
 =?Windows-1252?Q?zWjV6/RkM2mOui7f8hPcRGsWKBBFHQSZxbVeb4gK+5lkNh+JbfLhcESB?=
 =?Windows-1252?Q?r4rcovDdhxVNmmnHc2l9b014NqYbkDByTd+Zu0ic4L/2818Ou/tq4QNc?=
 =?Windows-1252?Q?w78e35byGaS5sMCSzEGow08y7ESBcZh004iarPkeC4yyZNVycFPTerOt?=
 =?Windows-1252?Q?5uABSpVlzS6O7kc862hrFUcp1QYiSWZ+F8q6D3gc+x/OYuNR5s1nR3HW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9491f18-4250-46a0-7394-08d94198cde4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 22:44:39.8799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VNbte+8HDRFa+Vpnc/X5xy9gczos5x9mRMkvoEzsep1hPP3YVWNWgmEEIed45GWwkl4EnosKvStBbej6EY6TWBB4szyClh9q49N7L7DEZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5454
X-OriginatorOrg: citrix.com

On 07/07/2021 20:52, Olaf Hering wrote:
> Am Wed, 7 Jul 2021 18:46:03 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> iPXE failure
> it just needs to be updated to ipxe.git#master to make it compatible with gcc11.

Ah great.  I presume that is your "[PATCH v2] tools: ipxe: update for
fixing build with GCC11" patch which has been sitting neglected on the list?

~Andrew

