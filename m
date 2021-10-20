Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02164348C5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 12:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213784.372112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8cV-0001vE-9K; Wed, 20 Oct 2021 10:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213784.372112; Wed, 20 Oct 2021 10:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8cV-0001sq-67; Wed, 20 Oct 2021 10:14:51 +0000
Received: by outflank-mailman (input) for mailman id 213784;
 Wed, 20 Oct 2021 10:14:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ou1c=PI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1md8cT-0001sk-LB
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 10:14:49 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca5a1e4a-4005-4b92-a739-72f646a788e1;
 Wed, 20 Oct 2021 10:14:47 +0000 (UTC)
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
X-Inumbo-ID: ca5a1e4a-4005-4b92-a739-72f646a788e1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634724887;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=aK8R+y53m2raK/zKeMODq5yj0t4BvxlFMUCuTs4PzmM=;
  b=Vd/Sc7riVMFhhYo6rj+tjMk/hdts69vxwhksNplESD63QMRcVyxDSvJU
   S8pkcB0o8QDLZ0DMVNILXcKYU4I6N1GUsVEJwwfXtXCOb5OWOnSiykmXf
   BpAgEfQzaMTmXhedYCiT1q/MGtjN98QFArXIMDB/vYGYliF2wIKcVfj+K
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cO6eCfkbpq8R9Rk95m+GqW/yOj2jASZLQnniskr9ymV+fjILNhsTFx6p53g81/Wi2wJ19P+657
 Mtroh7aeQrNRWRYfCmKxhjfd+JwsOXMonoiB/oMAD53TOMZNiSZ90EsXaxFmHHdr5dS5Hr+bPe
 j3enasJde0GzSZlCLbp1X++HF6QZw9+VaXD0ugfABgjRUpf54/HKZ9F8x51LlqSUpvLoTnZdMR
 8cR4ghIxqahXFgUTSP1AkD4vQ1HlKinkBVSJliRYUtF8sLAxHYKk3VaNAyY/5RWEZI9mweFG+l
 q9nT75h7Ui4SSPghJPRMVtpi
X-SBRS: 5.1
X-MesageID: 55179392
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pthPnaAjchA29RVW/3Tlw5YqxClBgxIJ4kV8jS/XYbTApDgk1TAOn
 zBLDGuAPfeNZmChft4kb4m/pB5Q7cTVyodmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5500o7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/si2jhep92
 ZJ277uPciYzZ4Odp91HTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHviTuo4DjW1YasZmPaiPP
 uY0dzZUZyv6Ph0fEUgXOaxhtbL97pX4W2IB8w/EzUYt2EDfxRJ8+KLgO93UfpqNX8o9tkSXv
 GXd5EziHwoXcteYzFKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydGHjUq5V8NaO
 lYj0CMkpqgv92SmVtD4GRa/pRaspQUAUtBdF+k77gClyafO5QudQG8eQVZpacMknN87QyQw0
 V2ElM+vAiZg2JWXQ3+A8rafrRupJDMYa2QFYEcsTxYB4tTliJE+iFTIVNkLOLGxps34H3f32
 T/ikcQlr+xN14hRjfz9pA2ZxWL3znTUcuIrzjzPdHif4hI+X9SCWLeJ8wH1vMl5dpnMGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUwR8d5plxB71bmJNoKuGgvey+FJ+5dIWexC
 HI/rz+983O60JGCVqRwf56qQ/ojyaztBLwJvdiFM4IQPPCdmOKBlRyChHJ8PUixzyDAcollY
 P93lPpA615AVcyLKxLtH48gPUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/l6Jr
 YgOb5HWk0wGOAEbXsUx2dRPRbztBSNjba0aVuQNLrLTSuaYMDBJ5wDtLUMJJNU+wvU9ehbg9
 XChQE5IoGcTdlWcQThmnktLMeu1Nb4m9CpTFXV1YT6AhihyCa7yvfx3X8ZmItEaGBlLkKcco
 w8tIJ7bXJyii13vplwgUHUKhNY8JE/121/WY3DNjfpWV8cIejElM+TMJ2PH3CIPEjC2pY05p
 bih3RncWp0NW0JpC8O+VR5l5wnZUaE1lL0gUk3WDMNUfUmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8zvoO9p7JTwgl+Mm/MalCnVuFpLnWchJEdvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2CLv/ovIUj86Ctmx5a9UB1fb0uWlShQDLppK4d5k
 +0vj9Ebtl6kgR0wP9fY0i0NrzaQLmYNWrkMv40BBNO5kRIiz1xPbMCOCiLy553TOdxAPlNzf
 22RjavGwb9d2lDDYzw4En2UhbhRgpEHuRZryl4eJgvWxoqZ16FvhBABoy4qSgl1zwlc17MhM
 2dmAER5OKGS8mo6n8NERW2tR1lMCRDxFpYdELfVeLk1l3WVa1E=
