Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4574D1663
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 12:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286761.486398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRYBW-00080i-W1; Tue, 08 Mar 2022 11:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286761.486398; Tue, 08 Mar 2022 11:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRYBW-0007yp-SK; Tue, 08 Mar 2022 11:39:22 +0000
Received: by outflank-mailman (input) for mailman id 286761;
 Tue, 08 Mar 2022 11:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRYBV-0007yj-6h
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 11:39:21 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6226b848-9ed4-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 12:39:17 +0100 (CET)
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
X-Inumbo-ID: 6226b848-9ed4-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646739558;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ripalwEe6I7NNwbLQ+/TV6oItJ9+CjhrbfOzNkoL2rE=;
  b=M+LEttZ/Uv2vVVrSqbD3Fh3bXTA97vIE6h4n/1VHf0PTw1BloWnJQIJw
   ierJO1SYNA/KnGGDGjlAWGVgaKAbB7HZ+wntyAZeXPuotbUYcK3dqI8PU
   jx0f80yyMAAe0nTHxm9+o+dqsSs8Fyry4ZBxBE5mVwwyB2iJQu4EG+E0B
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66094228
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SuG0iqD5nKe0CRVW/9Xjw5YqxClBgxIJ4kV8jS/XYbTApDN21mcCm
 jBMWmvSPf2JYGX0fYxwPIS2oUwE7JfWm9UyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhxx
 dkXtaKWST5xBY/Uk8czfhQEMRxXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgm9h2poUTZ4yY
 eI7S2prT0vLWCdrKwsmCIs0guOpoijgJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHN6CzTuI9Fq8i+mJmjn0MKosE7m/+u9vkUek7GUZAx0LVnO2ufC8zEW5Xrp3J
 0UK9wI0oKM19UjtScPyNzWnpFaUsxhaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLT5lvaCRSHmd3qyJtj70Mi8QRUcAajUDVhAt+MT4rcc4iRenczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV/6W28QrHvRSsn8DybBY+xSv6Uz6H0yosMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hzwoybLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6i8gjlmOMEZmOq7EMdGPxb4M4fFyhRErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr7j+TBNCPOEOdYazNii9zVCove+205F
 P4Fa6O3J+h3CrWiMkE7D6ZJRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIORYc1Buvr6Qp
 BmVAxYAoHKm3CGvAVjaOxhLNeK0Nb4i/C1TAMDZFQvxs5TVSd30t/l3mlpeVeRPydGPOtYoF
 6lVIZvRWK8TItkFkhxEBaTAQEVZXE3DrSqFPja/YSh5eJhlRgfT/cTjcBep/y4LZhdbf+Nny
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:fb3FlquJyxHHRKLsaCa2ePGz7skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzE4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72PeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl5Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbprmGuhHjHkV1RUsZyRtixZJGbEfqFCgL3Z79FupgE286NCr/Zv3Evp9/oGOu15Dq
 r/Q+FVfYp1P7wrhJJGdZc8qPSMex7wqDL3QRSvyAfcZeg600ykke+D3Fxy3pDvRKA1
X-IronPort-AV: E=Sophos;i="5.90,164,1643691600"; 
   d="scan'208";a="66094228"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYPRYdYDQcKHBbfQWy1cFWFsrBfYnKJilIgEGqEJOABUp8ft6HTxbgfY3OFdPn2JHr7uTu34J4tVO6WOhE/bMRVi6sKDbquincbnC8IVn+z7Ey0ERi2U3WB6wVmvwrj/G/wht7SOz9a51D6BOgL+ZkAv/cIeX2EnEqS/kFYTlB7Tp7qqWhdowlPI7L5OlHwMI31LN5DdUIHZgZ6QMz9OvDrY4d0AkzIeVsx+lAMKqZgHVS3uulxsdM5g2Iqqld3tDyaoEyVq4Ns5P6I4L+NGa0cMU6GQ7OOO1gxcDbTnZCCpzPcgYvc8MlacKlnp4xGoGfyIZFHRkJb1V1P736I3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6yk0/hjFSZ6Mvi618r5ZZ/v+vtKRqYZ6iLrsT0NDgQ=;
 b=Lss8i/2jJgjhhMYmTToJz3xH24+IyOTmVOXvgOm/0JgJmSGGx/wLi0TpVkzjbSpPTs0/2yjigvzoG3TL+WAnMIhsg6fT/dU3koOoXbt22F6OiFz2GHS3ONFACpLiKBGeM+p4OS1kqbY4nubBVCCow560+GWe3+ptfQtqQvu9TfuSG8k7F7emNQFIgSiblmDuFR7f4qI00ZSIyaQ2o2g76DDtMOvaaumKiztBLW+tGPzuVPZyr4HGZdo5dVRUamXNjlMmzqkBVaTXb34ItFOdrixwUsr9LMVXAzotfytAFeRoQjXqQLPp6ysf0IkHcPHK6jF8WONmcjphyUfKWMCz7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6yk0/hjFSZ6Mvi618r5ZZ/v+vtKRqYZ6iLrsT0NDgQ=;
 b=PVHFwR/gucxSRG6IeVYoLPXrdIssMunvHDW7LNGcjCfRzmAfghcOLeSLxAzxQ3P2/bIhtM2wLdGvS/6D9il3AI9dDmkyQODuDXVjFIKUNbZQYC9H3jraQnGoUUsoMIKPhQyewVlC7YhFiF30wZZhpytjmM90Td7GCRK1AcQl1hI=
