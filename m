Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F154D1D4E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:35:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287205.487084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcnR-0001xG-VO; Tue, 08 Mar 2022 16:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287205.487084; Tue, 08 Mar 2022 16:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcnR-0001v6-SF; Tue, 08 Mar 2022 16:34:49 +0000
Received: by outflank-mailman (input) for mailman id 287205;
 Tue, 08 Mar 2022 16:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRcnQ-0001v0-Rr
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:34:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9ec5108-9efd-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 17:34:47 +0100 (CET)
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
X-Inumbo-ID: a9ec5108-9efd-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646757287;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vQ4BzFeOTQR7uBAQkHp3RWZ+NsdVAgwkmzpJ3kKMhbg=;
  b=Ab9WiVaiIrb7WAHprYhN+AtdJQ0Iwrz+zDeKNqquU1N3/27uzUnUibyf
   Bxnfny4yG1QGsJ3Zv1yDPD+AKQWOLbTY8jDTq8VJ89e4jVYhGYJ9YVtXH
   XOhxk+StzQ69nF0saJnb6gnQQY+f0zaPtAD9OKsnezNNrxfpStZUPxv1q
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65655831
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QfeJe6tjup5dzSWCM/+Y/jqtoufnVH9eMUV32f8akzHdYApBsoF/q
 tZmKWjTO6zfa2v3e48jPtjj80wEupfXz9A3GVNo+383H3lE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV6
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi92Z5eSvMoUdSJlHn49APx41Y34KEqg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 pRENGo0NXwsZTVFIVcMT6AnpN2xxWLNfwRW9hXPl/Qetj27IAtZj+G2bYu9lsaxbcZYgEee4
 H7H9mLRAxcGOdjZwj2Amlq0j/LLtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobWNz7
 AGtsdrPPgFi7/6oGEywxIidnyznbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhrx/sChc+Ij2unAsotJBCtdbZXtWYGn4EOzAR1ofNfAFQnpU
 JTpdqGjAAEy4XOlyXTlrAYlRujBCxO53Nv02wYH834JrWjFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtztVZp1nfW7TIS4DZg4i+aihLArL2drGwk0OSatM53FyhBwwcnTx
 7/BGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l9U6+Bm+1wIdc590mX/8+Rl
 kyAtoZj4AOXrVXMKBmQa2Alb7XqXJ1lqmk8MzBqNlGts0XPq670ts/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:sRD1m6gnZ/KI6GizcpYfxAkvwHBQX0N13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGJXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhPYwCFzOe74a7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLhyP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4DoU/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjDSDczG6N69PRkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l2KvyEBS39I7vjh6a88zebVRpYsQ8Ad+C5EbBh/374ghDa
 1HENzc3vBLalmXBkqp8VWH+ObcHkjbIy32AXTr4qeuonprdTFCvgclLfUk7zY9HMlXcegA2w
 zGWp4Y442mAPVmKZ6VP91xMvdfOla9MS4kD1jiU2gPNJt3ck4l+KSHqInc2omRCeg1Jd0J6d
 P8bG8=
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65655831"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8aL2ziF8yP0BiZ/MsIehvqi5hoMfZWyRMICp4zK1svZMdAwQKlyHAWAJgpjp3VNOjzj5dkK0o6FvxCiBDiQ/wBPML06hfAQMlHVmv132Dquvoy4uNo87QMiSLxxclUpboxRH2gFafxji0aVGr9gHRsjtsVmXUVApmO/6n3b8wqKeDyttTtBfnVmRViF0IoZBKGTMI68EeJwbzRTZxvaWj36FotMIw6Ka2nxptxlJ3ps9Rj9V1WaVKj8ruB1ZyHZc/uUpvCra9cPj7lYbPN8ddB4SdFm654p+hoUNEd60PTdjuGSyrr27n+4IFfTBx/eyYdnvZKcuu5cfg2g6uAbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNmL+PPxy6fETeDnzvWMEvu9lNgzZTnt+fv0P6Iotqs=;
 b=M6R4UItWBZ3OoIoWCn6J4X5g88Yvv0/bJPspB44557Bqmi5AoI7r17W2j6NpLtDiwvFoAqg9f2DVDBvr2H6KCk/GmunAvy2EUvKLvnxkhUuCA1zoM2fqR9BB56IaMBJHurJokjpgZW4Q6QrQj+TcspbY1xWitgRf88hyRFvaDMKUQtZzCLVGxVFU/IZTYPoHRzzY/HLILKPWN27rVo2D3dtQArphBsjhwNukHxS7/oik02PxnbhlXd12u+0rz7BHlbWO+yqdNArE6FNwksYEV7o44P48PR232BFEs4J5Yp7HYz+hhxVixsHe0PLWXelr6Dc9A9erUarjFKX7pmhsOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNmL+PPxy6fETeDnzvWMEvu9lNgzZTnt+fv0P6Iotqs=;
 b=HGiIoEpwYYMmPneclMimLQ8VtGiFL/9MXPZV3jsjWS4HOtiJ8p7svNqMLzyIv/XwCA2pzMX52UDIcuAu6mQJgKztjP+aydqhh0Lii8czEjKPUiNQQ8jc8c0Wz/SbZS/D8nIW7pdZB9evYLTExw+b0NSY7un7y4OpKWlJw9dcKc4=