IronPort-HdrOrdr: A9a23:6Qezd69qgOMWT1uT80puk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.87,166,1631592000"; 
   d="scan'208";a="55179392"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YltS09cgh37Ptyvwkz/0ZfCRBFnRx0J5m32lM52CIxGpfDWE3YPoliI2fn7ED0yREAhzI+U0WrPYASXW2DdQ0RetqTogJc4moj5d1NrhCkD9EuRzGQav82b/MkOb3cSyUgIb0ygBjMx0+b0WJwwFuAkQVE254LG/vAJ16TGMDHqfWDfLOLI/qkYPsHTGIVa7/rSc+/uTGul3urkY4NwdE4Q9lKDXKqMleltO0lgr+bg7Er/JEATGTGs4oMhNBA+fBThj4XW1tqvH7H3d8FHHXREnMNRZaC1hsmImjStlHBEchHJVjt3fN8tvLU6jJ3l4bse2WKpQks3GVjiCNhyr5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5gS/QDqJNAXCgRJPXuOmpL95A5VZHQhorm/L8X0PAM=;
 b=l/f9ChvtjFJlQRYDZhcRtcI4ttJNQH84ZiLUScudCfRb3y54Uwb4k6e6rYyxlMbVlNJ3T2TzbtilPAIOwmOADIKbpYlkfOcnz/X068UoMSrRjPVojMhKQAGZ+2SiXvhwZ07D/AbfeUtH4EEFnyQZGn61jqnfTeF1I2ENJXrz+vq+5HBnKjM+amjJRAKV4PWKH8HOWscD0/6gUDzzubsbFAYEEMYNSU9fXAP6sqD7aKj9MKMurhSOUuYjlXNyHbQkj+4sna6K560SPTeRznEN6AvDT0n2xt/1LBx26rqOg+oWgJvmIsKSkxwqLO371kp4CzqfBtWcpbCLLQlUi6C3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5gS/QDqJNAXCgRJPXuOmpL95A5VZHQhorm/L8X0PAM=;
 b=caJnpXnv4+Q/2GyqZHppbEL29YAEmcioFwPsH7WTmD+auw8yC2OdxPzEZX/dkq1ZopX1iVv4rI2Unul+oBCMayTDzY3X60xln3V1RjaLNPWFarOON42h6R9RJtIy0EPPOfFHC61/dYXeRcKJR/f20vMUJv2ltO1YhCyTKoBnRLY=
Date: Wed, 20 Oct 2021 12:14:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Anthony PERARD" <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/6] gnttab: allow per-domain control over transitive
 grants
Message-ID: <YW/r6Dk5a79myhzy@MacBook-Air-de-Roger.local>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-4-roger.pau@citrix.com>
 <1d741841-6aaf-1d33-e1c6-b98f77ce41fb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1d741841-6aaf-1d33-e1c6-b98f77ce41fb@suse.com>