Date: Tue, 8 Mar 2022 12:38:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YidAU63TsVO/X1Q+@Air-de-Roger>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220307150609.10662-3-jane.malalane@citrix.com>
X-ClientProxiedBy: LO4P123CA0124.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 021b1f37-3791-4c7b-6c6e-08da00f84016
X-MS-TrafficTypeDiagnostic: DM5PR03MB2537:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB25379C715B37D8E94920D5948F099@DM5PR03MB2537.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qy1o5fgzGskhJDW1zjLlQw5RuEFHhaT+QBfecjkiy7Bhrt53V3tBqTCgtClkRakU09Wo8yZwFtkULKMmnP0an30sAjlKJ530uJp/2jcY4qtdVu5IYYxI+1xoxnr216+hRdlvBxJqOuWNS3GNVfjzdV4hdTWpRvcNbM/+iWQbG7S1aGEKWnaw832OIQaXOIIvqczpCXrn/EsC5TlwRZGP0baieM175bcy1w2B9sSq2+kw3G+OKuTPHt6+Xnq7gIP9NUZbQNfJiE48Mr4SLwA3jp/MbK9caY+4WO9kSLnTMPmX+qJpfZIM98APTH5GgN4kIqoY1OV5RMIH3tpMspwhraJCoKCORjJDa3oblgdndLdTg1EyUqwtZqLItvT+upc36USsJI585/a5j9b4AFdKLAyF6WdFvq0oVV8pRczloEjOh+h5E3/t41OOkAsItpzPitgcF1+2LyH3wz5CshK4hnyKLSiVHGRNhc/bE0jesIA08sKDFPUORbE5dgGFNwC+Z6KEhQXI3kwGRQ9Zi7H15zUHLTx9EE0p/IJaJk1l5hU1ptB/wW1xn2XGvKcqlphYceu1mLyBnWzzT4U/Gm08RtduuwKZTYEKKkZzMNoTV1+RSGw6ZOctzTRWJg//XtSphs7XiYynKt8b0CXVcL04dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(66946007)(6666004)(6512007)(9686003)(6506007)(66556008)(82960400001)(66476007)(4326008)(6636002)(316002)(508600001)(6486002)(54906003)(26005)(186003)(38100700002)(83380400001)(2906002)(30864003)(8936002)(33716001)(85182001)(5660300002)(8676002)(6862004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDVJZE13V09QSjRLajdVem1udVVOSmZJMkFsbndKS2RMaThjcnJienBSMUZv?=
 =?utf-8?B?ZktZUzV1Z2VLN2dnU0J5bDJiWXRPWThrcEg3OTcwWVFhd1JsRHFZdlFONGdu?=
 =?utf-8?B?YmttM1Y5Nnc2OWNjdUpWN2ZvdHNkQXVOdml5V2Q5TVhjRm1BTUczVDFQZFpp?=
 =?utf-8?B?NFgxQVFEWXlrZW5iWHJRVlAvdkI4eVFEbDhMaEIzNi9EZzF6Y3pSM2pIVlZS?=
 =?utf-8?B?dGNhRVJwemV4WitHT1ZlMmJwRFRxMnJlTjNER09PZHVlSEhBdHAwQWF5UFpW?=
 =?utf-8?B?TkRGN0FmdU5OekVQbFhKZ0RDSjhHZFIra0M1WFhnTUJNbmx0MndxMGVoT0Fk?=
 =?utf-8?B?NDZISndZdCt0MXNISmNPcjBkcytrRVJIRUZvVy83cGIrUG4xMTZzNlVBU211?=
 =?utf-8?B?VmpCVjJ0WGNubDRobUNrMjlTRVZGMHc0N3pNUWlINlU0SmtGYnk2NFVwbkd2?=
 =?utf-8?B?RlZRV1RiZlYyenJpYWZHcy9MZUNGWHdxZmhpd09ETlB2cGk3RGthaVdWQWZm?=
 =?utf-8?B?UTIxSkdIZ3NaTzhTZXFFS3hWN3dtWjRqa1Y4NTdOeVpadlp0NW03dUFDbEN3?=
 =?utf-8?B?UWJIMVpLbkV0YXFqUUFhOWFXVC9odm5yNDRjMnd2VSsxRW1FNXVrZHFBV1Uv?=
 =?utf-8?B?cjRoTkhjWTQrcHNkVjJjbjAvQXN2TjFGQTNNRlgwWXROMGR3RVlmUmVFVWJu?=
 =?utf-8?B?OFBNSDYrL2VNNDA3THpEdE5OTS9iaFdVSGk4cnlldGJqLzYwMFVWMUhyMHJ6?=
 =?utf-8?B?Z2ZGaHp6Q3NpbWtXQzE2cFNEMyt4a1ZGS0lONlhPeUNxZG83WCtOY2xqZzJQ?=
 =?utf-8?B?Z1dwdk9hVWFRd3AxUUNITmR2WkZDUTBNQytlN2tpNGc0b0FLWGs1Ync2dDBV?=
 =?utf-8?B?L28wQUMxTm93bHZMWUhpa3NEWEl2dHExV1pIeEV4RFhZMUxZc1FleEpIZnFB?=
 =?utf-8?B?NEh5TjNWWWpPWURKUENzTW5URWNTVjBoRy9KMlpPQ0tQZUh2RHVCZE82ZW01?=
 =?utf-8?B?MW1vZUFNeWxFSzR5T3VmUGtieVcyRk5TL0IrTEhSS1JiS2tZdHB0OFBvalYv?=
 =?utf-8?B?dXI5VUZwVXNZcEJJNEVyMWNRYVl4ZTJpdVhiSS9YU1VSMnNMaGlHeEl5SkhS?=
 =?utf-8?B?MlVadHpXSGU3L3lBemV4RTJJTndiaVUwdktnR3BuOVpQU2dEbVJ1UzRjS3lE?=
 =?utf-8?B?QnBDQkNhRFgxMUtIS2VJbWdWYmdRZkdEcEsxVU9MbEhzM0dnd1cvNnJTR296?=
 =?utf-8?B?aklxREJrYTlUZ0lLYUlRK2MxZUJCWmM1b1dhS1NnZFk4UFlsWFF2eXZMdTls?=
 =?utf-8?B?TXhMSUlWTWNaa1ZXaHdoTmorV1pJTE5rdTJSbTlsWWg3djMrN1hrQ3dodkVM?=
 =?utf-8?B?T1Q0YjVvL0JNMkVtYmdkdEMvNFFUZGxBM290OEZxQjZ0L2hGd2dILzJ1THU3?=
 =?utf-8?B?Tk9HY3h3eU03SDVmQVdzam4zckdDMzhKb0p2RDI2YndDS080MGpETCtGYlp2?=
 =?utf-8?B?d1dkbExRQVZkVDcxUXYwSGo3NmxiYTQ3NzQ5NFBlWGVCZDRldjVzVTRvQmpW?=
 =?utf-8?B?VHJlRG1CeVJ0SGFIMG5JNEpINE43YWd3RHQ1Y2NiOXVMUDNwcFk1RHA2RHNM?=
 =?utf-8?B?ZmEzV25BUFEwME9iaStycGZxa1lxa3lYWFgxRkU0S0xqRzUvOENMRnNrcTJF?=
 =?utf-8?B?UTUydnM0Z3RmZDJqalZZWnhxUmVXVCtZQWNaY3ZoRU5BYTg0RysyWjgrUmJt?=
 =?utf-8?B?RnJsYmt0UGlubnRKbDhvOGRUc2Zoc1pGWmdwNU9CWWNpTEM4N2FuR3lBeVJs?=
 =?utf-8?B?QzF3eU5vS3pzZUNmUFIwRzRoRllLNCt4WWhoa0RWTHJmNzNSeUNXNTdUbGhT?=
 =?utf-8?B?cTFqejR6OUpIVjgxcUZ1UmsvUGdDZlpUUTZRNnRQRFYrMi92aXJENUFScjNa?=
 =?utf-8?B?dkJMMC9PKzFHT211YXhaSWFYT3E3UjI5bWJwOHlLMlM4TDRPdmVTUXhRSGFs?=
 =?utf-8?B?MU51QjVKdTJSRS9pNVl5UWZ0NWJTVUtkalZHMmdQQzZsSjVqOXVhMk5sOXF2?=
 =?utf-8?B?SC9Fb1BRVWhhdWF6QUhyOENHcWd0V21jR0VLYzVMeWxGQWFwTi9OdFkxbmFj?=
 =?utf-8?B?dVJ3ZXg0cmxBVVhYQVEyd0JZYzZQTlE0bkdaZW5kaWxKV0w5czlIb0htTWd3?=
 =?utf-8?Q?MAIUKBZfPQUHedGaT1f/esU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 021b1f37-3791-4c7b-6c6e-08da00f84016
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 11:39:05.6426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NJzPxyYjHOkG5FwduWvMGLWFyJRDHgf0ey5++SZ9bBZp6IIyyqpIrZmf0vea4pWcnHfjFKEs6WdR7ig/9pp2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2537
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 03:06:09PM +0000, Jane Malalane wrote:
> Introduce a new per-domain creation x86 specific flag to
> select whether hardware assisted virtualization should be used for
> x{2}APIC.
> 
> A per-domain option is added to xl in order to select the usage of
> x{2}APIC hardware assisted virtualization, as well as a global
> configuration option.
> 
> Having all APIC interaction exit to Xen for emulation is slow and can
> induce much overhead. Hardware can speed up x{2}APIC by decoding the
> APIC access and providing a VM exit with a more specific exit reason
> than a regular EPT fault or by altogether avoiding a VM exit.
> 
> On the other hand, being able to disable x{2}APIC hardware assisted
> virtualization can be useful for testing and debugging purposes.
> 
> Note: vmx_install_vlapic_mapping doesn't require modifications
> regardless of whether the guest has "Virtualize APIC accesses" enabled
> or not, i.e., setting the APIC_ACCESS_ADDR VMCS field is fine so long
> as virtualize_apic_accesses is supported by the CPU.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> 
> v5:
> * Revert v4 changes in vmx_vlapic_msr_changed(), preserving the use of
>   the has_assisted_x{2}apic macros
> * Following changes in assisted_x{2}apic_available definitions in
>   patch 1, retighten conditionals for setting
>   XEN_HVM_CPUID_APIC_ACCESS_VIRT and XEN_HVM_CPUID_X2APIC_VIRT in
>   cpuid_hypervisor_leaves()
> 
> v4:
>  * Add has_assisted_x{2}apic macros and use them where appropriate
>  * Replace CPU checks with per-domain assisted_x{2}apic control
>    options in vmx_vlapic_msr_changed() and cpuid_hypervisor_leaves(),
>    following edits to assisted_x{2}apic_available definitions in
>    patch 1
>    Note: new assisted_x{2}apic_available definitions make later
>    cpu_has_vmx_apic_reg_virt and cpu_has_vmx_virtual_intr_delivery
>    checks redundant in vmx_vlapic_msr_changed()
> 
> v3:
>  * Change info in xl.cfg to better express reality and fix
>    capitalization of x{2}apic
>  * Move "physinfo" variable definition to the beggining of
>    libxl__domain_build_info_setdefault()
>  * Reposition brackets in if statement to match libxl coding style
>  * Shorten logic in libxl__arch_domain_build_info_setdefault()
>  * Correct dprintk message in arch_sanitise_domain_config()
>  * Make appropriate changes in vmx_vlapic_msr_changed() and
>    cpuid_hypervisor_leaves() for amended "assisted_x2apic" bit
>  * Remove unneeded parantheses
> 
> v2:
>  * Add a LIBXL_HAVE_ASSISTED_APIC macro
>  * Pass xcpyshinfo as a pointer in libxl__arch_get_physinfo
>  * Add a return statement in now "int"
>    libxl__arch_domain_build_info_setdefault()
>  * Preserve libxl__arch_domain_build_info_setdefault 's location in
>    libxl_create.c
>  * Correct x{2}apic default setting logic in
>    libxl__arch_domain_prepare_config()
>  * Correct logic for parsing assisted_x{2}apic host/guest options in
>    xl_parse.c and initialize them to -1 in xl.c
>  * Use guest options directly in vmx_vlapic_msr_changed
>  * Fix indentation of bool assisted_x{2}apic in struct hvm_domain
>  * Add a change in xenctrl_stubs.c to pass xenctrl ABI checks
> ---
>  docs/man/xl.cfg.5.pod.in                | 19 +++++++++++++++++++
>  docs/man/xl.conf.5.pod.in               | 12 ++++++++++++
>  tools/golang/xenlight/helpers.gen.go    | 12 ++++++++++++
>  tools/golang/xenlight/types.gen.go      |  2 ++
>  tools/include/libxl.h                   |  7 +++++++
>  tools/libs/light/libxl_arch.h           |  5 +++--
>  tools/libs/light/libxl_arm.c            |  7 +++++--
>  tools/libs/light/libxl_create.c         | 22 +++++++++++++---------
>  tools/libs/light/libxl_types.idl        |  2 ++
>  tools/libs/light/libxl_x86.c            | 28 ++++++++++++++++++++++++++--
>  tools/ocaml/libs/xc/xenctrl.ml          |  2 ++
>  tools/ocaml/libs/xc/xenctrl.mli         |  2 ++
>  tools/ocaml/libs/xc/xenctrl_stubs.c     |  2 +-
>  tools/xl/xl.c                           |  8 ++++++++
>  tools/xl/xl.h                           |  2 ++
>  tools/xl/xl_parse.c                     | 16 ++++++++++++++++
>  xen/arch/x86/domain.c                   | 28 +++++++++++++++++++++++++++-
>  xen/arch/x86/hvm/vmx/vmcs.c             |  4 ++++
>  xen/arch/x86/hvm/vmx/vmx.c              | 13 ++++---------
>  xen/arch/x86/include/asm/hvm/domain.h   |  6 ++++++
>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  3 +++
>  xen/arch/x86/traps.c                    |  9 +++++----
>  xen/include/public/arch-x86/xen.h       |  2 ++
>  23 files changed, 183 insertions(+), 30 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index b98d161398..dcca564a23 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1862,6 +1862,25 @@ firmware tables when using certain older guest Operating
>  Systems. These tables have been superseded by newer constructs within
>  the ACPI tables.
>  
> +=item B<assisted_xapic=BOOLEAN>
> +
> +B<(x86 only)> Enables or disables hardware assisted virtualization for
> +xAPIC. With this option enabled, a memory-mapped APIC access will be
> +decoded by hardware and either issue a more specific VM exit than just
> +an EPT fault, or altogether avoid a VM exit. Notice full
> +virtualization for xAPIC can only be achieved if hardware supports
> +“APIC-register virtualization” and “virtual-interrupt delivery”.

