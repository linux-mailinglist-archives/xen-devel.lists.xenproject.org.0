Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5080A6BE7C1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 12:14:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511014.789704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd825-0007ly-IV; Fri, 17 Mar 2023 11:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511014.789704; Fri, 17 Mar 2023 11:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd825-0007kA-FP; Fri, 17 Mar 2023 11:14:01 +0000
Received: by outflank-mailman (input) for mailman id 511014;
 Fri, 17 Mar 2023 11:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eK3V=7J=citrix.com=prvs=433af36f9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pd823-0007k3-OI
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 11:13:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd78e8db-c4b4-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 12:13:56 +0100 (CET)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 07:13:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5893.namprd03.prod.outlook.com (2603:10b6:510:32::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25; Fri, 17 Mar
 2023 11:13:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 11:13:39 +0000
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
X-Inumbo-ID: cd78e8db-c4b4-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679051636;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BuNf3xQD9n1SAUkKcl6kpWKz7M8Td4fX0052A1mpMiI=;
  b=JFvh8OQ0TEaWJT9QV5VyLu8yscyVa1NYlDa9GiR5sSGtVYYeyeGnc82E
   MXiOspBDYuT7MZZVpEnM7LNvRF68fZZsWpOgCNyHkQ0js6yqQ8TVewwsR
   oFmd2i+EkIO5UwXtJ2wbWdqpSL2RhDUa0ysnkAz/vmOzY8IkVy8nczihE
   U=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 103674627
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:oK594KDkUkFpAhVW/yHjw5YqxClBgxIJ4kV8jS/XYbTApDlwhjZWz
 TAbWmqGPfvcMGWjKot3Oomy90ICucLXnd5mQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhB4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4vRGDWJlq
 uYhJjUVS02DqcW/7uyQRbw57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDG7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXxn2kBNxIS9VU8NZWr2+UgWc4OiYTcknqs+GAsk/kVfV2f
 hl8Fi0G6PJaGFaQZtjmVhy7oXjBshsdR8BBO/wz7g2A2uzO/m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+LqRuiNC5TKnUNDQcGQhEC+MLLu5wog1TESdMLOKy/g8DxGDrw6
 yuXtyV4jLIW5eYJyqG68Fbvkz+q4J/TQWYd/R7LV2io6gd4Yo+NZIGy71Xfq/FaI+6xUlCEt
 WMsh8ua4eYBHJyJ0ieKRY0lFbCy7veBORXWgEJjEpcs8Tig4TioeoU4yClmJV1iO8INcyLBa
 k7PtQ5f6ZlfMWHsZqhyC6qzFsJsy6HjHNbkU/n8b9xSb5w3fwiClAltaFCR2SbxkUEquaA5J
 ZqfN82rCB4yAK5qyD2rXOAD+ac33S012HnSWYG9xBOiuYdyf1aQQLYBdVGIPuYw6frepB2Pq
 okGccyX1x9YTevyJDHN9pIeJkwLKn59Ao3qr8tQdaiIJQ8O9HwdNsI9CIgJI+RN95m5XM+Rl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:594XUKtU9grR2Bh1lU5GxHwb7skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="103674627"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEcVpCflD6qFE5vIEPBnkDCeMXffll1zk4ZnoBQxbPglyRfddoRiyFpYrGiMfrqywpNdDgXrGhHGLkRUakW6v4R7wgyH7zgtxTLJw2gMzpdGnAEREAELOdW7wL96ZIRUy3vJDv4N5jF1J5tkG4jyX5LdP+vLwn1tjwc2oP3eRr+kyJFpZRchwBT+SfG2XdtgoJPtnAhCdGPBmTgNkVrzKA7OGrg/zLSKqkHRMBunRcnAqgKz8k5YjmtZSyimZSHd8z8qr/UQQkzBXgzi3v4IBV2tS8B2d9X2hm/cufRIZOjmRjoO35vCUlcMJ0gfXhneLjsC5Q6pvYZytr89IU6bbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTwySt9G0DcNtvaMF07swXXGspE6IBr0o096KhDaBVA=;
 b=kl4fL+aEThKPzCLGx2NutPuw9XgsM9okTqzS9oozttKcLzBWdzN8Io7YRZe/sHGwQOPjNujCn0RcfDV9TZCXZdOHkI2LLcGsus/Anp2i6PwBhjdqbCbS+zUmcgkEcaLLwMrU5Z6h7MOlt1V22twFFfXzvouWbe63nr/sUnPjzcEUj+IUpRr/v3toXBaOYO7elCsM5RtHGr8C6IKP3wBj5FzdFmtWjpHdR0xVd7LmtJuY6P2XSgGgAj9VcHXye/0USrv+hL8n5TUS5iYeVZ10Mj0hEDFeoS6Gn5koZF1wSqojZu7nFXziCCCA3hNoqY/aq7F3widEbBtBnalMn2aj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTwySt9G0DcNtvaMF07swXXGspE6IBr0o096KhDaBVA=;
 b=U+wOYiA5RfCmcpUe3Of4mI1ToORBHjI5zLKwN+VmAPfIqzs+fDfXi4eUzG5WlK1IqSNyaFqqDVwXuxajaF9ZaEo7H3YNMx/RPwCzHEsRIJq26z/q3VMkKAJp88Gzo9Tp/1Tkd+s4EtxdDIz8F1giq2irwKnCzw+2iRD3OHaUr14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <63ed49be-b7d3-3b7e-a406-f760252d55ed@citrix.com>
Date: Fri, 17 Mar 2023 11:13:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2] x86/monitor: Add new monitor event to catch I/O
 instructions