X-ClientProxiedBy: LO2P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1512670-c306-4226-dc83-08d993b25932
X-MS-TrafficTypeDiagnostic: DM6PR03MB3836:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB38365E5E7A2ADB084A2662CB8FBE9@DM6PR03MB3836.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XH58WLC8OOgMNStpNeg4ohxGlZ0qYD/WN9iRXFEwOaeyQFM1pkKeEb/aVPhU+RAxuGIvWkjd4cpcO/C7a5/OLooKjO5oAKZ1yACnQejx+vGGF57a0kBGeGql10sf56YFZlv9Za2eXc4cZtCx/4Uh2i8DtOiFtQArl5l050iapO6GUFMZxFvbb5/8kIYhMzs9gv6osCFGBzwBF8UzTciAaIcDyCayyowxBJDi0XnKzZdnl1nWXWcL+0FmkSjOcZRBx1GaPiwanbFRyeVqBCee2ROXkKNap5nRwfTbsLCFURIWUW0zXGOIzMx8qNQqUhehSvbJaPEo61W24ZqXdawil28hrFKTbXKNax70L5tvtJFWfZ5cS4DSacdPPqQdrMphy/12QN8ZN+lKiEZExRlmTClq4NAmiUK2YFLLsmxRiTYYBk8PgA5Q3mL+5QRa+K6P6V02I1J7d9obibNzvP720RpH5jAVc1FHwVjNTNaU9StPdM0nDJV22YOXV1ziJrw4RroXHYkmTBE0d3gYND/IuzeeMyGZzna3TRpDBJzwVGb5xK18QpEqywdMn+hKOQBEGFz0Y44p5NQtbIwl1lFKgLoxjPochCkVZKEWo33vWr4FvVp+53yrSh6YKcc91vuS4stsqSuGdrBfHwMhur5AiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(66476007)(85182001)(4326008)(66556008)(66946007)(9686003)(6496006)(53546011)(508600001)(26005)(83380400001)(956004)(86362001)(316002)(54906003)(38100700002)(82960400001)(6916009)(8936002)(5660300002)(6486002)(8676002)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3RXakpNcFd6akFTcDRySEtaaHNwTEREbmo3UkNMYmdnM0hENmNCYVJQY01N?=
 =?utf-8?B?TWExS2s1aTZvemNaWUUvWSt0eUFmL0N4WUF5MEg2R21RQkJ2TWRjRHBRSmdw?=
 =?utf-8?B?OVhUUFpZY1pIcXJOOXFHZklINm9RanpMSHk1NTdPV2RZM2tWbG5RcFM4UzlT?=
 =?utf-8?B?SlU1NmtaRGFTSjJxZFZOYmVBU09qYTJZMHNZT3RCaW9ZTmwvazk0cEZDMlFr?=
 =?utf-8?B?QTRuYW16eHpUUTFxY2tNcG5FRnhjMTRuMHdiWVZBZms0dnF1K3k0Vlg4OXJE?=
 =?utf-8?B?UkdXbWJkUzNwTlNKWEg0WVduSGN3eXowT2FrWTE5d0xPemhDYXhSUTJkUWNK?=
 =?utf-8?B?eWtHUThzc0pRS0d4OG9Ud2ZZRmNWcXVWNlRENXg3ZjZvV2YvbGoyZFR3MGZG?=
 =?utf-8?B?dUt5b1J6ZlV3dklEdmtlVXBLd05SbW54VDBlSHJ0S25CcGtKRkdlTUdjQmRh?=
 =?utf-8?B?eU9mSjBmZk8veFNTdWMyN05oU2dkKzlHcElQRW5Fa2U5Nnd6S3diRlVqZG0y?=
 =?utf-8?B?SXJKWVZ2ZzFNUGRhSkRWTVI3UVlJdXUva1AybnBYVGtNbklmK1JXTkJwVWRw?=
 =?utf-8?B?b0VoaUpJRnhqczdma3VJYzZrczRhVUd2bFZQMlRPNmVkcXpURWltbnFKbVRK?=
 =?utf-8?B?ZDR0SjlkSFBKdVFoY3RGSEhlWml1MGtmSSszTGIybXB3K21PQ1pOZ0poQWl6?=
 =?utf-8?B?eEV3Qnp4cDlNSEJhOXZqTnBIaVZCTlhvUnhyVmx4WW8weGdGKzVJS3pqc2py?=
 =?utf-8?B?S2psMTBkSjV4T2pmTXdpaTdIck5TR2Zua0ZYK3ZzanlnWUJSSkRjdVZxQ0VT?=
 =?utf-8?B?TDVqQ1lqM2RKZVZiYjVIZnFQSGVNNDQ5T0gyR2ZQY2xMV0NFVm44VDdUV0dM?=
 =?utf-8?B?dnhscWhaSFlNTmVDZDFPOEtHVk9IVWlzTDl1Z2JlNzB0djNrQ1ZVYkxxZHJw?=
 =?utf-8?B?cXNkdld5a09ZQWc2WDNzTFkxUlhXZHloTktGUG5waEtWV2s5MjIrTG9jMXh0?=
 =?utf-8?B?VFpORHZZdTNvWm5wZzJNVS9lUURpd3loYktqL0xTei9JL1BlVTg2UnJTTEZm?=
 =?utf-8?B?b0QrcUpiZzh3VHcvSE1PcUo2NGs0YXBuOU9oczNwWDloK2Y4cXFqdTV1TVhp?=
 =?utf-8?B?Y25EeEdMTS9XUHlxNXdkOENjbHdnMEpqLzNxbGViWlE2WW9iRkxJT0lwbWFG?=
 =?utf-8?B?M3V1QXFndzBRNUtWVnpoOHVEdWJzK1Z5SURkVURNeG9PV1BaTCt6S1FlNzJ0?=
 =?utf-8?B?aU1iYnZncXkxdEhpRFdmVFdLT0RRNjVyekszU2k4NkdLb0Z0VjdNOWVVVTRp?=
 =?utf-8?B?SHIvMklveU9UcHYyYjFHbjk5U0htcXo3Z2oxa3R4VHVzcGZhejJXYTdFQ2Ez?=
 =?utf-8?B?a3NiRGZGVVpuUDZ5bnNBSXovUUNwSEZOVDVwQTdxSHpiQ1QvWEZ0cWtqdHZ3?=
 =?utf-8?B?a3RkbUJnMlFyS0ZENjVaUVR6TVdiT2RJM1E4ckRtbnl4cFNEbGg5SGllakJo?=
 =?utf-8?B?RmoxS3dscGRaZXozQmhkVFJpUHBmWlZoT1c0ZkJ0R05KZlVMdXo0K1dQY3Fi?=
 =?utf-8?B?ZzBHQk1rbDVtUTdiZzlkN0N1Mm16UEtwYU1tSWlXcVlXYzNwd0dmNUl5QXRT?=
 =?utf-8?B?MWlKMHRGeVF3UVZDZURlU1BaRkV3NEMwRlViWHBjemoyb1pXeTBQWVZrUTZ3?=
 =?utf-8?B?aThNQlhIeG5QQ2U0S1V2UW12V0luQVYxWmhWcFRYZFFweDRUNnUxTy90TFZE?=
 =?utf-8?Q?33CNXzZCGOhfvMHdfsyW96oImAlGg7nVTtrhdxH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1512670-c306-4226-dc83-08d993b25932
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 10:14:06.1225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3836
X-OriginatorOrg: citrix.com