You shouldn't mention “APIC-register virtualization” or
“virtual-interrupt delivery”, as those are Intel specific options. I
would just remove that sentence (same below).

> The
> +default is settable via L<xl.conf(5)>.
> +
> +=item B<assisted_x2apic=BOOLEAN>
> +
> +B<(x86 only)> Enables or disables hardware assisted virtualization for
> +x2APIC. With this option enabled, an MSR-Based APIC access will
> +either issue a VM exit or altogether avoid one.

"With this option enabled, certain accesses to MSR APIC registers will
avoid a VM exit into the hypervisor."

> Notice full
> +virtualization for x2APIC can only be achieved if hardware supports
> +“APIC-register virtualization” and “virtual-interrupt delivery”. The
> +default is settable via L<xl.conf(5)>.
> +
>  =item B<nx=BOOLEAN>
>  
>  B<(x86 only)> Hides or exposes the No-eXecute capability. This allows a guest
> diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
> index df20c08137..95d136d1ea 100644
> --- a/docs/man/xl.conf.5.pod.in
> +++ b/docs/man/xl.conf.5.pod.in
> @@ -107,6 +107,18 @@ Sets the default value for the C<max_grant_version> domain config value.
>  
>  Default: maximum grant version supported by the hypervisor.
>  
> +=item B<assisted_xapic=BOOLEAN>
> +
> +If enabled, domains will use xAPIC hardware assisted virtualization by default.
> +
> +Default: enabled if supported.
> +
> +=item B<assisted_x2apic=BOOLEAN>
> +
> +If enabled, domains will use x2APIC hardware assisted virtualization by default.
> +
> +Default: enabled if supported.
> +
>  =item B<vif.default.script="PATH">
>  
>  Configures the default hotplug script used by virtual network devices.
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index dd4e6c9f14..dece545ee0 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1120,6 +1120,12 @@ x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
>  if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
>  return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>  }
> +if err := x.ArchX86.AssistedXapic.fromC(&xc.arch_x86.assisted_xapic);err != nil {
> +return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
> +}
> +if err := x.ArchX86.AssistedX2Apic.fromC(&xc.arch_x86.assisted_x2apic);err != nil {
> +return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
> +}
>  x.Altp2M = Altp2MMode(xc.altp2m)
>  x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
>  if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
> @@ -1605,6 +1611,12 @@ xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
>  if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
>  return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>  }
> +if err := x.ArchX86.AssistedXapic.toC(&xc.arch_x86.assisted_xapic); err != nil {
> +return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
> +}
> +if err := x.ArchX86.AssistedX2Apic.toC(&xc.arch_x86.assisted_x2apic); err != nil {
> +return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
> +}
>  xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
>  xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
>  if err := x.Vpmu.toC(&xc.vpmu); err != nil {
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index 87be46c745..253c9ad93d 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -520,6 +520,8 @@ Vuart VuartType
>  }
>  ArchX86 struct {
>  MsrRelaxed Defbool
> +AssistedXapic Defbool
> +AssistedX2Apic Defbool
>  }
>  Altp2M Altp2MMode
>  VmtraceBufKb int
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 94e6355822..cdcccd6d01 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -535,6 +535,13 @@
>  #define LIBXL_HAVE_PHYSINFO_ASSISTED_APIC 1
>  
>  /*
> + * LIBXL_HAVE_ASSISTED_APIC indicates that libxl_domain_build_info has
> + * assisted_xapic and assisted_x2apic fields for enabling hardware
> + * assisted virtualization for x{2}apic per domain.
> + */
> +#define LIBXL_HAVE_ASSISTED_APIC 1
> +
> +/*
>   * libxl ABI compatibility
>   *
>   * The only guarantee which libxl makes regarding ABI compatibility
> diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
> index 207ceac6a1..03b89929e6 100644
> --- a/tools/libs/light/libxl_arch.h
> +++ b/tools/libs/light/libxl_arch.h
> @@ -71,8 +71,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>                                                 libxl_domain_create_info *c_info);
>  
>  _hidden
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info);
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo);
>  
>  _hidden
>  int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 39fdca1b49..ba5b8f433f 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1384,8 +1384,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>      }
>  }
>  
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info)
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo)
>  {
>      /* ACPI is disabled by default */
>      libxl_defbool_setdefault(&b_info->acpi, false);
> @@ -1399,6 +1400,8 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>      memset(&b_info->u, '\0', sizeof(b_info->u));
>      b_info->type = LIBXL_DOMAIN_TYPE_INVALID;
>      libxl_domain_build_info_init_type(b_info, LIBXL_DOMAIN_TYPE_PVH);
> +
> +    return 0;
>  }
>  
>  int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 15ed021f41..88d08d7277 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -75,6 +75,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>                                          libxl_domain_build_info *b_info)
>  {
>      int i, rc;
> +    libxl_physinfo info;
>  
>      if (b_info->type != LIBXL_DOMAIN_TYPE_HVM &&
>          b_info->type != LIBXL_DOMAIN_TYPE_PV &&
> @@ -264,7 +265,18 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>      if (!b_info->event_channels)
>          b_info->event_channels = 1023;
>  
> -    libxl__arch_domain_build_info_setdefault(gc, b_info);
> +    rc = libxl_get_physinfo(CTX, &info);
> +    if (rc) {
> +        LOG(ERROR, "failed to get hypervisor info");
> +        return rc;
> +    }
> +
> +    rc = libxl__arch_domain_build_info_setdefault(gc, b_info, &info);
> +    if (rc) {
> +        LOG(ERROR, "unable to set domain arch build info defaults");
> +        return rc;
> +    }
> +
>      libxl_defbool_setdefault(&b_info->dm_restrict, false);
>  
>      if (b_info->iommu_memkb == LIBXL_MEMKB_DEFAULT)
> @@ -457,14 +469,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>      }
>  
>      if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
> -        libxl_physinfo info;
> -
> -        rc = libxl_get_physinfo(CTX, &info);
> -        if (rc) {
> -            LOG(ERROR, "failed to get hypervisor info");
> -            return rc;
> -        }
> -
>          if (info.cap_gnttab_v2)
>              b_info->max_grant_version = 2;
>          else if (info.cap_gnttab_v1)
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 42ac6c357b..db5eb0a0b3 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -648,6 +648,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
>                                 ("vuart", libxl_vuart_type),
>                                ])),
>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> +                               ("assisted_xapic", libxl_defbool),
> +                               ("assisted_x2apic", libxl_defbool),
>                                ])),
>      # Alternate p2m is not bound to any architecture or guest type, as it is
>      # supported by x86 HVM and ARM support is planned.
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index e0a06ecfe3..c377d13b19 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -23,6 +23,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
>          config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
>  
> +    if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV)
> +    {
> +        if (libxl_defbool_val(d_config->b_info.arch_x86.assisted_xapic))
> +            config->arch.misc_flags |= XEN_X86_ASSISTED_XAPIC;
> +
> +        if (libxl_defbool_val(d_config->b_info.arch_x86.assisted_x2apic))
> +            config->arch.misc_flags |= XEN_X86_ASSISTED_X2APIC;
> +    }
>      return 0;
>  }
>  
> @@ -819,11 +827,27 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>  {
>  }
>  
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info)
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo)
>  {
>      libxl_defbool_setdefault(&b_info->acpi, true);
>      libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
> +
> +    if (b_info->type != LIBXL_DOMAIN_TYPE_PV) {
> +        libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic,
> +                             physinfo->cap_assisted_xapic);
> +        libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic,
> +                             physinfo->cap_assisted_x2apic);
> +    }
> +

