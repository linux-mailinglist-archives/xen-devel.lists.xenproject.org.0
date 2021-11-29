Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2C8461B1B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234659.407262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrii9-0000JN-RJ; Mon, 29 Nov 2021 15:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234659.407262; Mon, 29 Nov 2021 15:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrii9-0000Gf-NG; Mon, 29 Nov 2021 15:36:57 +0000
Received: by outflank-mailman (input) for mailman id 234659;
 Mon, 29 Nov 2021 15:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrihL-0003uH-UJ
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:36:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fa4ed5c-512a-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 16:36:04 +0100 (CET)
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
X-Inumbo-ID: 0fa4ed5c-512a-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=w+nGI4D8BYe2mv0mAWnC2fyTbsqQxVVOLXv6FnhZGaY=;
  b=I7r3EtMp+4C5XbriEDf5j+fuY4nO1Q8x+ZZx89TR5ujQPE43DWkezPcF
   dG34BbhyGgKsz3zwdJWEjIunm8+JYNRPtZNcJEjfnkNaW9uFbyOmzVhaz
   5usRZbRYkRE/3ewgKrQfvYK/QYENRSeuI+G0MOlZzA0rbgZc7ZConDFZF
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l+qnEdUAtumjhCUAk3D9Vd9FYt4sFYMWMIUEJcWo7f4jxCoo0IddUu0DKGYCUkPQPlUEqKiiSm
 ZDQati3Hp3aaq29TLSf8qa3q3a5I2W+DuedUecs5Y/SvDAiPQV0Vm1jqwd+qVL70o161/biCnL
 rDqFQAS923acnTFJ9plMDBToVWCvnYFBalnnIUXqnwbGSG/TaGoKYnLnk/AHx2sesC0Nm7SfOo
 olfRHdBCRuUvzsCRcMk+tex5ZEUmCAPLxe4YReOsFQVU5mulffFMOj+VYEpcFeGAdqciIXFRz4
 wngB9Mq18pGWQ2vm5vaQ7Z90
X-SBRS: 5.1
X-MesageID: 58333499
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6pV5RqwcC0bRyBNQcAN6t+fUwSrEfRIJ4+MujC+fZmUNrF6WrkUDz
 mQWD2iObPbZY2vxfdl1O43k9EIEuJ/cz9UxSApoqiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRo2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/Zy4
 8tIqKW7dQ4sHu7it9glCyIEOi4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIIh2xr2pEfdRrYT
 /sCbWE1ZhH4Wi1OMw8RFJMxp92HlmaqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19nEmCo
 Xnd13/kGRxcP9uaoRKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifimiGauVtRHM
 UsW9yEy668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT8xQWyGG0ZdzV9YdkG9+EZeQRy7
 QOgkIa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHFm3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEwHpU
 JsswZH2AAUy4XalznLlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hfKWazP
 BCJ4loBuPe/2UdGi4ctOepd7Oxwk8Dd+SnNDKiIPrKinLAsHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZPdw1XdiZiWsitwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg6AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:zgW96KoYZY2agqFobQG6VO8aV5uxL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSpQEIdxeOlNK1kJ
 0QCJSWa+eAfGSS7/yKmTVQeuxIqLLskNHK9JfjJjVWPHtXgslbnnlE422gYypLrWd9dP8E/M
 323Ls5m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 3+CNUbqFh5dL5gUUtMPpZzfSKJMB25ffu1ChPrHb3GLtBOB5ufke+93F0KjNvaDKDgiqFC3q
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="58333499"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jh3Fv2fN7LyzHngHBuoE7NGuIEIPg5dD/72H3gQNUfomw/6QC9WBlhzIhAhSHTuNruGs7eQ5kSKwXib6Zf+VynoXKp9++h7/wB1Y4Fi7sd9UKHxlJ0U5MFvpOevp26x6Bi8QlnqI0UP0EETVdODd/WQqr3CU2xohKKAncXzqdmHRPaVQrB1ueTDwbncTeaSt27DOmM8UlGxe10o2RoBXmI6MeAw8lRDwYXyv+Dkb+cLkpEJDHwKKPfcgldyeA2Df40pZkOKh4vSc3g699vQnYNafdfGwIS+OzmSuFsldXKVMmW3fxvW7ee0YN24sO3FRPFf0bhM1a159i6D/1i8gIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osW8TJUcE1u0NhcxaQgNVI7DKLIgKFg45KRen2zf/Xw=;
 b=AAbBoXBXKoMm+Z7x3o0X27htP5CaHFCYhbiu3IysHpOng61bD6u6cybDRO7kuRWZ0MRbKAQEEfKeQEtHGpqtpEQHPouIbbFhPqBjblG2x5Ql52YTjzL595rpn2zKEcpT9vzb7oBYPaTF4hHA/17BitO53V+X5biu5FthsvEZvfOBNaH6QBnawFmgXzJ5bidie2Cgvdbm+eXXNMsyrpvUqg2bnbgW3ygZh2pdzVCHF0A6BCfnEfIWWDAIFLXvjYds7Ki/ra8PQYSRl7TNl1Hit4UsgKAPb70uecf61j8kyn/M1/LQ7tS5xMowGQrCRxS7AzobQVy+X2QEwiBaEG1HMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osW8TJUcE1u0NhcxaQgNVI7DKLIgKFg45KRen2zf/Xw=;
 b=TO3ZNBo+3YTglm4yho6JlDJEqAzBIl5YOLdW7Ixsf/DtP77pAo9zQq4PXf3qF+MhHeSB/C2sbaEQ4Tq2qcSiiCCwf6H+rMTKE4R2SbHVti7+3FNhiv08dFiVldF71futF7DO+E/IoJvLavmq1UOG8r2B6Sxo8q5ryq3BT7ikVos=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>