On Fri, Oct 15, 2021 at 12:05:06PM +0200, Jan Beulich wrote:
> On 22.09.2021 10:21, Roger Pau Monne wrote:
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2649,7 +2649,8 @@ void __init create_domUs(void)
> >              .max_evtchn_port = -1,
> >              .max_grant_frames = -1,
> >              .max_maptrack_frames = -1,
> > -            .grant_opts = XEN_DOMCTL_GRANT_version_default,
> > +            .grant_opts = XEN_DOMCTL_GRANT_version_default |
> > +                          XEN_DOMCTL_GRANT_transitive,
> >          };
> >  
> >          if ( !dt_device_is_compatible(node, "xen,domain") )
> > @@ -2757,7 +2758,8 @@ void __init create_dom0(void)
> >          .max_evtchn_port = -1,
> >          .max_grant_frames = gnttab_dom0_frames(),
> >          .max_maptrack_frames = -1,
> > -        .grant_opts = XEN_DOMCTL_GRANT_version_default,
> > +        .grant_opts = XEN_DOMCTL_GRANT_version_default |
> > +                      XEN_DOMCTL_GRANT_transitive,
> >      };
> >  
> >      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -750,7 +750,8 @@ static struct domain *__init create_dom0(const module_t *image,
> >          .max_evtchn_port = -1,
> >          .max_grant_frames = -1,
> >          .max_maptrack_frames = -1,
> > -        .grant_opts = XEN_DOMCTL_GRANT_version_default,
> > +        .grant_opts = XEN_DOMCTL_GRANT_version_default |
> > +                      XEN_DOMCTL_GRANT_transitive,
> >          .max_vcpus = dom0_max_vcpus(),
> >          .arch = {
> >              .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
> 
> While I can see that you make these adjustments for retaining backwards
> compatibility, I wonder if we need to, at least for Dom0. Dom0 doesn't
> normally grant anything anyway and hence would even less so use
> transitive grants. Of course then there's need to be a command line
> control to re-enable that, just in case.

dom0=gnttab-transitive, or should it be placed somewhere else?

> > @@ -1965,6 +1969,8 @@ int grant_table_init(struct domain *d, int max_grant_frames,
> >      gt->max_grant_frames = max_grant_frames;
> >      gt->max_maptrack_frames = max_maptrack_frames;
> >      gt->max_grant_version = max_grant_version;
> > +    gt->allow_transitive = !!(options & XEN_DOMCTL_GRANT_transitive) &&
> > +                           opt_transitive_grants;
> 
> No need for !! here afaics. Not even if there weren't the &&.
> 
> As to combining with the global option: I think if an admin requested
> them for a domain, this should overrule the command line option. Which
> in turn suggests that the command line option could go away at this
> point. Otherwise, if you AND both together and the guest is known to
> not work without this functionality, domain creation would instead
> better fail (or at the very least it should be logged by the tool
> stack that the request wasn't satisfied, which would require a means
> to retrieve the effective setting). IOW I would see the command line
> turning this off to trump the per-guest enabling request.

How should we go about deprecating it? It would be a bit antisocial
IMO to just drop the option, since people using it would then be
exposed to guests using transient grants if they didn't realize it
should be set in xl.conf or xl.cfg now.

> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -98,8 +98,11 @@ struct xen_domctl_createdomain {
> >  /* Grant version, use low 4 bits. */
> >  #define XEN_DOMCTL_GRANT_version_mask    0xf
> >  #define XEN_DOMCTL_GRANT_version_default 0xf
> > +/* Allow transitive grants. */
> > +#define _XEN_DOMCTL_GRANT_transitive     4
> > +#define XEN_DOMCTL_GRANT_transitive      (1U << _XEN_DOMCTL_GRANT_transitive)
> 
> Omit the former and have the latter be 0x10 or (1U << 4)?
> 
> > -#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_version_mask
> > +#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_transitive
> 
> I didn't even spot this in patch 2 - what is this intended to be used
> for? Neither there nor here I can spot any use.

Yeah, AFAICT those _MAX definitions are used by the ocaml stubs to
assert the max option available. Given how these new options are handled
in ocaml the _MAX check is not implemented, so I could like drop those
(unless there's some other tool that also depends on them).

Thanks, Roger.