Extra newline? 'else if' should be one space after the closing
bracket.

> +    else if (!libxl_defbool_is_default(b_info->arch_x86.assisted_xapic) ||
> +             !libxl_defbool_is_default(b_info->arch_x86.assisted_x2apic)) {
> +        LOG(ERROR, "Interrupt Controller Virtualization not supported for PV");
> +        return ERROR_INVAL;
> +    }
> +
> +    return 0;
>  }
>  
>  int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 21783d3622..672a11ceb6 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -50,6 +50,8 @@ type x86_arch_emulation_flags =
>  
>  type x86_arch_misc_flags =
>  	| X86_MSR_RELAXED
> +	| X86_ASSISTED_XAPIC
> +	| X86_ASSISTED_X2APIC
>  
>  type xen_x86_arch_domainconfig =
>  {
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index af6ba3d1a0..f9a6aa3a0f 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -44,6 +44,8 @@ type x86_arch_emulation_flags =
>  
>  type x86_arch_misc_flags =
>    | X86_MSR_RELAXED
> +  | X86_ASSISTED_XAPIC
> +  | X86_ASSISTED_X2APIC
>  
>  type xen_x86_arch_domainconfig = {
>    emulation_flags: x86_arch_emulation_flags list;
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index e0d49b18d2..ecfc7125d5 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -239,7 +239,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
>  
>  		cfg.arch.misc_flags = ocaml_list_to_c_bitmap
>  			/* ! x86_arch_misc_flags X86_ none */
> -			/* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
> +			/* ! XEN_X86_ XEN_X86_ASSISTED_X2APIC max */
>  			(VAL_MISC_FLAGS);
>  
>  #undef VAL_MISC_FLAGS
> diff --git a/tools/xl/xl.c b/tools/xl/xl.c
> index 2d1ec18ea3..31eb223309 100644
> --- a/tools/xl/xl.c
> +++ b/tools/xl/xl.c
> @@ -57,6 +57,8 @@ int max_grant_frames = -1;
>  int max_maptrack_frames = -1;
>  int max_grant_version = LIBXL_MAX_GRANT_DEFAULT;
>  libxl_domid domid_policy = INVALID_DOMID;
> +int assisted_xapic = -1;
> +int assisted_x2apic = -1;
>  
>  xentoollog_level minmsglevel = minmsglevel_default;
>  
> @@ -201,6 +203,12 @@ static void parse_global_config(const char *configfile,
>      if (!xlu_cfg_get_long (config, "claim_mode", &l, 0))
>          claim_mode = l;
>  
> +    if (!xlu_cfg_get_long (config, "assisted_xapic", &l, 0))
> +        assisted_xapic = l;
> +
> +    if (!xlu_cfg_get_long (config, "assisted_x2apic", &l, 0))
> +        assisted_x2apic = l;
> +
>      xlu_cfg_replace_string (config, "remus.default.netbufscript",
>          &default_remus_netbufscript, 0);
>      xlu_cfg_replace_string (config, "colo.default.proxyscript",
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index c5c4bedbdd..528deb3feb 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -286,6 +286,8 @@ extern libxl_bitmap global_vm_affinity_mask;
>  extern libxl_bitmap global_hvm_affinity_mask;
>  extern libxl_bitmap global_pv_affinity_mask;
>  extern libxl_domid domid_policy;
> +extern int assisted_xapic;
> +extern int assisted_x2apic;
>  
>  enum output_format {
>      OUTPUT_FORMAT_JSON,
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 117fcdcb2b..0ab9b145fe 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1681,6 +1681,22 @@ void parse_config_data(const char *config_source,
>          xlu_cfg_get_defbool(config, "vpt_align", &b_info->u.hvm.vpt_align, 0);
>          xlu_cfg_get_defbool(config, "apic", &b_info->apic, 0);
>  
> +        e = xlu_cfg_get_long(config, "assisted_xapic", &l , 0);
> +        if ((e == ESRCH && assisted_xapic != -1)) /* use global default if present */
> +            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, assisted_xapic);
> +        else if (!e)
> +            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, l);
> +        else
> +            exit(1);
> +
> +        e = xlu_cfg_get_long(config, "assisted_x2apic", &l, 0);
> +        if ((e == ESRCH && assisted_x2apic != -1)) /* use global default if present */
> +            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, assisted_x2apic);
> +        else if (!e)
> +            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, l);
> +        else
> +            exit(1);
> +
>          switch (xlu_cfg_get_list(config, "viridian",
>                                   &viridian, &num_viridian, 1))
>          {
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index a5048ed654..bcca0dc900 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -619,6 +619,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
>      bool hap = config->flags & XEN_DOMCTL_CDF_hap;
>      bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
> +    bool assisted_xapic = config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
> +    bool assisted_x2apic = config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
>      unsigned int max_vcpus;
>  
>      if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
> @@ -685,13 +687,31 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          }
>      }
>  
> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
> +    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED |
> +                                     XEN_X86_ASSISTED_XAPIC |
> +                                     XEN_X86_ASSISTED_X2APIC) )
>      {
>          dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
>                  config->arch.misc_flags);
>          return -EINVAL;
>      }
>  
> +    if ( (assisted_xapic || assisted_x2apic) && !hvm )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "Interrupt Controller Virtualization not supported for PV\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( (assisted_xapic && !assisted_xapic_available) ||
> +         (assisted_x2apic && !assisted_x2apic_available) )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "Hardware assisted x%sAPIC requested but not available\n",
> +                assisted_xapic && !assisted_xapic_available ? "" : "2");
> +        return -EINVAL;