Subject: [PATCH v5 11/12] libs/guest: (re)move xc_cpu_policy_apply_cpuid
Date: Mon, 29 Nov 2021 16:33:54 +0100
Message-ID: <20211129153355.60338-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129153355.60338-1-roger.pau@citrix.com>
References: <20211129153355.60338-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54774d59-5f4f-4564-9487-08d9b34df217
X-MS-TrafficTypeDiagnostic: DM6PR03MB5340:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5340CBBB9C9E8D29A62D45FB8F669@DM6PR03MB5340.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:272;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0aL/XQUHA6SoC/Fwq2M9XQlCxdsR4knasmg/jBH3ipQzJolgcGqi+gC76Vw1b906QGdLa4iEC9zTtE1iqKN+HQ/zndh8DZvH09sbU3siiji1Juo8yY/dwIBtOBwgUlxHQRiMgJIbc2vTA/1e7YElvMZvd4506wZ4fFq3thO0M4ljohXfTOvsw7OD4GY59wJwEwrXmQ3eiV3J5nwFl90urdnaG/Dj+hpR7FsO/CIShNPennAzLmzdOnwVV+GuYIwmxdrkEbncOIiUyeycKCUml4lOt5W58HyWcm7aLEYDMWQtWcA3pTM3YpuePkNkqGyaEhTDax3SjFMzttjU7WdKcDAPZD4MliT6/WIYCXQ0zkA9FkNUQ23a3k0q9Zz2Po34E/SL1h32z955Y6Ob80tDsyWT0UFotllVjwJhUg2iaTLQ+C3SECARmQJ25R0hyASEK+182R061T8ms585xtkMd5wF+1V1OlhES8t8gDPhgmJBkHVdryUaQZS26OR19w5eUqqJgbR4Q+sBRplJaxQTBQQ8w+HhnHLcLf49/V76QEO+P4fAPAzpVxzCaDKEMi7JmTxGeths6h8k0msNXBcRUPX/IitUlla5+N/17CX4UJQ6XbOZuJApFFy3ZlzaErBdnqDFM6WEA7FP9BxKnaU+Fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(30864003)(82960400001)(66946007)(86362001)(1076003)(508600001)(5660300002)(8676002)(6486002)(316002)(38100700002)(6496006)(26005)(83380400001)(6916009)(66476007)(2906002)(66556008)(2616005)(956004)(8936002)(54906003)(186003)(36756003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0hGMzBpdUYwdkJBRDkyRGxWVVorUXJIVW8wd1dYMXVjQXV2K1Bhd2Y2MGRG?=
 =?utf-8?B?dlV6dnN0T1cxYnAzWUF0YWZta01hNFNJQjAxVFlxdGh3MHlncXdmczIxTUxX?=
 =?utf-8?B?VnUyVjY1bmsvMHgvZ3hOQzlwVlFwL0FlOEoyaUtXNUJvdTNwRkpyZWw0cGQ1?=
 =?utf-8?B?RXVVRjhWbklPM1R5bUlSSjBIeERNcW5OV09FRUw0NHhCQWx0elNjU014WDlE?=
 =?utf-8?B?RjZ4ZzhzbE8ydE8zb2JOSUFNZWhDOU1aOTA3WGxONzZPRFErVmN2Y0IxT3Q1?=
 =?utf-8?B?OTlSSHpBZjUwdFRxSkk4STk5UDB1UW5KaC9QSHpSVjlGSzM0WWxZVkxRZkZ4?=
 =?utf-8?B?QUZmdlNpT2UwQlNQRHV3bFpVclpOTjhSdlg2YnNUbkdiaXBpakZtbkUramc3?=
 =?utf-8?B?RHZkOXFrRTdHZkJEZzhxelBtRXRoMTVlTzhrTzRHUmtxdE1oZWY1MGlZQjRP?=
 =?utf-8?B?QnFIQUM3RW14RytmMGQrY2ErMUNyT1dkdHk3NjgyeVR4SkRyU0ZtQ1praEV3?=
 =?utf-8?B?b0dpMVhyOER2UDJLWnBKZDRyM0xPUHRQU092dGlJdEZHTXNaQ21YQU5kRTR6?=
 =?utf-8?B?ckV5YW1rS3N0LzNmY01TVk9oYzZPbU5pSW9pVnQrR1hWNUJ1cnRxQ0EzR0xB?=
 =?utf-8?B?NTNxMFV2d05ncHVmK3NkeTVmejdvRDBocGdoc1VhSWU5emdhdEp2NFpDYnNa?=
 =?utf-8?B?SWhNU1UrUVBVMktWK1NCSkVyOFl3VHpsV0dxSFdkMHpNaXpKZ1JicExiUUla?=
 =?utf-8?B?WnRqVWNVWXRtbU5BOVpVWWFTMWJ2aUt3dWZmUEVnWVc4dUIvL1dnUzN4QkJ6?=
 =?utf-8?B?V2ZPUHh4bTYrOVNROVgxRS9XQXJ4aGZ3cjlQQTdBeVVYNEdQVHlFOU9IaHFt?=
 =?utf-8?B?K3NxK3JMM3pSSW85YlVjZlVwQ01IZkR2SWxLV1EzQ0NPRjZzd1FGa0RnQjBG?=
 =?utf-8?B?OTFQbStPWCtuUTlQVDNRZ2pmZ1VFcEJ2VTZzZFRPZ0FpWHJ6MzJZa3hHOERj?=
 =?utf-8?B?MWwzUk9CWFR5UjdQVFY1aVhndkkxS0JndmZCVEhWeU1TUFlWQzV5ZFhaVkF5?=
 =?utf-8?B?NEh5b3NOTS9TYnJpYlNVSjdRQWpBbGU4aXhKQ3V1c3FuejJoZGRvVU1PTzRY?=
 =?utf-8?B?ZDk5c3pQK2ZSODdUdGtjQ1ZXbHo0Mk5aZVFSdm0xNFhlUmU2RW5xa1Ryb1pO?=
 =?utf-8?B?cXhFM1F6a3QrMVlzcWxoaWtxaW9zdWFlUDRVcGt3SVpNRlJhY1VqRUh2cFRL?=
 =?utf-8?B?RWxEc1NxTlh5Y1BwcS92SG9XcENUZU9yUWJzUyszN1A2aVdKc2RkMHJUMEJ1?=
 =?utf-8?B?TERSVHU0NSt0dWN4OFN2SzRRZThGMjBGNFlrbWZHSThWRzhwU3k2NHcxblk0?=
 =?utf-8?B?UXNla3pLVXdIZkdoUnhCT25LcGJlZ0x4YlZhanJDYXd4alZkVklRWmdnTDZr?=
 =?utf-8?B?RklwNnIrTlI0NjJ2WW14ZlFtVXRxeUVaRnVVdW5NVDJ0V08yMFZsKzhPeTRY?=
 =?utf-8?B?RGw0bW8xQ1d5V05NS3JtUjBGbWpQdXI1d1haSE04M2V6aVp6VEhDa0RvWDBy?=
 =?utf-8?B?Zk91TE9QZEtvS3lXYVlIelI4K0tRc0p2c0E3MUVOZHU4ZkxrQmlqZ1pPVDUr?=
 =?utf-8?B?SkRLdWVQWTVjSy9QUG9vL1FER29NVWEzVmZDa3hhS2JWVGFsN2t6TGl0NG9T?=
 =?utf-8?B?UGtrSkdqM3FqelVxd0gvSlhJc09weXBUTXVTdjM0dTVNa0xQYXI3Sy80TmJQ?=
 =?utf-8?B?cEhwanJFellMTVZXSm14MTBiaHRkTzdlWjlQNWFEZUVET3pnekZ2NERTQS9D?=
 =?utf-8?B?WUNFWW16RFh4cVhxNUc2cE03cWRxZU0yOGlFT21NVG9zaXEyYzRSVnFGSmhy?=
 =?utf-8?B?eFNaQm9HcUNmcVdXWlJQYWQxY1RzS0JNMi9TMkwvdGcrRmFJRzFhTkt6V0w1?=
 =?utf-8?B?RGlDcDlqa1IvMmpKaVM1aHFzTVlKZjJ3K2lQUzRtbFZwOW5FaEtrV3lHRHR5?=
 =?utf-8?B?NXJJY2lFN1NyZWFRS0ZQNmtOMi9zQVZUM2FVcHVOZC8yTVNnaVlZdG1TZDh5?=
 =?utf-8?B?Wk5jd1pQeFl4YlVIcmVxY3cxTUpha3p2TStzL1RYUHpyM3hWYkVVaFJmTnUw?=
 =?utf-8?B?bHdVbWE0ek1HazREM25LN3ZtQlVUQUFGZlYxcVFMUThYdFM4Z00xVGtWQzlT?=
 =?utf-8?Q?SR9Q9wFnqiKPdnTELCBAiEc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54774d59-5f4f-4564-9487-08d9b34df217
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:36:00.7072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZPPtT6iUwXi6JSRh1WlxHIgDiFtKNmdz2vi8IAYPDvh0Ice7d//nl3hd2W2gFKR6tXXy8PmnMO8R4ncmzOmKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-OriginatorOrg: citrix.com

Move the logic from xc_cpu_policy_apply_cpuid into libxl, now that the
xc_cpu_policy_* helpers allow modifying a cpu policy. By moving such
parsing into libxl directly we can get rid of xc_xend_cpuid, as libxl
will now implement it's own private type for storing CPUID
information, which currently matches xc_xend_cpuid.

Note the function logic is moved as-is, but requires adapting to the
libxl coding style.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v2:
 - Use LOG*D.
 - Pass a gc to apply_policy.
 - Use 'r' for libxc return values.
---
 tools/include/libxl.h             |   6 +-
 tools/include/xenctrl.h           |  26 ------
 tools/include/xenguest.h          |   4 -
 tools/libs/guest/xg_cpuid_x86.c   | 125 --------------------------
 tools/libs/light/libxl_cpuid.c    | 142 ++++++++++++++++++++++++++++--
 tools/libs/light/libxl_internal.h |  26 ++++++
 6 files changed, 165 insertions(+), 164 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2bbbd21f0b..8a8032ba25 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1420,10 +1420,10 @@ void libxl_bitmap_init(libxl_bitmap *map);
 void libxl_bitmap_dispose(libxl_bitmap *map);
 
 /*
- * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
- * libxc may not make assumptions about xc_xend_cpuid.
+ * libxl_cpuid_policy is opaque in the libxl ABI. Users of libxl may not make
+ * assumptions about libxl__cpuid_policy.
  */
-typedef struct xc_xend_cpuid libxl_cpuid_policy;
+typedef struct libxl__cpuid_policy libxl_cpuid_policy;
 typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *l);
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 745d67c970..79169f8ace 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1803,32 +1803,6 @@ int xc_domain_debug_control(xc_interface *xch,
 
 #if defined(__i386__) || defined(__x86_64__)
 
-/*
- * CPUID policy data, expressed in the legacy XEND format.
- *
- * Policy is an array of strings, 32 chars long:
- *   policy[0] = eax
- *   policy[1] = ebx
- *   policy[2] = ecx
- *   policy[3] = edx
- *
- * The format of the string is the following:
- *   '1' -> force to 1
- *   '0' -> force to 0
- *   'x' -> we don't care (use default)
- *   'k' -> pass through host value
- *   's' -> legacy alias for 'k'
- */
-struct xc_xend_cpuid {
-    union {
-        struct {
-            uint32_t leaf, subleaf;
-        };
-        uint32_t input[2];
-    };
-    char *policy[4];
-};
-
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 8f05d8aa66..3462d27516 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -825,10 +825,6 @@ int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
                                   bool hvm);
 
