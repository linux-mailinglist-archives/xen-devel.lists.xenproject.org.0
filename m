Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9F94DC895
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:17:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291614.495060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqw0-000689-NP; Thu, 17 Mar 2022 14:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291614.495060; Thu, 17 Mar 2022 14:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqw0-00065Q-KC; Thu, 17 Mar 2022 14:17:00 +0000
Received: by outflank-mailman (input) for mailman id 291614;
 Thu, 17 Mar 2022 14:16:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JNAg=T4=citrix.com=prvs=0684b021b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nUqvz-00065K-AD
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:16:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5e22cb0-a5fc-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 15:16:56 +0100 (CET)
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
X-Inumbo-ID: e5e22cb0-a5fc-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647526616;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NXwxNIGQ/DOPJQlETMgJQrTsrZfcTuhr50X8sxj9V+M=;
  b=KN2EQZuk/auHqVqm8ye5SJOAaMioFGUrDTx2tFJlAas/sZSXM4nziiCw
   RWOVTVzroNTKmF1YM2niEifxFkdB4bdbxvX2MrGmvIopFIx40lsYHxfW1
   5TxeyXnaovc6GBv25inWgBw/IckSj94LRR0jgXjVYTwok9QTYwvvTTUNx
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66503869
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:48vQfa4pBC/vduEgeUYA0wxRtDbHchMFZxGqfqrLsTDasY5as4F+v
 mMaX2nSOP2LYDTxKt50PojlpB4EvcDSzNY3SVZq+3g2Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPgXFvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurStEy4PAY/noN42CUMJTw9VY/F0o7vudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQ6uGP
 JpHOFKDajzKOEZwAXwSNqtv3+iWrye8IhdchQKK8P9fD2/7k1UqjemF3MDuUt+NQ99ckgCHp
 2bF12PjCxoeOZqUzj/t2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQvSStmCE+cOJqOLdguV2j4fSI0V2dLz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpkiXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj/9hu+aTNT8D2BN1bQ9xawcRGp+ZgPd1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpyH/IN8Jum8mexoB3iM4ldnBO
 hO7VeR5vsM7AZdXRfUvP9LZ5zoCkMAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3bJLblU8ADLWgPkE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVCye0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:XJpn+K3Jmepy0RjUEy4eDAqjBVZyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5Wo3SIDUO2VHYVr2KiLGC/9SOIVyaygcw79
 YFT0E6MqyOMbEYt7eL3ODbKadZ/DDvysnB7o2yvhQdLz2CKZsQlDuRYjzrY3GeLzM2fKbReq
 Dsgfau8FGbCAoqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P70rhJJGdZQ8qPSMexnwqDL3QSuvyAfcZek600ykke+C3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="66503869"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpWXDAhKDjjV9m8PW2+vI765IwBV/8+P2k4n8IE4YlM802x7nTPynxpa5QF70V//aSTiRLAubpr6UcH9QUBo6nCU12FBqYKBLTDmx/6KgwslCZo98doJWr/H4bl+NdeIlQtjXiJ0jgkfBUAjLf6itE7P7kKQzOve5GZPrm0ieo39BWNxr1rpwYkm0hS6Wan0eQMO+KodL4I3H1P3NIrvsv4rHCl877cFQ6TbhkVqVYATZHe6+2smvWG6vId8r9HNl4hjtPfC7gpDMd6P3r8PfXJhdPwAJrTplX/GntfxgrnsOuxHH10pB2bzQXrlkero0dtgVEohkLzxklz/QwAkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=se6V635QQum1GKJl3Gv2BZx4vrwJQegrEK9GB93azUA=;
 b=j6bMmqW3R8aTMy4GvJIqMwkfT7aFG1yyPOgg+Fy3wLtjGS90YEUyPeyiMjWYIqpvBT+wCcxVsYKIzHkMyKjTfIll0/xvVCqrUSgnYDb2SVL1ggfDMzpaBFTXu1Kqs8dJPEuW0mexqUj18NdcAsSssiGn3kz/LbX62u7tzKmRu+IiheqLNe0B2BYLCwAjYYnnydnxJei+G+P47+uyglthZMehQpRp72o18Kw0Tar6j4GXBEuUyTye4gBsJJb5sXQKudEsKEwwz1U1en0NcK693Mg0stts0vHWhX5jO2B8I/pV0Eh8PlApe/vacS8OEvbigfjzAKgsuHENStkfPmyJzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=se6V635QQum1GKJl3Gv2BZx4vrwJQegrEK9GB93azUA=;
 b=axCMr5/+av6Cjr2Tv4oXk9Hi4zcgarCcNMDEEtMlwVMn0bAQAjReHfXKxCM4eRK2NdzA+5/1oNLUEmP+J+2UxDPk85tHbAVEEW7m3mXdBKHZRF+0kOCSYvxfUoyLq2OKEMn15ZfHxzsQnU4qxJUy49qqZLCjQP84fhSKTmwyde4=