I think for those two you could return -ENODEV if others agree.

> +    }
> +
>      return 0;
>  }
>  
> @@ -864,6 +884,12 @@ int arch_domain_create(struct domain *d,
>  
>      d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
>  
> +    d->arch.hvm.assisted_xapic =
> +        config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
> +
> +    d->arch.hvm.assisted_x2apic =
> +        config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
> +
>      return 0;
>  
>   fail:
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index 06831099ed..e4503a02a7 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -1157,6 +1157,10 @@ static int construct_vmcs(struct vcpu *v)
>          __vmwrite(PLE_WINDOW, ple_window);
>      }
>  
> +    if ( !has_assisted_xapic(v->domain) )
> +        v->arch.hvm.vmx.secondary_exec_control &=
> +            ~SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
> +
>      if ( cpu_has_vmx_secondary_exec_control )
>          __vmwrite(SECONDARY_VM_EXEC_CONTROL,
>                    v->arch.hvm.vmx.secondary_exec_control);
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index c075370f64..949ddd684c 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3344,16 +3344,11 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
>  
>  void vmx_vlapic_msr_changed(struct vcpu *v)
>  {
> -    int virtualize_x2apic_mode;
>      struct vlapic *vlapic = vcpu_vlapic(v);
>      unsigned int msr;
>  
> -    virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
> -                                cpu_has_vmx_virtual_intr_delivery) &&
> -                               cpu_has_vmx_virtualize_x2apic_mode );
> -
> -    if ( !cpu_has_vmx_virtualize_apic_accesses &&
> -         !virtualize_x2apic_mode )
> +    if ( !has_assisted_xapic(v->domain) &&
> +         !has_assisted_x2apic(v->domain) )
>          return;
>  
>      vmx_vmcs_enter(v);
> @@ -3363,7 +3358,7 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
>      if ( !vlapic_hw_disabled(vlapic) &&
>           (vlapic_base_address(vlapic) == APIC_DEFAULT_PHYS_BASE) )
>      {
> -        if ( virtualize_x2apic_mode && vlapic_x2apic_mode(vlapic) )
> +        if ( has_assisted_x2apic(v->domain) && vlapic_x2apic_mode(vlapic) )
>          {
>              v->arch.hvm.vmx.secondary_exec_control |=
>                  SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE;
> @@ -3384,7 +3379,7 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
>                  vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
>              }
>          }
> -        else
> +        else if ( has_assisted_xapic(v->domain) )
>              v->arch.hvm.vmx.secondary_exec_control |=
>                  SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
>      }
> diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> index 698455444e..92bf53483c 100644
> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -117,6 +117,12 @@ struct hvm_domain {
>  
>      bool                   is_s3_suspended;
>  
> +    /* xAPIC hardware assisted virtualization. */
> +    bool                   assisted_xapic;
> +
> +    /* x2APIC hardware assisted virtualization. */
> +    bool                   assisted_x2apic;
> +
>      /* hypervisor intercepted msix table */
>      struct list_head       msixtbl_list;
>  
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> index 9119aa8536..5b7d662ed7 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -220,6 +220,9 @@ void vmx_vmcs_reload(struct vcpu *v);
>  #define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000
>  extern u32 vmx_cpu_based_exec_control;
>  
> +#define has_assisted_xapic(d)   ((d)->arch.hvm.assisted_xapic)
> +#define has_assisted_x2apic(d)  ((d)->arch.hvm.assisted_x2apic)

Those macros should not be in an Intel specific header,
arch/x86/include/asm/hvm/domain.h is likely a better place.

> +
>  #define PIN_BASED_EXT_INTR_MASK         0x00000001
>  #define PIN_BASED_NMI_EXITING           0x00000008
>  #define PIN_BASED_VIRTUAL_NMIS          0x00000020
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index a2278d9499..a0c6b89a88 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1121,7 +1121,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>          if ( !is_hvm_domain(d) || subleaf != 0 )
>              break;
>  
> -        if ( cpu_has_vmx_apic_reg_virt )
> +        if ( cpu_has_vmx_apic_reg_virt &&
> +             has_assisted_xapic(d) )
>              res->a |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
>  
>          /*
> @@ -1130,9 +1131,9 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>           * and wrmsr in the guest will run without VMEXITs (see
>           * vmx_vlapic_msr_changed()).
>           */
> -        if ( cpu_has_vmx_virtualize_x2apic_mode &&
> -             cpu_has_vmx_apic_reg_virt &&
> -             cpu_has_vmx_virtual_intr_delivery )
> +        if ( cpu_has_vmx_apic_reg_virt &&
> +             cpu_has_vmx_virtual_intr_delivery &&
> +             has_assisted_x2apic(d) )

This will result in less code changes if you just replace
cpu_has_vmx_virtualize_x2apic_mode with has_assisted_x2apic(d).

Thanks, Roger.