Content-Language: en-GB
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anton Belousov <abelousov@ptsecurity.com>
References: <aab9c8ae059d5f584516d0b6466e57ce0981dadc.1678904818.git.isaikin-dmitry@yandex.ru>
In-Reply-To: <aab9c8ae059d5f584516d0b6466e57ce0981dadc.1678904818.git.isaikin-dmitry@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 84561cef-6bc5-46ae-de35-08db26d8a894
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Bus42F/JgNhGP9aItifwNYVpNNPyrdZ/jXYzn2/WVOiIxFCjVBG2hWWJzNvGiowoglFUWzs05uxYVuu9Iuu88N4WnIF0QCcSrWLQBobwjwsLUN8Z4M83Z2ran2+bb1q0WPU9kxcO+PnfBAYv17QL7+BNAHlsibCtVYfmyrBQMbUNB+YPN0VdWILayHOLpUW1o2tzoPm7W+R+k3VDWaZVKMd8uhVWvTLoQNIcXE+LtpzAYd1+Jok0PUto+tJ4ghCkaCjxmo+4k4srAqPTX97H6DSJThpeX3k/pyTef0zezH8k3VF55uZUqZdVEjXe7yMXRZh5h0XnXdy18sB+hVwxKRYBox4RQ55y0F+UsaoE5ur95aewwZFEfJUL/96rEYowS0u4nizw2ZGEkqTvw/7Sto8ZOniOF6iPyaQWDR+EAC0oEMDm087/xBSwhMJYZqC1ccFCieZOWO8a3M5GH/bfoKlilrrvPDZyDyjc/uLdsbbEgyPdkGea6ZQeW025FeW2gf4UB+ZogEYf5G6pT2iHRzBwScIMFakcRh5InhDN/7srL51hSpJ1AZ43r/NKOctoNttujmB+EWusdNBe9XL6C3B84OxivQxoRIK8kbkL/9cBMSKdOfwq/jP/yVpafzu2JoZVWMlvBrsalItKyIFP36uVz3yhDgGq84QRKCJFEzQrVCv4uWa2H3207N6ZF8fSI4x2VZdbeIBtL9Ip7vTRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199018)(5660300002)(7416002)(36756003)(66946007)(6506007)(8676002)(2616005)(478600001)(186003)(66476007)(26005)(966005)(6486002)(6512007)(6666004)(53546011)(4326008)(31696002)(86362001)(66556008)(83380400001)(54906003)(38100700002)(8936002)(316002)(82960400001)(2906002)(31686004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzZBSnArTXRramxGcHlFZXlGNWVFdlY1bW1tcDFwS3VlOHVWZUpWc1RuZDVH?=
 =?utf-8?B?TUt0RWJvTmJPc3Jrb2Z0S0Z4N2lpeXkzQlozLzYxN3pRZGx2NXpVNkUyaWht?=
 =?utf-8?B?L3BycFU2SFhMY1pVL3N0R0FCRU45bktDNEhCMkQ3ODFBcWFYZmxOL3hwL1M2?=
 =?utf-8?B?Uk1UVjl4VmFVUFBndThmRDFoOUJUT3gzSitGL2JtS1lGWjRSMndHdEFrbVg2?=
 =?utf-8?B?bzF3a0VLa3U3QzFQcGdyL1IvRkg2ay8vK0Z0Nm1DUEVvR3FYblN5ODkvMFQr?=
 =?utf-8?B?SUIybHg0YnhZVlNlaGdreUp1RFpxZ2puTDd1cGVZRFZmdWZRNHl3dEU3RFlE?=
 =?utf-8?B?SkxmekdjMnRicW1vamFqa2xIbEkzU29uUWRyMGg0UUdkRzVKMXcrUlpva3lt?=
 =?utf-8?B?TlhkU2cyTDZoNjdIMlVvV1FMOHRLQytsNmJqQWFTS0ZyRVpZakFueFZuR0Mz?=
 =?utf-8?B?dnRNeEtzd0R4bHJCUVZXNno0cFoxK2JYT0pub3F3REUvblo2UmFnSXBqeTJY?=
 =?utf-8?B?K2llZHlpODRQMWNleTJpcUZxcVRCaWJjMURzZS9leWpiUUdzZjJmU2dCK21W?=
 =?utf-8?B?ZFlGYkxISGljZUp1UHdoUUNQWTBvVnJ5VFN6aGo3bWxqV3h0NGZEdzYxLzdS?=
 =?utf-8?B?MGIxZDJ5Zko0ZHBUZ3RlUU8yS0xFWitOc1Q5NHkySXBNUGQxNEpnWUFjZnFh?=
 =?utf-8?B?QlNjOVdHbVE5MklFaGkxU0hXVmpML2R0c0hsK1NlWGY3cVd1Q2ptbm1KKzli?=
 =?utf-8?B?dC8wMjk3MFpKQS9pRXlzN08vR0NmUFpRQWl6UHcwMElaVkZnSWhJTlczOVZN?=
 =?utf-8?B?NzZMQm1nMDF2WkY1czRhSlEyVmlaUCtNU2srV0NlamhiS3YyajZoVktVNG8x?=
 =?utf-8?B?ZkZoVWJGT1RVUWpsRmU1N1lIdVprbThwN0ZmdUhoTWJRWlhJNktvdS92ckFN?=
 =?utf-8?B?NkIrOERsVFVoSUU5L016MCtQc016MlFRbERwVzFlL2Q4SWViTnFuWWpVVEFk?=
 =?utf-8?B?N2pQc1RWL2dIOFVhVHF5cXdZbnVzKy8zMDFOdGRNL05wWm54VzEwWmlUcG1B?=
 =?utf-8?B?RDNoc0RCQnk2bTArSW1rRC9sT3pmNHNSUmZBM0ZkMG9xbDh1RkYrWjRJSUU3?=
 =?utf-8?B?aVREQTdwM1NhSHJFeDJTN2hLSW9MeERFL09Xdk8yTXZCL2wzTTZ0YmFHUlNv?=
 =?utf-8?B?cjJKSDA4NHhHZUVnNHlJaWJxUkRWRHplcnREaC9oOXIzZVVnTGpzZVRjR1Jv?=
 =?utf-8?B?eXRaMkZidC9OWW9aUUZ6NUl3akNZd0Mxa2xxSXhYMWorVGZmZGhXZXFnU3cr?=
 =?utf-8?B?TFJaRmxrQUVONzBEdFJOZG96UHhSMHVqNEV1bG9iZGZabnMxc2NRR1NBWFJ3?=
 =?utf-8?B?WXIvVlpKUndxTTVqMlIyQ2tLNnlkZGE0QUFUbVNpQjZRN2FTbW1DelBHVmo3?=
 =?utf-8?B?bXg0N3MvOFNUTVVsQ2VDMHpLYjlxOXN5TmFNN1lTQmxRWjdjbkppd1dtclNu?=
 =?utf-8?B?c2lkZFgvaTJ4alJZbndjNmpWWFdyRHhOY05xREdJMTM5VW4wY0ZPR1k2VnYr?=
 =?utf-8?B?c1d4azBpTVZBcUhWYVFzMXBWQ2NkUzdOcXpYTUk4Y054bjVnWkc5WENvZW0x?=
 =?utf-8?B?d2FkNUQyMVAyWllBK1VUZy9TNEpuNWs1YldIZ2JsaW4vWkxPb0FPVWJvR3Qx?=
 =?utf-8?B?WUdYOWIzb2pDWnhBQVAyUEI1RFRKVVd0RmVISUh4NzliV1hRcXRjOWNFVjNW?=
 =?utf-8?B?UzFrbDNZZ3VscUFtTzh0OUp2VTQ4aGhUVUJwN1RGck5qNTVGRHU0bzBJZ0Zv?=
 =?utf-8?B?U3pyWXIxUXk4WFNwZ1lOYkQwSVpuRjlYSldMcmE0NGNMdGcvRzNDTzluOHJ0?=
 =?utf-8?B?MURFdFZibVJFYm13V2tKaTJZZzROYm5yeXNkbUhBczdRendNVU94RkdJWFBy?=
 =?utf-8?B?ZTY0cm85SzI4STgxNUdmRk1KWE5WNXhhai9zY2xKNlU5azVrYk1jdHIySEhR?=
 =?utf-8?B?SzFaWnM1azM2N1BDa2U4MHpOcFM5NFJjMkhjeTBrRU14N2xrWDhPbERYWlVu?=
 =?utf-8?B?ejhkTGlHR2ZONi9EdkI0aHZyZm1uOFJaR3dSVkZTNjVpNU9GZG41STBKTlRa?=
 =?utf-8?B?dnN2RGtYc0g1ZjAvcUhsNzZWNEw4Wmp2aGhiYStIR1BVeU9YUllreGs0QkNQ?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?bEl6cG5kK1pPWFd6UllSN2x5MFBRTFBNQ2d4SXhDT2t2UGYxMzIwcnpMOFE1?=
 =?utf-8?B?U0FZNlFyWDVDRkJ4YUxRZ2lUMWhrZDIzejRsQWdtY0pwVEJkTG1TaWo3WXk5?=
 =?utf-8?B?RHhpMmpOZGdKa3o3Q2h1c3dsVm1uNkVzYmNOUzNGSnVDeTJNMkU5bEw0ck1v?=
 =?utf-8?B?UkZFdW9YVlM5dE9zR3NQanZudG43dHZyTjU5Wlp1Z0RNeHRSNHEwZCt3aDNo?=
 =?utf-8?B?L011MGFuWThWOWUyQThBeHhiKzlKcnFGQTRFa2dIRExuYXlvSWlNWFJuZm1x?=
 =?utf-8?B?R3R6MmVVZVZhTVBzc3RNMDVFYTNkMkNyT0MxVktGS2VPQXZiY2k3RXplVGIv?=
 =?utf-8?B?cEZycUJmMW82UTdTTDkxK0VGaGNWN0lGa0FVMitDRWowUjNUckE5bkk4eWhq?=
 =?utf-8?B?VlJpRzE3MmtyWVVTYW9xeFBteS9jWWlhVEtSV3VybDNva0Q3MEorbWhBUUV5?=
 =?utf-8?B?QXJTWUZWK290amxyYksyNG1vbDFFUlRHRVJIZGtNT2xublQ1V1l2MUFYYzRK?=
 =?utf-8?B?NWZkYjloWnZqRHlQdFVDR2Z5NWsxaTNGb0xLMzUrTmdndFFoQ0x3TzZKS3BJ?=
 =?utf-8?B?YnJ6RE9tdVZoRTZhcU5RQ29DcXlRMytkZjJBTklkVzlaL2VXSVN0Q2NMV0Fl?=
 =?utf-8?B?cWJGeG41aGl5Vnl0TG5JaTFkSEZIVHNqNVdscENvRmR5VEdFWm00ajhMcU9X?=
 =?utf-8?B?UDdZVzZNQWpORHZtWTBTdVBEN081SkhmTVB3N2RtMlluVVkvS21ycXVJWVJF?=
 =?utf-8?B?Zjk5aG54U2diaFRBQTFtS1JlNWdrNjJ2MzNmZmxkWWl2UnYxL0Fqd3VDZlFz?=
 =?utf-8?B?ZXc1YXpjY0hsV1BGR0ZoZHBUMEhnbWtING9zdnBUNnJlVU8wcFlrTm00M2xI?=
 =?utf-8?B?QlZtalhwNW1DakRKTk5MUVUybDNmSkE2Y01naXoxZUplc0UwbEZQdWlqQUNG?=
 =?utf-8?B?U0huVjNXTHFHeVM5bWtXNzdIY3JXRlpwWnlVRnRJRDBkTFNCMTlLcVNmOW9C?=
 =?utf-8?B?WDM0MjhycDBFMCtMMjBvTTZ3SDNLb0FldzhRcFgyMVZSWVdoS0ZOaVBzR0Jx?=
 =?utf-8?B?ZWFFKzRMUjRScXB6bUZhVE8yTWpuaVIxZUpYMDA4cSs5VXZNSmkzWHh3WmdL?=
 =?utf-8?B?Qi9ORXFYb3lMM2JKNjZETkxrd3lrVXVvN29nRHYvSFMvSjYvSEtvNHB3L0NF?=
 =?utf-8?B?Z1hhR3VOT2hEVmZldDFGTE0zdUp5U1J5L0ZyaHJiaDg1eW1lMjV3T0pWc0RR?=
 =?utf-8?B?dGV4QWZCS3NhcTVMVjdyKzg0UW5VOEpQQjVaWXpZdjhqV3RKbjRzd1ZPRTkz?=
 =?utf-8?B?akdEK1NIVWlPMnRGbTVNRzFpU3FibnZqem04eHVIanh2dkdqMjV2SC9ndkE1?=
 =?utf-8?B?NTdXNnV6R1JxS2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84561cef-6bc5-46ae-de35-08db26d8a894
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 11:13:38.9458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCrppwdKgce+lqRgMb2VDRouDQfowshcjHoxlgUN7y5oIhEd6t6XaKbKhKlolJoNRXe8rzNry5RHa2AQpZxr6pnpt7t5jVat4OZwRQujE7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5893

On 15/03/2023 6:54 pm, Dmitry Isaykin wrote:
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index a43bcf2e92..49225f48a7 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2939,17 +2939,26 @@ void svm_vmexit_handler(void)
>          break;
>  
>      case VMEXIT_IOIO:
> -        if ( (vmcb->exitinfo1 & (1u<<2)) == 0 )
> +     {
> +        uint16_t port = (vmcb->exitinfo1 >> 16) & 0xFFFF;
> +        int bytes = ((vmcb->exitinfo1 >> 4) & 0x07);
> +        int dir = (vmcb->exitinfo1 & 1) ? IOREQ_READ : IOREQ_WRITE;
> +        bool string_ins = (vmcb->exitinfo1 & (1u<<2));
> +        int rc = hvm_monitor_io(port, bytes, dir, string_ins);
> +        if ( rc < 0 )
> +            goto unexpected_exit_type;
> +        if ( !rc )
>          {
> -            uint16_t port = (vmcb->exitinfo1 >> 16) & 0xFFFF;
> -            int bytes = ((vmcb->exitinfo1 >> 4) & 0x07);
> -            int dir = (vmcb->exitinfo1 & 1) ? IOREQ_READ : IOREQ_WRITE;
> -            if ( handle_pio(port, bytes, dir) )
> -                __update_guest_eip(regs, vmcb->exitinfo2 - vmcb->rip);
> +            if ( !string_ins )
> +            {
> +                if ( handle_pio(port, bytes, dir) )
> +                    __update_guest_eip(regs, vmcb->exitinfo2 - vmcb->rip);
> +            }
> +            else if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
> +                hvm_inject_hw_exception(TRAP_gp_fault, 0);
>          }
> -        else if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
> -            hvm_inject_hw_exception(TRAP_gp_fault, 0);
>          break;
> +    }

There are a few style issues, but it's also a mess because of the manual
exitinfo decoding, so I went ahead and did

https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=df9369154aa010b2322e3f3e0727a242784cfd4f

to clean it up.  The rebased version of this hunk is now:

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index bfe03316def6..17ac99f6cd56 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2939,6 +2939,15 @@ void svm_vmexit_handler(void)
         break;
 
     case VMEXIT_IOIO:
+        rc = hvm_monitor_io(vmcb->ei.io.port,
+                            vmcb->ei.io.bytes,
+                            vmcb->ei.io.in ? IOREQ_READ : IOREQ_WRITE,
+                            vmcb->ei.io.str);
+        if ( rc < 0 )
+            goto unexpected_exit_type;
+        if ( rc )
+            break;
+
         if ( !vmcb->ei.io.str )
         {
             if ( handle_pio(vmcb->ei.io.port,

which I hope you'll agree is much more simple to follow.

I'm also trying to sort out a similar cleanup on the Intel side, but
haven't managed to post that yet.

~Andrew

