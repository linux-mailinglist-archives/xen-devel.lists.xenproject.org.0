Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078E8753DC9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 16:42:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563681.881068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJzd-0000ea-86; Fri, 14 Jul 2023 14:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563681.881068; Fri, 14 Jul 2023 14:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJzd-0000bz-5N; Fri, 14 Jul 2023 14:42:01 +0000
Received: by outflank-mailman (input) for mailman id 563681;
 Fri, 14 Jul 2023 14:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZ6j=DA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qKJzb-0000bp-Qd
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 14:41:59 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2055.outbound.protection.outlook.com [40.107.13.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9638d889-2254-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 16:41:59 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:41:30 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Fri, 14 Jul 2023
 14:41:30 +0000
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
X-Inumbo-ID: 9638d889-2254-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4znHQR2GriI6rKBJyII27FzlZyRDPP/hx8+QQT+yKzYMtFq8tHV22AhjFnByBtJp7qI0Gcr2CzFtpRezJO/gfqeGdkGAw4A6laUuUuUbcuXRYyktyyEovjVZdCnd3t4nZWQs8fsB3S6dBjxnlZ7fp6VrO3s5I9r7gCnOqn792MchwzjYbkICUuv6qzPuI9w9XNgE7WOuJw1lh1EOJAWpa3iuL9dx1OsEr2GMINlFWDrY1oBqhQn4JpRVvQE7SH9jEGlwp5r0FdZCkSzHnNogW7QMAGk/95EPxPn4LVPaGCweo3JdHr8Rxfw61bL61vZymHiyRQ7dSVuUhv8qqbKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ycJjRYKhTOmgVstaVaXlN67Fw8yms79dvIGN7wOypY=;
 b=VdMs46luLzyOo9gFrBdtxdWu1nNrRK5yWJet64L7dmALSi/8nQ/2UDs4NwsPiqjjOKbNnIxm+Rmo332++sjKtZZZL8KUyLj41SaQK+BCBzTw+0UqbmT0DTEcSnA7/bL0KbHIuYMc28AZgWKOdtkcddWqxBKqwWPO1qWB1j8b8E5xLH/FJLQZAmUKvxz3XwUCkFTPsjO1/UBpn6MZGTS9fA+oUOW55aWFIppN/DMC+qR3Rm59TvQZc7/hcLNwtwnLEVQBc2LNPTx9nPx9Zw2BOZ3ufvbVjQRN1aEGCnpje3MYrn27yBuzzMmdHeQKoB/IIu8dJXoW2fqqRxNrkKyQfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ycJjRYKhTOmgVstaVaXlN67Fw8yms79dvIGN7wOypY=;
 b=MouEmcf91+ym4P4cIEfdW6sds7fYUTeHVQ36RrJTa0C146BOQqpRLKsTQCpfvg7A7RRi4c86vUlPqt90D2WBU9IwhYPVSWIo9X3iwQgd7aAbam61nhLY5TwoGnMCayhMj4B+HsvwTlhw3RoHVXOtDtXDSpIymciffwgqpLOcSNgA3UyThIYy3aaujMzG/q3rgOkze5QlG2Og6FueonaL8/tVmFlfYbqGxXVvFbOjK0PcLEpjet/aVnUo2dU+28au+115bEPoweFztuNt+lu9wXpgQUTJt3/zneXuX319HlsBtTbi9YJ8lajlSlfWB2RNueyd5ID28R3ELk2mh0FE+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9892f09c-90aa-82ce-2b05-1bf4dd9ca9f4@suse.com>
Date: Fri, 14 Jul 2023 16:41:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/ACPI: Use const char * for string literals
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Roberto Bagnara
 <roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230714131026.3082591-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230714131026.3082591-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::14) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c64f18-1c1c-4c6f-bb9f-08db84786981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WXCH3P7Fh3Bw7bds+RMiyPN9wFAcrZEFV0adNQRavFfD/A5qfujZQQ/UglmSLNEzgDmuTSDkm61Zd2t/0b5XneGa3vxCwQsSBmQlBuzmAjRgep9J/rkF7DS7hXZHgXDKhD/2AqxEYeC5w35iSzHgziJVuulTSoiMSlxvEY2aQJ1ZhviMp5D0q+aCG89ur8Bj/+aKcVVu0iYIMcXS/eXtyOg1ruVAnLxxj4cVDYPQ1Dp/4Z86qKusNkJOD15pi3Xu9iLpxS95voXAhSijH1yMTg7xJCsIgfs94i1VaPkPxzIGEMTmkvP8GguEiNwCxFDUs3TyAs1Bln8TYwky68YAspROkku61fq5r4B3ixsMS40Rhi7fp7PP7YN9u3VDSO52pRcDUfl2p7hq0OcWobQtcEing1TdtXSXHW4ZTaLWmCajRLUhwy0He1bYjitrxCnZbBbAHAoXKc8/4YOCuTzb3rMtFEjo5Y1ezOIcpWAwtCPzPwQwtlblJElOvm3i0XcSitBVittPG0DbXz3B4rIBW4ZHBlmg/Zb7luHvoborPN9rOsPQJfB3+fUT1R7w9ZwQtMR6SssUw73CTJHMhQYMkdeoRvhVdrvgw9Kx+9ufhsm+Dv4lu39WNacSNb+0OFgQ6HihqSTuRpnvMvye5kKUpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199021)(2616005)(478600001)(31686004)(186003)(53546011)(6506007)(26005)(6512007)(6916009)(4326008)(66946007)(66556008)(316002)(86362001)(2906002)(8936002)(66476007)(4744005)(6486002)(41300700001)(36756003)(38100700002)(54906003)(31696002)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekRETXZUc0V1RGVYYUJrUUIrTU9sVXRVbTVMTHNzczR5dmVvMDd1VEJlZWlN?=
 =?utf-8?B?WHJhNGc5cUJZMXBXWDhCNEdDeWc2S1IxdnRtQ0w4YkpCMkRLbE1yc2ZkQndj?=
 =?utf-8?B?cnphS2syLzB2L2l4aC9PdWpRYXZZNnBvOGs2T1lNR2d5ckxwcUw4dEtuQnRE?=
 =?utf-8?B?eTlNaklHNkJybitvanQ5OUh4YS8vWmZOUXJOSnRjOTBRa0lKb2V1ZmNVN3Aw?=
 =?utf-8?B?VjRhM014cHdwNkcrUkpESldCb3RUUU1EWVd3ek9zVk13aGxkanpRUWxNbWlR?=
 =?utf-8?B?NG1Ja1ZkZHkwUldYU3RrU0pjdjkvUjlWaFJtdnkwVzcwemtFUWJqbmEzc3Ay?=
 =?utf-8?B?cGUyaWtmSkJCQXBKZzVqME8zZzJEdm5vMmcrT2FYR2JtMmtWdnE3YmtncTd4?=
 =?utf-8?B?S0w2T1dQN3lYSTFOMVhPQVlYblBQcDluSnZzaDVxd3VOclZ5RW4zNWRYZ3lo?=
 =?utf-8?B?OFo1bTY0WmRoaHNwcjBiUEdiQXM4RDlqZ3lDend5SGRNMnJhdkRhZ2MrR2w1?=
 =?utf-8?B?L3FEanpBK2NlVlYxZ0E1UzlnN2l2bXdwdzFwaUs3NC96SEtYL243QUloenlq?=
 =?utf-8?B?NzdOUG0ra1NvL1htZ0xRQWlHcHBndHBEVE5tUHB6Q3Q0eUYxc1NiUkNRWGNh?=
 =?utf-8?B?bnpSUDR5bTBWbUE5RzhReS9qT2RVNGRhclBxRWlveU84SFJ5UWM1NmdicjBo?=
 =?utf-8?B?N3hlNHQyYWZQS2t3Wnc0UCtiN0JnSXJvbld4UlBOdjYyUXVYMFBrWldjVlVL?=
 =?utf-8?B?YzludStYTTFORTlGeklCMFNLZS93cURmdUk0Z25OTnlmdUNlK3BCVGRQMzVS?=
 =?utf-8?B?OFd0ZnhLNjVya3VkRy9BRkdyeUh4dnc3YkV2ZzYxQm1jYWRIRmtaUjZFbCsr?=
 =?utf-8?B?bTJLSG5ITWR2WVdTK3FtSlI2N3poTzZMOVlPcENkTmNmd3Nud2l5SVVnWHdN?=
 =?utf-8?B?OTFzRUNObVFQa1BPdmk4dVlKS2NhRFVIUWttcXppYzgwWDhEQW13T2dFRGNm?=
 =?utf-8?B?bTBQN0ZkLzFGeHEwUlpmVXNTQktkMCtVY2I1WkowVE5qb3ozQ3BjM092OUR4?=
 =?utf-8?B?cDBqaWtJM0NmU3JBeTFNVzMvZ0EwNjlPQ1Z5eTMxMEh1WTVWb2hLVVM5a3Jm?=
 =?utf-8?B?NkZuSy9nSHlmSDc1bDlaNTZrL3VaMWRkNk9WOFNFakJXQm1SV2ZPUzloWjlS?=
 =?utf-8?B?NnBBUjJyK1FCSHI4cmcxOE9xcTF0ajUvV2dhbWtsTVY5NUs0WXhycUdnbWRj?=
 =?utf-8?B?bTdGMnc2T3BFUU9keVBKYldNYVZOQXlGUTkvem55ZWhWZ1BnNjFVbnN5VGVs?=
 =?utf-8?B?dHdwbHp4MEpMTUFRZmtZaUNsSmtvbFNLTG5OWW5kbVNMOCtMNDV1Vk1JVEto?=
 =?utf-8?B?bHlsaDB5YWZycWs2K0lGYmxSV0srTVNmSFVodzliTGN6TTZIOXlzZFZHdXZh?=
 =?utf-8?B?TFR2WUppTU41U1MraFpDUExza0o4cTNHbUJ4WUVPZ2dqY1daM1Bvb0QvMkZa?=
 =?utf-8?B?UDVmbytvc1hQN0ErWEpyMW1sUmxOVWtVc0czbFFDVHRqS01iMGEzOXZOQ2NS?=
 =?utf-8?B?MG5VWC9kL0NHVGh1WjQvOTFrRDFVWWhrNGFUMjdJU01COXo2bEUrVUF4ek1k?=
 =?utf-8?B?OTB6QW9pSGNiaWpIZ2xHZzByYithQXBQV0NzaVhnWlY2Z0VUN3B0d2NNSVZN?=
 =?utf-8?B?d1Z6TmNYNGlVYmtaN1dGdTFHN3lmRHh4YjlPa3NTQ2M2a3d0aGJtb3dNVjk4?=
 =?utf-8?B?QjFWWjYzV2x2UzNsbm03N1lvOTVxVi9kdG83VG53MzVGcHNIMWxTL0trV2hL?=
 =?utf-8?B?TU8zNHgrYUliRXNGTHVLWmo1UWZlWm5vL3lObUNURVZDQjB5RUhnek00MFVH?=
 =?utf-8?B?bjUwY09xbnZVVE5zdHJqVmMwZExUblgweHNHelN3V1d3YlRrRnc4ZDBLQUxY?=
 =?utf-8?B?VG1weENoa1dVQnFIVXRYUnpmWHFPdHhhZ3VQVk9ZVGJpQUdoSDNiMVZsb3lJ?=
 =?utf-8?B?blNwMVp4ZjBwNkhTcVF3RnVyWWl0WTdFTkRKb0NBRVhRZlBlV3hYVjNqQ1lK?=
 =?utf-8?B?UjF1NVMzQ0ZWOVJzWWJpeW9hUU5lTGlSRERMVzdIbm9aNk1HSnNKUlQ2eWx0?=
 =?utf-8?Q?MxIa+5NbMQX73cvWE54cG7bku?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c64f18-1c1c-4c6f-bb9f-08db84786981
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:41:30.4901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5c72cck0N4+v0sYSsStZEsrRxS434fYEaMSoG2svpntNikFW0p8dUaHbIA1RVM8BVls+Md1Ke7jGeo+TsShzCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308

On 14.07.2023 15:10, Andrew Cooper wrote:
> For pre-ANSI-C compatibility reasons, string literals have a mutable type, but
> it is undefined behaviour to mutate them.
> 
> Swap char *'s to const char *'s for variables which hold string literals.
> 
> This fixes several violations of MISRA Rule 7.4:
> 
>   A string literal shall not be assigned to an object unless the object's type
>   is "pointer to const-qualified char".
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



