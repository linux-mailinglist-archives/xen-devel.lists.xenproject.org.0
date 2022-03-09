Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03A4D2C0C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 10:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287636.487704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRseX-0006ke-1h; Wed, 09 Mar 2022 09:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287636.487704; Wed, 09 Mar 2022 09:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRseW-0006iC-TU; Wed, 09 Mar 2022 09:30:40 +0000
Received: by outflank-mailman (input) for mailman id 287636;
 Wed, 09 Mar 2022 09:30:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRseU-0006i6-U8
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 09:30:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9265799f-9f8b-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 10:30:36 +0100 (CET)
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
X-Inumbo-ID: 9265799f-9f8b-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646818236;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wrb8EwCvtfaRtEy1Xz+zeCr3teKI9d0kzJIWyUlZhoM=;
  b=Hr5nxaIQePJqrpSTqxuPQIl+V47MrRAferymGMkeW+TytNVroJKtE8e0
   YImTarRt9XFd36FiKUNtTk+cJOIQRuHo0s8XfBH4qNHukgc1Jgza0WwlY
   XVMQIhaHbjuc4f/AI/zT9mpCZsBODLb4k4Bj4pAV//V4dt1+k1spFXpwZ
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66186688
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:t9OJLKjyTX+vjdJ8hQEMTQcAX161lBAKZh0ujC45NGQN5FlHY01je
 htvCGCCP/nZY2OkfYp3bIWy9UMCuJfTz4cyQAdrrC5nRisb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvc4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSwoHbTcgsVGaUBZKRNuAqFEwprkHGfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiAP
 ppHN2o/BPjGSyZwCl4IDo4/pfiTuUnBMCF3oQuYgYNitgA/yyQuieOwYbI5YOeiT8hPglyRo
 G6A+m3jGwwbL/SW0z/D+XWp7sfxmif8VJMXBaeP3Pdgi12OxUQeEBQTE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JPF8Uq5QfLzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 zehnc7tBDFpmK2YTzSa7Lj8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV/4663knXmRP3nMHIdDwl2QnVZEeG0xwsMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hzwoybLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6i8gjlmOMEZmOq7EMdGPxD4M4fFyhRErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr7j+XAOCTFFetZbjNii9zVCove8G05F
 P4Fa6O3J+h3CrWiMkE7D6ZIRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIORYc1Buvr6Qp
 BmVAxYAoHKm3CGvAVjaOxhLNeK0Nb4i/C1TAMDZFQvxs5TVSd30t/l3mlpeVeRPydGPOtYvF
 qhbIZrcWqoTItkFkhxEBaTAQEVZXE3DrSqFPja/YSh5eJhlRgfT/cTjcBep/y4LZhdbf+Nny
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:n0Ql9qG2EExQGYf/pLqE0seALOsnbusQ8zAXPwsbc20xTiX4rb
 HMoB1173HJYVoqNU3IuOrwXJVoIkm9yXcW2+gs1bbLZniAhILAFugL0WKI+VLd8lrFnNK1u5
 0NT0EHMqyTMbEnt7ed3OEEeOxK/OW6
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="66186688"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqRlv7ZCiKGyRajU1rYsPHEH2uZjU7vtXGmmUCamhoJgTVgGVA68uLM92UZ8kiP0cI/mbi27/PD5I/Ed1MEubLVUADeQQ92WEvwMD4b15HV+A6xT295ihT+8xolTSAMfy999wLqZ74Ch+NXeqi2vbAjt9zLXY+Q9NN6weoeGRiynwPCvvkQGqu40Sy6FRy7gbqSEEGpfTgYXnE2WlO0wOHoadGi5BVTLYwz3BUvfIqvUnxeLgGQVC3cZ3eOGOUY7MXVTBxbjTnK1Fx9Fko1CCiO3rllHvHIqRK0iV94jAblesK2UPAgbgG3GjljLmr92oOJ4SSRf5/7F0pVKrHNdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRUR0BQlI+2WAPs+USRy45dRGW17w2QpTl/ymfJaIGs=;
 b=Gpi+3IisQ/UO6uIzDpBPKHyT0xhXtRqKz5JGIMCQDUsF/7HVCEnaJFaWVCOjZgg16PCla9CcNrJGZkt9nonvcAWWv2R9dTSStdM5//B3fpUD4Qh0JOPg/4QeDeqdWdmVH49l1QvvhAl3AMCWsxxIdFcmO3b+CTEUsHVH1UfrzE6k1H9DUyRkbgn+FQ53hLYQO9d9lMinHOEEFdgPAlWfVbjIc3F8Ka9ZIbK5BSBqyASl0KDH4dk5XbrBCgSi25lzHOYDKe07cWokPWHtOPtbTAnS/2iyB7GRIpvNe7pHpYYz1xQhPa+NUaeqrNF16uhrDMBhVRtUDvtJv33fYTvo7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRUR0BQlI+2WAPs+USRy45dRGW17w2QpTl/ymfJaIGs=;
 b=kW+UsiqKwT/00vo0G7nUSanClmP1YdjH8NLqWH/hfN9BEJkgVfx30CFRt/MSsy1xEf8CTV8lLzvOAoUfzGkCcjUk0pyk73jUGmWJ0s8sdWtq/GklrJjAlbbl1z5Z13LsY3gD53f5kjxNb6UqKeoEgGmphxDV/9dXBHFVi1IR/jY=