Date: Thu, 17 Mar 2022 15:16:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: Re: [PATCH 1/2] livepatch: do not ignore sections with 0 size
Message-ID: <YjNCu9nD30DkLZX9@Air-de-Roger>
References: <20220317110854.39050-1-roger.pau@citrix.com>
 <20220317110854.39050-2-roger.pau@citrix.com>
 <7443a703-6215-1b8f-a6c7-bab606ad016a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7443a703-6215-1b8f-a6c7-bab606ad016a@citrix.com>
X-ClientProxiedBy: LO4P123CA0195.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57f64326-fc79-49a1-7939-08da0820bc4e
X-MS-TrafficTypeDiagnostic: MWHPR03MB3294:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB32944745C6147CB27A821BF18F129@MWHPR03MB3294.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TzejRNoTk0LTPu4udp2LhW4NQ5STonyHeUyhPfhuSxtgEyhBYLHu5ddE1xqZYgVI7BhyrA+CMK7N6gzFZJ1tR7W2+t1coXRlOmJJlK3CxfrDs/9LXuaDgZkaLCGGgzNUDKoUajdEytR8OJZRZcvI1q7JY4nO2koFblik/nEEKDSsdImD8iWCxGMKaF2LxKNN++aWppB6n078lHP+Zqj7RnMEW5Hs3galF92iofESyqKiKHDYLy0hQW6yIwbaqikdNF2HvHn4gmeJww+/w185QQjEychX4R+bhk0R+ABcL3baRJzcGhcgY39O5uF45Ktwq6GpxU6xkvBhFSJaj607+fftF35n9NywnUB7TNhN7pEfXlwIARQ9GQizO64JnR6uUsMtJJGXHZpLpld1rTiQi7vdjq5D9gCexFexrWN0+QEFRZjtgsNpcPZMh7sPea5iyJ/mDqXhb6ZhhnhtY8s7HoLOz+1tUViXus/fP/a3vUPxmGeXPM5zU+F4/pwg3XsMYwqXnl4kpYf0TZYjl25xu953FolBO6+CPonTyKI88FPmRFt9kOynLBJzH6KmVLh86o0uo1qTTD2NVNDLgh+NTj6hbeRHoyYxkHQgGz0BNm6jDu/vSSixrOefIIY5Q3H1kNat5MK1WD+AZ5HNA7BU3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(82960400001)(6512007)(9686003)(8936002)(107886003)(66476007)(66556008)(86362001)(316002)(66946007)(6636002)(54906003)(8676002)(6666004)(4326008)(38100700002)(6862004)(33716001)(6506007)(53546011)(508600001)(85182001)(186003)(26005)(5660300002)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDRJNTNLeC9vVzRnUGdZaXh0TUpYMkJxbld6S1BPNEV5eXFZZk8zZzFJMlhl?=
 =?utf-8?B?NzFEbzZkdmgyeC9QR2lhNmVicnVNNkhxOFRUcjNNQWV1QUdDQUZyZTZtczRl?=
 =?utf-8?B?K0RpcGJUSXVINnJRdytFMzhHNk9kTm1kbzlaSlZrTUxFWjU3a0FlNTZnQ3Y5?=
 =?utf-8?B?UGlXTWo0bklCK2JFVDVZS2xWVFkxOXp2WFozNGkwci90Q0tVWWloL1V5QnI4?=
 =?utf-8?B?MHlLQk9EU0pnQy9HY2NZOHlQWGg0RC9KSVNyU0V0emx5US9panVrNEo5K2lB?=
 =?utf-8?B?cjdOYUVUVTYzcGQ0eWUwYXRXdHdWdERWcFZFT3A1eXBIVnhZTXV4TlIvanNz?=
 =?utf-8?B?QWFiMVRtb2Z5S1FmUDhTelg1RWIxVXU1VXliOWlTK0VYRFR1UjVtK3ErcEtD?=
 =?utf-8?B?cXJ2SUpxWDRvR2ZKOVdwSStNaVgyUFFtQ3d1dzdOTVFDODV1SW9zcEtvV2ZB?=
 =?utf-8?B?YWQ1T3A1aks1Z3MyaWRvOU9pQ24zd1MxcjFaWVV0MGhFT3J0SHJmM0hUS3dw?=
 =?utf-8?B?dnU1REJyaFozaHBYdFJZa2tlVTA0T1RsZVJKSVFNQmM3NHNVeVp4MnBqTzhT?=
 =?utf-8?B?b1V0bjF6N2ZJMEJKb2FMVnVGRExncTNPRjlaeWJGeUUvS3l4ZnF1RGlsMU9Q?=
 =?utf-8?B?RUcyU0p4NnhkU0t2OVBLV0RFSnNRYUcvWG1rOVEzOWJiMmgveUFEZVFGak1z?=
 =?utf-8?B?dWVGVVFBZDg2ZG9tcE5MSzhkMldLeGljVDZKN29LRWxVdDhpbUY4TFVidHhq?=
 =?utf-8?B?MzZUUXpqdWVuWG5WU05yM3ZLRDhKRkFrMEs4VWhXUk1tUlI1UzNVb29FY3Aw?=
 =?utf-8?B?bWQ0UVVvbnQva21OVGpGakl2MFpFTXJocHhZZlVXckRwQ29KZHArMURKenR0?=
 =?utf-8?B?Y2FDMWZHS0llWEk4U3hzL0ZyNkFKMUpFYVk2b2diaVAzMEF2UGlJZWFzbVNC?=
 =?utf-8?B?Q2lPLzk0aFovZzliT05NalM4RlZVYVg4bkExYi9NRDArTUJ0eHd2UjkzalRj?=
 =?utf-8?B?SmxZeTNxcnBTdlYyOFRoVkkyaHRiSVJhd2dyWUxCL3hXZU51WE9uTXkzWVBO?=
 =?utf-8?B?emV0UHA0QU81QnlHL205UWJpN0NxVDJpTFExUmYrdFpIZ2szZ09Ma0dyUUM0?=
 =?utf-8?B?ZlBFMXNEODBIaC9rTUVYa3NxbzY5UEVRZmVHYVhqd1VHelYvK1AyV2x4UHVU?=
 =?utf-8?B?aFdHMzRLRmRySGNQd0Yvc1lCRHRqSkN2SGVOdmlkQkRLZXRzVVBIRGpxWjQw?=
 =?utf-8?B?RWpBZlFndS9PYW14cXJ5N0ozNDcvWkxtT0hzTnVzQVpGSk5lQTRKbjQ4bTZq?=
 =?utf-8?B?Um04NW85djBSQkFlbERYNWk5aGRjcWsvZ2Q1R3VZTDA5b2U1eElyQXlza20z?=
 =?utf-8?B?L1g1Sys4MHphNXpXaHgxVmFLdVE2Q0lranFvdjZyV0ZPVldCUmhQUW54ZEhp?=
 =?utf-8?B?UkNtNkEyTncyWEl6NG9LcW5GKzVEcjA3V1FlNi9Rc0k1SmxsbXoxVk0rdUF4?=
 =?utf-8?B?VDVOSTdzQVJZbHU1ZmN1NEZUTTZjbUNCYjlaajcrRjJsMSszUGRwR3MxM2px?=
 =?utf-8?B?Y244Yk5OUk5qR083MHFoc1UxbkJJT0JKcnJ6M3N1aUdEZzVuZnRIQXZqU0J4?=
 =?utf-8?B?WVBUNktPWUFQV1F4ZnhBaU5ZWENKT1ZqeGVYZXBKeThJS1V3T0Fmckp3R0Z4?=
 =?utf-8?B?eDE2cFQ5cVlJYjhBcC9QVFlBT1lxRkdRaXA1NUhkUkFjMjN2Rzhoa0dPdHBU?=
 =?utf-8?B?THFIcnhUd2tsQkpZeE5HTFdreXBJb1Uva1NMOXU0dlVkUC9NVGZHK0NZNk1u?=
 =?utf-8?B?OEh4Z09iV0VOSEFBZDdROEsrMVlFSk44dWFCTklUc1lGSjRVUlhXd0g0ajRa?=
 =?utf-8?B?NEVSSTNHakZZMUJSNndSR3NiYTJKTHZRcEt1b2llRGhIMjVGWGttcE9uVEVV?=
 =?utf-8?B?OWVuWHE5dmZUMHhpc0xMZzJ5NXNJeVZ5cW1ocHRLOExIam1WRHE0NzF3Z3Ew?=
 =?utf-8?B?dGcxd3dYdFNnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f64326-fc79-49a1-7939-08da0820bc4e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 14:16:31.9612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5PsnWp63LKboya0zFibwGJNdZA/IOnZLB0/XzmpYk/780Dhe/w83t09zhytrNuXw1fZlKL7hJ5Espnw5YVvUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3294
X-OriginatorOrg: citrix.com

On Thu, Mar 17, 2022 at 02:00:19PM +0000, Andrew Cooper wrote:
> On 17/03/2022 11:08, Roger Pau Monne wrote:
> > A side effect of ignoring such sections is that symbols belonging to
> > them won't be resolved, and that could make relocations belonging to
> > other sections that reference those symbols fail.
> >
> > For example it's likely to have an empty .altinstr_replacement with
> > symbols pointing to it, and marking the section as ignored will
> > prevent the symbols from being resolved, which in turn will cause any
> > relocations against them to fail.
> 
> I agree this is a bug in livepatch handling, but it's also an error in
> the generated livepatch.  We should not have relocations to an empty
> altinstr_replacement section in the first place.

Well, the relocation destination is in the .altinstructions section
(which is not empty). It happens however to reference a symbol that
points to the .altinstr_replacement section that's empty.

We could likely avoid generating the altinstr_replacement section in
the first place, but I think it's more robust to handle those properly
in the elf loading code.

> This will probably be from the lfences, where the replacement in a nop
> and takes no space.  I think I know how to fix this case.

Indeed, that's my understanding.

Thanks, Roger.

