Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1F572CE18
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 20:26:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547404.854778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8mEh-0002by-1M; Mon, 12 Jun 2023 18:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547404.854778; Mon, 12 Jun 2023 18:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8mEg-0002ZO-UJ; Mon, 12 Jun 2023 18:25:50 +0000
Received: by outflank-mailman (input) for mailman id 547404;
 Mon, 12 Jun 2023 18:25:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abQ6=CA=citrix.com=prvs=520cb9a4c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q8mEe-0002ZI-Lq
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 18:25:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a23a24c-094e-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 20:25:47 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jun 2023 14:25:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6250.namprd03.prod.outlook.com (2603:10b6:510:e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 18:25:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 18:25:31 +0000
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
X-Inumbo-ID: 8a23a24c-094e-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686594347;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7oGESoOsKexZIw0TPWZeEzWwlk8CLqMzMVlqyN+vYBI=;
  b=YRXsqA5BGs7d/fF32euti6L0OGjnvP+H1HDzEJMw5Xk4aP4dkuYbELCW
   0NoUJAGII35eCpQiOSB/rnxkL42DFjpKCIOaFpBlBAKgpigmwvy6CvdbJ
   I4wA/THyHN0Ir+vGD+8NTzbBFBrQH9CfYu4xfO0r6on+6O+g5nHC8OXvR
   Q=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 111831671
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RWVngammkw/ZsgO8WG3klefo5gxBJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYXG+DbPfba2P9fd4kOYS2p0oC7ZfQzN5lSAo/ri8wRSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgV5QWGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aMiB2svdz29vcfswKqUU6pLtJ08JuC+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeTorac03wT7Kmo7IRoXSnWYrqGA1WGHYI5iJ
 2oV2gEBlP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xD2wJTDdHZMYh8tE/QTgn1
 FihlNfuGDApu7qQIVqC8p+EoDX0PjIaRUcSaClBQQYb7t3LpIAokgmJXttlCLSyjND+BXf32
 T/ikcQlr7AajMpO3aPk+1nC2mqovsKQFl5z4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6zt3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:GD+seKoWuT3WRDgsT7htDvMaV5oReYIsimQD101hICG9JPbo8P
 xG+85rtiMc6QxwZJhOo7u90cW7K080lqQV3WByB9iftVLdyQ+VxehZhOPfKlvbdhEWndQy6U
 4PScRD4HKbNykdsS5XijPIcerJYbO8gcWVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3AVwZBaWmgaTgEFp5r5r9BJtavI+3XOSLn4yzyOmK?=
 =?us-ascii?q?GM0MzSKW6UBy3yvp7meM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A1NoFLg3+CV9bJm8SA1sGElFN/DUjyqOvF24uns0?=
 =?us-ascii?q?/5Oa9DnBNNxGcrB+Ye9py?=
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="111831671"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEl/6EZezP0mz5Cc1ru7FfIA//xlKN65UKLgjRwgAEvohls6OYCzEbQrFeRStOWdGFfB3OmwOqkiC4WjH0TjA2nG62UkyoSZlauE0ivPfdCi9ZncYrZ3mrFk1esTkqopPA43DbSLtkF7YV3nvlkCzzKb4PxyhVDnNNMFsyt3WywwcQXNaXkrzABxjhewIt01ShLyeu9nBQkGezfthRxOL5lbXH4XNk+8wXTWBAyZZSRxBDnoPsXfkCKQnvb2puQ5qgAusD5ELMZLb36Ge+45oXVTpen+L/nrAutKFsZkcc73jvuiKR5yzCBtL6xTltjz5fRUV1XBILVBd8aA08J7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKaei8jJbFPtsU5mX37+5Or1yZTyrZayO/kjmCynmNQ=;
 b=RrW3VtmhVrOb5cbR/Hw6z8jAFre9AnfIbuYk1YMvv/sPMyPij8eBYt6vAHs7Pv2yuBBlCjqiIsx9W3HtZhyRM0X2DOGuGD6/rZNiRYjDzbgyaE+Eb3V0UB3EHah8mW+aMH/2zlhDi+9WTwjKLij4dxk0i9KX6Jwq+WziaDDO+Jv63U3q0Br2cKO2hNgBLmrFnJGM48bgsmMG3xD1a7D8fV+zFhItBkzwIgleRw5H7gULNDoSizuy0Wyd0wEUmVbspMcE9hVQtKVYC80kvpBO9xYlzLdPUy4EOyYmuSfZsfOrg4cL1bPTut5narOHJa/thQu8xblVCEmI6JhcFYWH5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKaei8jJbFPtsU5mX37+5Or1yZTyrZayO/kjmCynmNQ=;
 b=QIrsaFkEknnOCXMWUwr9qSZQsi3EPtR9K66r9GMVM837xLhVicUUaP/cDNiPvBOO+vQ3/g6Iz72wWh02Daqe+2fQSiGDeQIefPMVXksCuy79yarjjwLaV4LMh7LpO/nDUUM71L/l5nG9Qp/vqJxDOuZ+DpeAlT99EXB7LwcEX9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f1c02253-5f49-eade-97f5-cdb188e3c327@citrix.com>
Date: Mon, 12 Jun 2023 19:25:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/4] x86: Read MSR_ARCH_CAPS after
 early_microcode_init()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-3-alejandro.vallejo@cloud.com>
 <6ee9e687-b8ac-adfb-552e-522a21e128de@suse.com>