Date: Wed, 9 Mar 2022 10:30:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] livepatch: set -f{function,data}-sections
 compiler option
Message-ID: <YihzsHCgjVd0g4b5@Air-de-Roger>
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-3-roger.pau@citrix.com>
 <c35415ef-b3c1-cc1c-2fb2-aa2de2602cd5@suse.com>
 <YidsSmPV1Pqulp+h@Air-de-Roger>
 <9cce44ca-3e31-bc13-3c56-2811efc36d5b@suse.com>
 <YieHVbKjtXY8vpOn@Air-de-Roger>
 <d400722d-d5a2-5bc6-8c16-be1d8e8ee046@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d400722d-d5a2-5bc6-8c16-be1d8e8ee046@suse.com>
X-ClientProxiedBy: LO4P123CA0161.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cafa82e-a3f3-48c4-3fbb-08da01af7360
X-MS-TrafficTypeDiagnostic: MN2PR03MB5325:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB53259891FF54F65B391737A08F0A9@MN2PR03MB5325.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wI0ZtKqmZtUG2HWhMYjgmNmB7S5Ypy8CXC1Y2Gmp0UqpK8+YghA1nQXwWI5lWDKWI/xoOGe3GuXVAkuyUIdR3qsXtQTIh9xQsxgBx8Vafe9JWnF2DogFP0X6L6U2N8V0O2/m7cY7835F+4PJuxz7avJqUU2+Vum883Q3fRCC2rLMI9+SWCjb+OryKuED8XahXw49Tvz1MW//WArMT49Mfmiukr1mQNgW2E9qNSN0sMN5ax3V+g1Gt1WpAbGex2+aiyOWBeKKaI74XDKA0kw2uBenxUCM/hsXvuh8Lv0sjcYaJIrxub0e5GeC9la6tsPuosAbacg48AGUt3Io4zJ+3zWsgjqOaq4Z3USNV1o6M7SPs7U6AW/Ad5NRMRGvETSy5dD/ZqFbaqMcOItlkJEYSjKfz/RkQCfMlI6VygqEfj7FLivsAJZsFl0kRoqhkb/fc4YPnocyUdAkNL+L974QMuemgqNioWocnqdWhBOB+uJsGQhhR/30YpbFycLLQ3Op9QuiQSrTQI+8W0D5w7L6CvMUgH9jpkqGytDGaPBbCScCHZwGO9t/ycES2pc/u6tZbuc8dfiG4+uVZBWg3pHUGHj2XruP0/e1JcfNUkVfVSJDajH1VQT+Lp8k1Jp/h8toWwzJ4dkIJqGE4k7iUBvRgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(33716001)(6666004)(508600001)(9686003)(6512007)(38100700002)(85182001)(83380400001)(26005)(54906003)(186003)(6916009)(4326008)(316002)(6506007)(53546011)(66946007)(5660300002)(66476007)(6486002)(66556008)(8676002)(82960400001)(86362001)(2906002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHRDWGZObXA4UmJIdWtnR01FNHNuRHduN0FuNXI0QVBBUVV1cC9yaWpNayt4?=
 =?utf-8?B?MXBNeCtyVVNKSVAyTGtBSWYrdEIrOWRSZ3QwWGVsaUtSNXBoUVdndlRxZEJs?=
 =?utf-8?B?OEZqOWp0TTBSSXlBcm1OK3FzS09nRU9yWUlNTVlwYjJubWRWdFRiVUFUeFlU?=
 =?utf-8?B?aWpCMmcrMkdxQVZqNVZjMVZjZXZhcTcxMW1pTlF2czJlZEs3cVR6MVppc0lR?=
 =?utf-8?B?djRINXVVWWEwbXM1eUlLSi84K1QwSFovdzgzb3lUUmtqQTRWbGpGdDhLV1Yv?=
 =?utf-8?B?bmVyZW1tdmhSQUVpbVZkaDdPZndwNHRoU0hRQ1kxNzNHTW1KdThmSkR6WjVR?=
 =?utf-8?B?YWNBRytrN25Ka29SWEJIeGJMbDE4S3g3S2FiWEpLWjBmdm02UVAwYjRtZXMw?=
 =?utf-8?B?dHVTK3d1ZkZ4L25WMndGZ1B1QmZxTDJiUmRPNWQxZHl0UU0xVzdTTTE5Zk5W?=
 =?utf-8?B?aEs0YjVkTmxTdlNVMlozRlJvZSsyd1BjOWo2UVk4MHFxU1haV1pnTEsraTZ2?=
 =?utf-8?B?Q1E0NTljTjRDZmhWQmx3MnpWdDJOL2NuUjVjUG1VbUhkVHlKSS9rZ2w4VmFn?=
 =?utf-8?B?T0FJVlNENlFTR25uYSsyaHV0Mi8xUnFERTBEeGI0QTg3SVBTLzV2SXlCalB5?=
 =?utf-8?B?UUpnVmllbDlucUN4ZDZIMXo3c1FTOXdrUzFRL1BROGxEY29VbzdwUXpLOHpt?=
 =?utf-8?B?ZWlWMnpHU3E3Z083KzhaWndQblZ6cXI5TE04K2JqdCtEMkN1YUwweURrZk5k?=
 =?utf-8?B?allVcDBPMkd3eXBXRHFCY0lQZnJaQUdJSGFDRFJCQzV6Q2xJTEdEOEZwL1Vn?=
 =?utf-8?B?aHd0cUllMFQwQmRFdWNlbWgrRUVON0tQaTNGNnNLRzJnU2tGZng1cmdRUm9s?=
 =?utf-8?B?Qmw4SGp2RklXd0d4UmZPV0xpV3M0KzZBbEtwRmE4WG02TUkveGRzNWljZXFz?=
 =?utf-8?B?RklYcTN4VTJJMGxLbEJwY3FIWEdTbmN1UDFRS0I3SXppaGo2VlZ1azVRUzc0?=
 =?utf-8?B?Zkt0UUFjQ1JDNmVpc200b2kyblYyY0V2aitaclRVSHFLcGQ0ekcyK1BuNE13?=
 =?utf-8?B?c2FzSDBrdDdnSURjY1BSeHNtSUsyYTRwQXhYNWxGam1wdmwwM0ZRMVVnRVkz?=
 =?utf-8?B?a0VOTGxLTmdTNXBYdVU0bTVpbXFsR3Jod0dVbVRJR3kxYXFJVStXem9GZlE2?=
 =?utf-8?B?RFk1bTFISkpUOGZaK3ZjOTVwdWpuRktoVi8yQmFhZjBjSkYxbTVMSTByZkFl?=
 =?utf-8?B?VjJ2L0xHMXYyMVBQbksxRE5qeU9GRjJOcmUzZXRvUFQxV1h1WS9aT2VHd1gy?=
 =?utf-8?B?bXFZekV5UFI3THVpZ1lLOUYyVndqcFVxZm5UVXJOYkpQcG4rT1ZsbUhkekM5?=
 =?utf-8?B?ZWxUdkF5T2FtN2QyenpKR1FubzBWSmJuQmpuaFlId25VQi94Mk1aa1ljdUVG?=
 =?utf-8?B?Ni9uVjZVVmJUaEI5bmVMRFBTVFNESmxLdWx6Qy9mV1RldDdVN2dReDRLTFJY?=
 =?utf-8?B?d3dVZC9UanZCSEVCNHBhbkVYTGR0dDlSRXNOTGpDQkJkWTZpMC94bjl2c3VL?=
 =?utf-8?B?aWJuMjVsc29keDlqQWNLeUs5bjNDQXozakhEdS9LK2oxWHoreFBzUytVMnBX?=
 =?utf-8?B?SkZVdVhiZXQvQmptNXB2bEdTY1gzcU90U2JLZTd2VGQ1YVVVdHZ6Z3M5bzBy?=
 =?utf-8?B?WGFvcVh6ZVhBZnNEc3RtTVI3TCtLaUNJRlFJV2lMcms0cHR5TG1MN0toSllu?=
 =?utf-8?B?eUtYMUZ1N0xLZFd6QjVVUzVhNzlKTnYyaS85cTUrL2NqRlFOWjNRaXoycEhK?=
 =?utf-8?B?SzFlaUFsQVZ4UCtFdEdMYjc1THEzR1RKK3kwVmpiZ1NPcjZDUVNNY1dhSkxG?=
 =?utf-8?B?dEo4R3FmcVp2TVJSbjZFNUtvZGpHaEx5c2l2VmI2aFh0cW4xQVNaaW1yaXJo?=
 =?utf-8?B?ZWYwS2JiM2E1alpJbXdEZDdiUE55dmpSRDBqVG15RS9yQkZEdHRmUXo2Q0k4?=
 =?utf-8?B?c2pIbkdKblU0QkZTSW1JRjJOQzVBOWd4Y3dyRXRmYnJacC93cUE2Q2tjRk5v?=
 =?utf-8?B?MDBYZlZXZG5qNTdrKzFsWWNzRkRVVitmQ1p2bDlzdlIrQjNMSnE5TytoeVY1?=
 =?utf-8?B?WGVHSDFkbENxNlNzTEE3VFZ2ejczdlYvWnZqTURSM2hWN25lVHVXSGxibzND?=
 =?utf-8?Q?IlUR/Crb/h7kzsf2XDe+Zp8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cafa82e-a3f3-48c4-3fbb-08da01af7360
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 09:30:29.4345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQ2NakxW5pFHFwvRtkaQ/9qTyfVJq8k5tiTdb+RAW6Sxot+L0WioT9/TO6vzLbxnYh2MNFYsQFEF4rGLhVxxQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5325
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 05:58:49PM +0100, Jan Beulich wrote:
> On 08.03.2022 17:41, Roger Pau Monné wrote:
> > On Tue, Mar 08, 2022 at 04:13:55PM +0100, Jan Beulich wrote:
> >> On 08.03.2022 15:46, Roger Pau Monné wrote:
> >>> On Tue, Mar 08, 2022 at 03:09:17PM +0100, Jan Beulich wrote:
> >>>> On 08.03.2022 14:49, Roger Pau Monne wrote:
> >>>>> If livepatching support is enabled build the hypervisor with
> >>>>> -f{function,data}-sections compiler options, which is required by the
> >>>>> livepatching tools to detect changes and create livepatches.
> >>>>>
> >>>>> This shouldn't result in any functional change on the hypervisor
> >>>>> binary image, but does however require some changes in the linker
> >>>>> script in order to handle that each function and data item will now be
> >>>>> placed into its own section in object files. As a result add catch-all
> >>>>> for .text, .data and .bss in order to merge each individual item
> >>>>> section into the final image.
> >>>>>
> >>>>> The main difference will be that .text.startup will end up being part
> >>>>> of .text rather than .init, and thus won't be freed. .text.exit will
> >>>>> also be part of .text rather than dropped. Overall this could make the
> >>>>> image bigger, and package some .text code in a sub-optimal way.
> >>>>>
> >>>>> On Arm the .data.read_mostly needs to be moved ahead of the .data
> >>>>> section like it's already done on x86, so the .data.* catch-all
> >>>>> doesn't also include .data.read_mostly. The alignment of
> >>>>> .data.read_mostly also needs to be set to PAGE_SIZE so it doesn't end
> >>>>> up being placed at the tail of a read-only page from the previous
> >>>>> section. While there move the alignment of the .data section ahead of
> >>>>> the section declaration, like it's done for other sections.
> >>>>>
> >>>>> The benefit of having CONFIG_LIVEPATCH enable those compiler option
> >>>>> is that the livepatch build tools no longer need to fiddle with the
> >>>>> build system in order to enable them. Note the current livepatch tools
> >>>>> are broken after the recent build changes due to the way they
> >>>>> attempt to set  -f{function,data}-sections.
> >>>>>
> >>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>
> >>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>>> --- a/xen/arch/x86/xen.lds.S
> >>>>> +++ b/xen/arch/x86/xen.lds.S
> >>>>> @@ -88,6 +88,9 @@ SECTIONS
> >>>>>         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> >>>>>  
> >>>>>         *(.text)
> >>>>> +#ifdef CONFIG_CC_SPLIT_SECTIONS
> >>>>> +       *(.text.*)
> >>>>> +#endif
> >>>>>         *(.text.__x86_indirect_thunk_*)
> >>>>>         *(.text.page_aligned)
> >>>>
> >>>> These last two now will not have any effect anymore when
> >>>> CC_SPLIT_SECTIONS=y. This may have undesirable effects on the
> >>>> overall size when there is more than one object with a
> >>>> .text.page_aligned contribution. In .data ...
> >>>
> >>> Agreed. I wondered whether to move those ahead of the main text
> >>> section, so likely:
> >>>
> >>>        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> >>>
> >>>        *(.text.page_aligned)
> >>>        *(.text.__x86_indirect_thunk_*)
> >>>        *(.text)
> >>> #ifdef CONFIG_CC_SPLIT_SECTIONS
> >>>        *(.text.*)
> >>> #endif
> >>
> >> Perhaps; I'm not really worried of .text.__x86_indirect_thunk_*,
> >> though. When adding .text.* that one can likely go away.
> >>
> >>> FWIW, Linux seems fine to package .text.page_aligned together with the
> >>> rest of .text using the .text.[0-9a-zA-Z_]* catch-all.
> >>
> >> There's no question this is functionally fine. The question is how
> >> many extra padding areas are inserted because of this.
> >>
> >>>>> @@ -292,9 +295,7 @@ SECTIONS
> >>>>>  
> >>>>>    DECL_SECTION(.data) {
> >>>>>         *(.data.page_aligned)
> >>>>> -       *(.data)
> >>>>> -       *(.data.rel)
> >>>>> -       *(.data.rel.*)
> >>>>> +       *(.data .data.*)
> >>>>>    } PHDR(text)
> >>>>
> >>>> ... this continues to be named first. I wonder whether we wouldn't
> >>>> want to use SORT_BY_ALIGNMENT (if available) instead in both places.
> >>>
> >>> We could use the command line option if available
> >>> (--sort-section=alignment) to sort all wildcard sections?
> >>
> >> Depends on the scope of the sorting that would result when enabled
> >> globally like this.
> > 
> > I'm not sure I'm following. Don't we generally want to sort by
> > alignment in order to avoid adding unnecessary padding as much as
> > possible?
> > 
> > For any wildcard sections we really don't care anymore how they are
> > sorted?
> 
> Sure. Question is whether sorting is limited to within any single
> *(...) construct, or whether it could extend to adjacent ones. IOW
> whether the command line option strictly is a replacement of adding
> SORT_BY_ALIGNMENT to every one of these constructs.

AFAICT the command line option will have the effect of setting the
sorting of any wildcard containing sections to use SORT_BY_ALIGNMENT.
Ie: .data.* would become SORT_BY_ALIGNMENT(.data.*):

*(.data SORT_BY_ALIGNMENT(.data.*))

I've taken a look at the binutils ld source and that seems to be the
case, any wildcard containing enum will get it's sorting set to by
alignment (but I'm not familiar with ld code so I might be missing
pieces).

Thanks, Roger.