-/* Apply an xc_xend_cpuid object to the policy. */
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
-                              const struct xc_xend_cpuid *cpuid, bool hvm);
-
 /* Apply a featureset to the policy. */
 int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
                                    const uint32_t *featureset,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index f4ed632d60..7ce0a08580 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -254,131 +254,6 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
-                              const struct xc_xend_cpuid *cpuid, bool hvm)
-{
-    int rc;
-    xc_cpu_policy_t *host = NULL, *def = NULL;
-
-    host = xc_cpu_policy_init();
-    def = xc_cpu_policy_init();
-    if ( !host || !def )
-    {
-        PERROR("Failed to init policies");
-        rc = -ENOMEM;
-        goto out;
-    }
-
-    /* Get the domain type's default policy. */
-    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                                  def);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
-        goto out;
-    }
-
-    /* Get the host policy. */
-    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
-    if ( rc )
-    {
-        PERROR("Failed to obtain host policy");
-        goto out;
-    }
-
-    rc = -EINVAL;
-    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
-    {
-        xen_cpuid_leaf_t cur_leaf;
-        xen_cpuid_leaf_t def_leaf;
-        xen_cpuid_leaf_t host_leaf;
-
-        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
-                                     &cur_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get current policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-        rc = xc_cpu_policy_get_cpuid(xch, def, cpuid->leaf, cpuid->subleaf,
-                                     &def_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get def policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
-                                     &host_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get host policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-
-        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
-        {
-            uint32_t *cur_reg = &cur_leaf.a + i;
-            const uint32_t *def_reg = &def_leaf.a + i;
-            const uint32_t *host_reg = &host_leaf.a + i;
-
-            if ( cpuid->policy[i] == NULL )
-                continue;
-
-            for ( unsigned int j = 0; j < 32; j++ )
-            {
-                bool val;
-
-                switch ( cpuid->policy[i][j] )
-                {
-                case '1':
-                    val = true;
-                    break;
-
-                case '0':
-                    val = false;
-                    break;
-
-                case 'x':
-                    val = test_bit(31 - j, def_reg);
-                    break;
-
-                case 'k':
-                case 's':
-                    val = test_bit(31 - j, host_reg);
-                    break;
-
-                default:
-                    ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          cpuid->policy[i][j], i, cpuid->policy[i]);
-                    goto out;
-                }
-
-                clear_bit(31 - j, cur_reg);
-                if ( val )
-                    set_bit(31 - j, cur_reg);
-            }
-        }
-
-        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
-        if ( rc )
-        {
-            PERROR("Failed to set policy leaf %#x subleaf %#x",
-                   cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-    }
-
- out:
-    xc_cpu_policy_destroy(def);
-    xc_cpu_policy_destroy(host);
-
-    return rc;
-}
-
 xc_cpu_policy_t *xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 07d445d9f9..bf710ba196 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -309,7 +309,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
     char *sep, *val, *endptr;
     int i;
     const struct cpuid_flags *flag;
-    struct xc_xend_cpuid *entry;
+    struct libxl__cpuid_policy *entry;
     unsigned long num;
     char flags[33], *resstr;
 
@@ -387,7 +387,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     char *endptr;
     unsigned long value;
     uint32_t leaf, subleaf = XEN_CPUID_INPUT_UNUSED;
-    struct xc_xend_cpuid *entry;
+    struct libxl__cpuid_policy *entry;
 
     /* parse the leaf number */
     value = strtoul(str, &endptr, 0);
@@ -437,6 +437,137 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
+static int apply_cpuid(libxl__gc *gc, xc_cpu_policy_t *policy,
+                       libxl_cpuid_policy_list cpuid, bool hvm, domid_t domid)
+{
+    int r, rc = 0;
+    xc_cpu_policy_t *host = NULL, *def = NULL;
+
+    host = xc_cpu_policy_init();
+    def = xc_cpu_policy_init();
+    if (!host || !def) {
+        LOGD(ERROR, domid, "Failed to init policies");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the domain type's default policy. */
+    r = xc_cpu_policy_get_system(CTX->xch,
+                                 hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                     : XEN_SYSCTL_cpu_policy_pv_default,
+                                 def);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to obtain %s def policy",
+              hvm ? "hvm" : "pv");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the host policy. */
+    r = xc_cpu_policy_get_system(CTX->xch, XEN_SYSCTL_cpu_policy_host, host);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to obtain host policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    for (; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid) {
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t def_leaf;
+        xen_cpuid_leaf_t host_leaf;
+
+        r = xc_cpu_policy_get_cpuid(CTX->xch, policy, cpuid->leaf,
+                                    cpuid->subleaf, &cur_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            r = ERROR_FAIL;
+            goto out;
+        }
+        r = xc_cpu_policy_get_cpuid(CTX->xch, def, cpuid->leaf, cpuid->subleaf,
+                                    &def_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get def policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+        r = xc_cpu_policy_get_cpuid(CTX->xch, host, cpuid->leaf,
+                                    cpuid->subleaf, &host_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        for (unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++) {
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *def_reg = &def_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
+
+            if (cpuid->policy[i] == NULL)
+                continue;
+
+#define test_bit(i, r) !!(*(r) & (1u << (i)))
+#define set_bit(i, r) (*(r) |= (1u << (i)))
+#define clear_bit(i, r)  (*(r) &= ~(1u << (i)))
+            for (unsigned int j = 0; j < 32; j++) {
+                bool val;
+
+                switch (cpuid->policy[i][j]) {
+                case '1':
+                    val = true;
+                    break;
+
+                case '0':
+                    val = false;
+                    break;
+
+                case 'x':
+                    val = test_bit(31 - j, def_reg);
+                    break;
+
+                case 'k':
+                case 's':
+                    val = test_bit(31 - j, host_reg);
+                    break;
+
+                default:
+                    LOGD(ERROR, domid,
+                         "Bad character '%c' in policy[%d] string '%s'",
+                         cpuid->policy[i][j], i, cpuid->policy[i]);
+                    rc = ERROR_FAIL;
+                    goto out;
+                }
+
+                clear_bit(31 - j, cur_reg);
+                if (val)
+                    set_bit(31 - j, cur_reg);
+            }
+#undef clear_bit
+#undef set_bit
+#undef test_bit
+        }
+
+        r = xc_cpu_policy_update_cpuid(CTX->xch, policy, &cur_leaf, 1);
+        if (r) {
+            LOGED(ERROR, domid, "Failed to set policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+ out:
+    xc_cpu_policy_destroy(def);
+    xc_cpu_policy_destroy(host);
+    return rc;
+}
+
 int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
@@ -552,10 +683,9 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
     }
 
     /* Apply the bits from info->cpuid if any. */
-    r = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
-    if (r) {
-        LOGEVD(ERROR, domid, -r, "Failed to apply CPUID changes");
-        rc = ERROR_FAIL;
+    rc = apply_cpuid(gc, policy, info->cpuid, hvm, domid);
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to apply CPUID changes");
         goto out;
     }
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 0b4671318c..7ab5247329 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2060,6 +2060,32 @@ typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
 _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                                     libxl__gen_json_callback gen, void *p);
 
+/*
+ * CPUID policy data, expressed in the internal libxl format.
+ *
+ * Policy is an array of strings, 32 chars long:
+ *   policy[0] = eax
+ *   policy[1] = ebx
+ *   policy[2] = ecx
+ *   policy[3] = edx
+ *
+ * The format of the string is the following:
+ *   '1' -> force to 1
+ *   '0' -> force to 0
+ *   'x' -> we don't care (use default)
+ *   'k' -> pass through host value
+ *   's' -> legacy alias for 'k'
+ */
+struct libxl__cpuid_policy {
+    union {
+        struct {
+            uint32_t leaf, subleaf;
+        };
+        uint32_t input[2];
+    };
+    char *policy[4];
+};
+
 _hidden int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
                                 libxl_domain_build_info *info);
 
-- 
2.33.0