Date: Tue, 8 Mar 2022 17:34:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 4.16] VT-d: drop undue address-of from
 check_cleanup_domid_map()
Message-ID: <YieFmi1EsfxPojy/@Air-de-Roger>
References: <c71ac406-15a9-6291-d670-0f965a59bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c71ac406-15a9-6291-d670-0f965a59bebf@suse.com>
X-ClientProxiedBy: LO4P123CA0261.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c68ffd6d-6f27-41bf-5d93-08da01218a40
X-MS-TrafficTypeDiagnostic: BYAPR03MB3415:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR03MB34156BE7441C55932F2CC2278F099@BYAPR03MB3415.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MAnTAEZilM60lJVBHhE1XTuXUS3Hq9TyNT3GeJjx8UGRv9ZHk93iG3NqSE88/mARoSmNWnPtBw21YXE4p4SyAR+U4cOI3EOPSoqVy+iOAvLOD/kMTyEAOYfXlZKfBmVqPfGrIZBBlHZ8Cc5WAtwaCGaFX/yY8+lyWKczrlTTfFyCL6jr5tscii4mpRLqchkhyQ8UeydL7KCEpRqDVamHrT+Z3vSr0612BNecmPuEgqSAbMy9lVtEFALQv6+kTZAToYHG6vtHcRRh8TAGWuh+beDYZ8BiBxGxbZdti5F/Aocif/BseWbasdqUN275cek4a8CBN2rsVyUq2a3ZW+HAn3uVzcN0CWd5Yt0LGSuYKjFtMn+9pZVvNEYHPepiZda46cO5uWEZxoOPZ5FjkOeVZ/SCEkbKSHyy3WBHRKhsvJCkoQd6R3SZawtGuH21zNZ/x5doY2HyrWRQagYxMPCmwPeYcW0x09MJ3/zXLbybZK8HFKv48xkWda8dF36ZW1nooP3oP01reMU+thfEClr5k0/+AZG0967jS7saXRm30BGWlmsLrE1Syy0Mf2eE8kAB5jMyXxTfC7JLifRoae/qX08O5m2inwyjxW8UWwIQlrMlrQsVExeSHkwieIuPtir8jvmeKx8Gw7I6+9tW0MSCQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(82960400001)(4326008)(38100700002)(5660300002)(8936002)(4744005)(66476007)(66556008)(66946007)(85182001)(2906002)(33716001)(6506007)(6512007)(6666004)(9686003)(26005)(186003)(54906003)(6916009)(316002)(508600001)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWErcmYwaisrWWhCcVoyK1gzSFZqank2bHNUMUZUUmx3UnMxd3Q2cGZVMTkz?=
 =?utf-8?B?SDZOdk83a29XSFByMGV5bDJnVkJ4RTRtQXY3MG5kRzlsalZYZThXUlpSKzFk?=
 =?utf-8?B?cnhDYzZyTmVIRmdmTzdqUmEyYVJlZ3ZibWtDSVo3d2xvWVpDN3V1UDRaa2xo?=
 =?utf-8?B?cEZ5emFRSGxLQi9SQitPM1MzZzZLSHhhQTI1VFFvRkFpY0NhL1phVStja2xQ?=
 =?utf-8?B?bjJ4M3pyZU5seVZDVTYvSDVkOUxjRDgxYlBSc3R5Uk9qaXluVXdjWElOMUdB?=
 =?utf-8?B?Y1YvVEdSUXE2b3RqMUNsM0RLdVNEaXMxZTROT3VFWVFJR2JOcHNKU2dRdWNp?=
 =?utf-8?B?SkNkSnVubEdhcGdjSktBaldoSHhEdWlVT3U2K21iSzBYZmZkakpEQS8zVEIz?=
 =?utf-8?B?Y2tZNnpibGgyUEwrTlhkaDUwalJQcWFqamRvdDFCZjBzMzZ4YUVzYmxoL3U0?=
 =?utf-8?B?Sm1lcVVUbGJLb3hvV0hNb1ZleXJkdXV5Yzc0L2xvNE5BSkZVOGtuMllyeHBn?=
 =?utf-8?B?am50bEVwR2hHYTI5ZkRIU1RjTTBoR21zOGR5b0ZLSGhSNlp4cWFaWGxnYTM0?=
 =?utf-8?B?b3lRWU4xVlpicnYwNGFiVG5mR09ZU0l6bGVBb1kvQ2lnblZKWXNBRDZtZnNO?=
 =?utf-8?B?aDBYNlRYdFFCNmJhblZadXl4VndoRWE4Z1VIS25XQmtoSHorckdGaTFQTTdq?=
 =?utf-8?B?Qy9ZcWI5VzJDdSt4Nkp6aHlzN2t2SE1xZVJ6T284bVp2SUVsMXZlTlVHV3pp?=
 =?utf-8?B?ZklycGdTZG9HZldHaE9UQUFWUk96MUVtbWp3SFgxeittdFNFRG9FMHFjQXlT?=
 =?utf-8?B?TklPZHFxOXlXMDJmd0NYRk4rQlREU002TFlwNGp1SnNlZ21zbm5GMUxGSUFT?=
 =?utf-8?B?Tjd3V3diUHF3cjg5T0M5cElRVU5udVp6TkxDTWZncjFPdktxTWl4c0h3dUor?=
 =?utf-8?B?SnZmcTVCa1JmWVlyK0Z3SUhHMXhad0FJTTBacU54aWF5Mm9QUjlrdE1aeDNs?=
 =?utf-8?B?VDR1SkNiN3dCeWZ4MGRqb0pyczYwWG9BUzlNMmN4aGl4Qi85b1pBbGpKM3Bj?=
 =?utf-8?B?WHpDa2VObzdjV1F2NHZNcVlqK2gzc0FtQ2NwbHhhRjhNb2cwNFVreTVhNG5w?=
 =?utf-8?B?NEpwT096RWdLYlAycE9KWjBrOUtZaWI0RUVPMzcvMWFNNkVNQTFUellqVjlr?=
 =?utf-8?B?T1lxR0hhZkpBdTRaeDlGbldLSzFjQ3krQlZCTWd6OGg2NVJBL1ZybGNZVW5Q?=
 =?utf-8?B?L0Nyc01EOWFET3p3NmlQMmRJZm1PbzBrYUVJaTNJR3lnYlZRRyswWkhnNm9P?=
 =?utf-8?B?N2lmVllFUjdKUjVWWHdzNi81dDJrRERyWC9RaHBtbHFlT21VQUZHeTE3aHhh?=
 =?utf-8?B?cjJnWEhTelhIeTZxb1ZidEkxU1pqNThTUFAwQTJGWEJHSGNjTFNYL0pWeUNk?=
 =?utf-8?B?Q0U0ekFNanE3Z3VoMlJMUHQzdlpDdXR5bWIrVFY3azErMzdPcXAyYTFpSEh0?=
 =?utf-8?B?enZ6MkdWTXBSYkNxcGRGYm5YQnRCMUJFaUh4U2dOQnJLN2ZtQ3RTcWhIclY1?=
 =?utf-8?B?ODRITnR5L2FabzVOeko3RldQNXR3ekVkZ0NVYTlmZ1FTR1IzOW9FMzQvS0VW?=
 =?utf-8?B?QXJ2aExHbUhiVFhValN2Uy9GVFFSbUdlVjNBSmo1ZGV3OUZ2Vkpib05keDgx?=
 =?utf-8?B?eXRyeWVLMHB3R0NOeWJpcXhsaDFWSEd1L0orR3J0dlpadFNwUGt2NmZIems1?=
 =?utf-8?B?aUNwb1QxdlgxZUJobS9SR29KTjAxbStFOFZsRDJTYzZVTW5IN1Fpa2IrMXE3?=
 =?utf-8?B?UzdkSW1iM1lnOFZqT3RSb0xBNVdHYkpLZmIyb0JERENiVHRIVnhqRTJLMlNW?=
 =?utf-8?B?THJoMkNjMW1mUm9XSnpXZHEzODQ4Z2pXUm5mbElNYXVIa2x1bWNYVTNSMDJ0?=
 =?utf-8?B?bGxrVVNyVU90R3RsNVdpbWZBTnpUS1dCZWJkRm5acDQ4dlJMTUpBUFhhRVJp?=
 =?utf-8?B?dW9tcjRVMTVXb0V3ZG1EOTAwY0hlei90MTBWTnp3bmVYN3ZIQjZIYkFUU3pu?=
 =?utf-8?B?TnVPbFIwNGdqMEthc3NBSW1kL0RpbjZCUjVNaEZNYzRDQ1JoTHQ2YnlGNGor?=
 =?utf-8?B?SGJReTdOSnZsNlJiNjFsdm93eHhQWi8wOGlsWjhCaEkySjNuOEZFeXBKanp0?=
 =?utf-8?Q?QUxrqtD4uOeL5uM/Ugh5IU4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c68ffd6d-6f27-41bf-5d93-08da01218a40
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:34:39.2462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EI7MMiBodGGdrxLFlSZ6g/ECNBpMUw9GDTYFr4t4OZWXyTRznhhxNdSBo/bbJ2OTMmjuKFx71S9zzLR5mt23Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3415
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 04:27:00PM +0100, Jan Beulich wrote:
> For an unknown reason I added back the operator while backporting,
> despite 4.16 having c06e3d810314 ("VT-d: per-domain IOMMU bitmap needs
> to have dynamic size"). I can only assume that I mistakenly took the
> 4.15 backport as basis and/or reference.
> 
> Fixes: fa45f6b5560e ("VT-d: split domid map cleanup check into a function")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