In-Reply-To: <6ee9e687-b8ac-adfb-552e-522a21e128de@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0161.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e230bc-69a1-423c-28fa-08db6b72674b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HeQM2WPCeBgo/6ouUqYx14UfRGy2lrdZ2JFpC8XsHGqBfgHuFKT5tEl8RVm3PRknkKVqzl5COK/7lImat2144k13WQCroH7Nav2XjCsNix0iNN+5O/7KZqalEFQvflXlDXuWRsC8RaUuZhiOouXq+PnYz4vrT2X8YTqmXEcb4mi+YriHi+1eADxPFe336IANnK/ppK6wvljZfT3Y/4DfAi/4ZTOrzC3vpau636FUKzIuz9YpQdiD4WWd2c1mFC/q2U8LGDqn9QBeio/SKpkZygCnHotsRxJjTbod8YtxXtdaBLt8B6uU4nJRJtShp+vhF2mkAV/Ow76isL3TqmrMPjhN6E2SPZnXaCeRdiR8VhKXrhSnF/Ne6vfU+B89UcEN2KEtx6b/dg357QqJ8kIEmUuqm9d1Lyz9hWJnsfyc95BvgYfQ6/xkRqnbnaKqgQilEzQD2roNxq2cipciMyVJce4c6QcbQOuAoe+JTBejJRlguRppJwu+glbDawDvZttJf3/C28eoMKosaNWYaI9UMCp2nZcb7riaPC1F08hZNroGjgB8xd4sPAzMN4fKnb5d7heSixNOACwMoHEcBsogS0UVfYWv8KcKsMJnm6oFX2Eeovl/4WIhccbgJHD7ZWsV4anKJlU5YsM+Akkhb8Yv3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(2616005)(83380400001)(82960400001)(31696002)(86362001)(36756003)(38100700002)(478600001)(110136005)(54906003)(4326008)(6666004)(6486002)(8936002)(8676002)(2906002)(5660300002)(66556008)(66946007)(66476007)(31686004)(41300700001)(316002)(53546011)(186003)(6512007)(6506007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUc2OEdjNnNzTTI1R2k1ck5ra1NxWERPR204Um9VU09vdndTL1NWVy84MkZ1?=
 =?utf-8?B?TFRtWTArQnFTeVE3V2I5MUlteHpLbDJ4Q3B0RWE1SHlsM3VSRitpNFpMRnN2?=
 =?utf-8?B?TE4xQ1FjNVFiQVRzYm9yT3A3aFArVVZLQ3FIK3VSUXRJVzlpV29YT2hzRHFp?=
 =?utf-8?B?aTZGTVZLSU11bGxMaEZKaUF5SjJkcTM5YkVCVlJ4L0RjS2V4bkNwZGZ5K01G?=
 =?utf-8?B?a3BDQXFUdnRwdmdhTTJBQzdHQWxyanloem8vTmNlYkpKWTRDTXIrc3JLekpo?=
 =?utf-8?B?TXdJL1B2VzZ4aTBLeFNKRk5meUpCSndCUVNWeFl3OU0wS0o3THdzNWtZYXJL?=
 =?utf-8?B?RzdJL0doK3lTUUh6ZWkvV1RoazliVnpRZmxsSExhcnZiK0xBWkI5aHpCZ3pa?=
 =?utf-8?B?eDZTNUxUeWNLSDhCeDRCUmQ0bW1mREo5dElzNnFhQnJIdWFoOHVoMGE1Q2lW?=
 =?utf-8?B?cHBVejNNUStWWkNLWkFEZFcyQmpoY09KMlM4SStaVXVKcVE3WjFXLzBtNURP?=
 =?utf-8?B?cTVtajMrNnFoOUVwOFd5M2lQUy9rQlBNRWNJRlhNYXNXNUF2YW9aYmJTbTFF?=
 =?utf-8?B?RXZCNVNhcnFsT2U5ZFZkT0ZZNUgyZVowMXRJc1hQa1FPcVFOQ2FLSWRUL3hV?=
 =?utf-8?B?K2pEaGdWcXVTUkk2ODlzcEFSd28yM0lpTDYyWnBUVmNJR01LSUpERDIySzFH?=
 =?utf-8?B?NzFLbm4rcWliZUtFS3FGVW1zU25QRENUTDJJcjRIVklFNENJY3BMS01kYkV5?=
 =?utf-8?B?WU5wTU5CcE9ieUpsMkpVcisyeUtjbm1SZkxvMTE4V3RoMWlPWGlZWGZ4RzdZ?=
 =?utf-8?B?S0RDWXJZVXFuRVpyNC9JMDQ5Q0crU2xiL0FTNWxPWFNxOTdSN0E5Nnh5UnVR?=
 =?utf-8?B?cmdkaVAvbWx2ZUh4eHU5SVMrcE52V0tBRDMyZ0tGOEk2T3A0aWk2SnNuTDlx?=
 =?utf-8?B?ZCt6bkNvZG1ONzloUmJnQ09OcThSOW4xV09jejlHRHlMWkFwMWFtL21oeFNK?=
 =?utf-8?B?OFphNVozVjY0QnVYdG1tYkE5RmJvRmZsRWU3UWI1R2pqaHROK0Q0ckNyS1JQ?=
 =?utf-8?B?MGtTd0tQV0lNbWQ4SmVTTnBYK2szdHREN0xXaGZhQUJIZzlPZkM5WHgwa3hr?=
 =?utf-8?B?cmNSek9CKzltRWJmcHRZVG04VTZ3ellUeklKMDk0b2tkOUZIbG8yQUhpNG9p?=
 =?utf-8?B?OVh2Y016ajZhYzVwMU4wNThHZzAyWHhENTJpVmJib25XUUJZOHBaTVB6ajly?=
 =?utf-8?B?ZDVQeFo0dmR2VlYyR2Rpa1V5LzJ3WUxwelZ2bVRvNFY5ZXdieW9DMlcvZmlV?=
 =?utf-8?B?b2ZEZ2ZaSmQ4dzhxMFFuaGxaTytBTXJpd0VwaDhDaWtJdURyWk5FZEluTDRL?=
 =?utf-8?B?TlhIOHNkQVJFZDFIb092YnZ6eElZOHROcE02RklFY2ZhZXhnR0c3V2hkc1JX?=
 =?utf-8?B?ZjBOSHBHeU1sM2VIT0t2QWNEdGp5YjAxNk1PVGJFcnAveW95Tzg3QjMzaGRB?=
 =?utf-8?B?VHFPREZYMkh4dDlOSjVOREpCeTlsS3pleHBvNkp3NlZsbXArT2FZSTNSMEpS?=
 =?utf-8?B?QjUvRzZzanJiVTRRUC9rQ2JFUDRnY1FIMnJTTzBlWWZVdnpkUC9tampGRmls?=
 =?utf-8?B?Mk9pZ2FiSmFVd3NkTmZBWTlNWXpqcVNqMDZrU3Y2TUg4ZFBwNWJjNWRSTk9E?=
 =?utf-8?B?c2h6d3dwaWxJVURRY2IvcUhNRzIxQjRpdEZLbm90d2ZBS3ZaeDQrRFJTcjE1?=
 =?utf-8?B?M0plejZReFFrazRGQlNTQ3NFbnZTOVRPSnNPVU14RjlOR1U5NXBjUmkxdkY0?=
 =?utf-8?B?YkF5U0VHaUt1SGg0L0syNkcvRkYwZjVnQjJXam1xVHppdGZyOWR5S01Ubk1o?=
 =?utf-8?B?Q2JTYmJ3cnZnaWhaNjhQaVlzUjFUT1I1YkRkZXpyZThDSEtmdnpLcDRUVzRu?=
 =?utf-8?B?a2ppaEJyMkdnKy9KbHZ1N2ZoTXFMSk5yckcwaFJUWnlTeUtOaTJqSnVqaGc5?=
 =?utf-8?B?VmRCc1VEWDJaenBSOHJhL0xQVmpYWFpPK2hxZThuVXRPb0Y0WEpuT2V2aXNa?=
 =?utf-8?B?Z05HMFF1cHlRQXJDUWdZb0NRMXZmaC9JRlJJUVpWQ0F3TnZabUV3UDJoc1Ru?=
 =?utf-8?B?bWp5Z3daZENhRUJqcUJOV1ZtdDROajRLdEphYU9pekp2R3FZenlpUitoYysz?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OWsdlh0jrjnwFgchhsynACF/wcSumcdowmk21GC/dV+IYFXTw9TyItHEeo/3NW/lllBGYlpWy79ulxN+Uyxwk1xIgbxHOeQUcQtyR62tAK7LoNp5wnYn34NUIR2ujV4BcVkon0syrB7yPasBbORZeOHyROrZFizHlhsSt/291gjQp1n4Gxh+bnJLSiP67p3dPcPc+zky66Y3gLtGNMaiJnyHUPU3PN8f3YyS61Ut81sqc+lNg35LrrIG4GFGCcXsC5IuJs5LtmssEwDdU56yXmybnRoBMktnRuUGNSuPCOP+k5Z+y+k6GB1ZMjO7L7Eo8Y0FIQtaKv2rh/AH+ChiQQ/eX1VQhp2XRBpr4jtljxTX/eJDB+FNtFDXNWxeoiIQ2f3w62voI0kZoEwbpWA4mj/ZqSVOTIQ/ea3wbnACfUeDaP1dWrmIHb4P5rhRQK/LLxya/MiKODNXFhB3d91/v1DYUtKLRcc2jVd6GPie4nJDt9hrP2g35SUrYzlPMN72eGsva5NAB+eyG+Z72Jk6nk9arUrZPptvD9t9c4/sLaYTD02ItVTYFpZUtCLnBnhvBfeFIEf2FFlumy7pCQ9koTUL5LtHfb+k/TLOQeMbSrN4HLsvxk70KI4qi4/FTOKwM7iPdBhr4nerNwfeAVA2e5i+Hw5LHx9KjqHs9RmXKCZ76Kv5zxPaq+8GFl2HLQB9nwK0B7uFIdQxbxMTX8bjLdcWBkQsADiA6q8rKcJv+cU8tqqS9PcH2TMIdtpYdQ+wkkmlQGmpqB1YVVUr4knXDc1kIqiKZ8sJ3/YKxjuORAU06TLcHXnouf71F6HZH5UCtkqFi7c/F+u4ahO5NjMl2fC8a//qOqE6p7Q+bWfxtYE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e230bc-69a1-423c-28fa-08db6b72674b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 18:25:30.9996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EV8uxjYUsBrqGtKCTrEN+j/6v8KXJW1IGyAsgFqsu+akahADWGCa2sH3CeiAJwLikMnZnZ9epQpTbkdTFZc4JJaHj7XpKZcYINtem2FEA/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6250

On 12/06/2023 4:46 pm, Jan Beulich wrote:
> On 05.06.2023 19:08, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -840,6 +840,15 @@ static int __init early_microcode_update_cpu(void)
>>      return microcode_update_cpu(patch);
>>  }
>>  
>> +static void __init early_read_cpuid_7d0(void)
>> +{
>> +    boot_cpu_data.cpuid_level = cpuid_eax(0);
> As per above I don't think this is needed.
>
>> +    if ( boot_cpu_data.cpuid_level >= 7 )
>> +        boot_cpu_data.x86_capability[FEATURESET_7d0]
>> +            = cpuid_count_edx(7, 0);
> This is actually filled in early_cpu_init() as well, so doesn't need
> re-doing here unless because of a suspected change to the value (but
> then other CPUID output may have changed, too).

Hmm, yes.  I suspect that is due to the CET series (which needed to know
7d0 much earlier than previously), and me forgetting to clean up tsx_init().

>  At which point ...
>
>> @@ -878,5 +887,17 @@ int __init early_microcode_init(unsigned long *module_map,
>>      if ( ucode_mod.mod_end || ucode_blob.size )
>>          rc = early_microcode_update_cpu();
>>  
>> +    early_read_cpuid_7d0();
>> +
>> +    /*
>> +     * tsx_init() needs MSR_ARCH_CAPS, but it runs before identify_cpu()
>> +     * populates boot_cpu_data, so we read it here to centralize early
>> +     * CPUID/MSR reads in the same place.
>> +     */
>> +    if ( cpu_has_arch_caps )
>> +        rdmsr(MSR_ARCH_CAPABILITIES,
>> +              boot_cpu_data.x86_capability[FEATURESET_m10Al],
>> +              boot_cpu_data.x86_capability[FEATURESET_m10Ah]);
> ... "centralize" aspect goes away, and hence the comment needs adjusting.

I find it weird splitting apart the various reads into x86_capability[],
but in light of the feedback, only the rdmsr() needs to stay.

>
>> --- a/xen/arch/x86/tsx.c
>> +++ b/xen/arch/x86/tsx.c
>> @@ -39,9 +39,9 @@ void tsx_init(void)
>>      static bool __read_mostly once;
>>  
>>      /*
>> -     * This function is first called between microcode being loaded, and CPUID
>> -     * being scanned generally.  Read into boot_cpu_data.x86_capability[] for
>> -     * the cpu_has_* bits we care about using here.
>> +     * While MSRs/CPUID haven't yet been scanned, MSR_ARCH_CAPABILITIES
>> +     * and leaf 7d0 have already been read if present after early microcode
>> +     * loading time. So we can assume _those_ are present.
>>       */
>>      if ( unlikely(!once) )
>>      {
> I think I'd like to see at least the initial part of the original comment
> retained here.

The first sentence needs to stay as-is.  That's still relevant even with
the feature handling moved out.

The second sentence wants to say something like "However,
microcode_init() has already prepared the feature bits we need." because
it's the justification of why we don't do it here.

~Andrew

