Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8041F52EA18
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 12:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333766.557672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns04q-00068m-NO; Fri, 20 May 2022 10:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333766.557672; Fri, 20 May 2022 10:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns04q-00066D-KC; Fri, 20 May 2022 10:41:48 +0000
Received: by outflank-mailman (input) for mailman id 333766;
 Fri, 20 May 2022 10:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns04o-000663-VI
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 10:41:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7067ebad-d829-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 12:41:44 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 06:41:39 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BY5PR03MB5064.namprd03.prod.outlook.com (2603:10b6:a03:1e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 10:41:37 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 10:41:37 +0000
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
X-Inumbo-ID: 7067ebad-d829-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653043304;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=C799wSVd8mheasBi+UFY2ISFXzyimWK5JgtnMgfUL0g=;
  b=VLArUcMUxZtqPiC+HDbH/D2EQ78ywMrSLQ1KVJW8h6S7PHCYGLKufy51
   R0iqHq9wdLyXffncEB2zUIRa/nDWs9y2e0+MGm+GnkQtv37eCwtavMO+t
   GBGBlWjde0eyBfRFMqUT9oz/b+Mvs5PMUZnwSv2F9C+VD/JLJ3ui16WLw
   E=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 71149295
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:l3azMqD2bwJ3lBVW/1Piw5YqxClBgxIJ4kV8jS/XYbTApDJ31DUDy
 GoeXzzVbK7fMzeje9h2a4Sx/RxTsMXcyNFkQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng09Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhvx
 41x6qySST14O6/exeM9TCtaLhBXaPguFL/veRBTsOS15mifKT7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t3B8mcG80m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjx3yWuKWwFwL6Tjaxwv2Xh8AFQ6uHwbvjNf8GkSptJnm/N8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa7EW2SvHtUhv+p2SL1jYDX/JAHut87xuCopc4+C6cD2kACzJENtovsZZsQSRwj
 wDR2dT0GTZorbuZD2qH8auZpi+zPi5TKnIeYSgDTk0O5NyLTJwPsy8jh+1LSMad5uAZ0xmpq
 9xWhEDSX4kusPM=
IronPort-HdrOrdr: A9a23:n2L7MK+KFlpmKyXI9bNuk+E+db1zdoMgy1knxilNoENuEvBwxv
 rOoB1E73HJYW4qKQ0dcKO7Sda9qBLnhNNICOYqTM+ftWXdyQ6VxcRZnPbfKl7bamHDH4xmpN
 xdmsFFYbWcYTcK7reZ3OD7Kadb/DDuytHtuQ609QYLcegeUdAY0+4PMHf8LqQZfngjOXKxf6
 D22iLIzwDQP0j+Ma+AbEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZszU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUuZ1TChkF1nAic0idorD
 D+mWZjAy1H0QKQQoj6m2qp5+Cq6kdR15ar8y7ovZJIm72/eNtyMbswuatJNhTe8EYup9d6ze
 ZC2H+YrYNeCVfakD36/MWgbWAjqqOYmwtVrQcotQ0XbWLeUs4kkaUPuEdOVJsQFiPz744qVO
 FoEcHH/f5TNVeXdWrQsGVjyMGlGi1bJGbNfmES/siOlzRGlnFwyEUVgMQZg3cb7Zo4D51J/f
 7NPKhknKxHCsUWcaV+DuEcRtbfMB2HffsNChPkHb3KLtB0B5uWke+F3Fwc3pDeRKA1
X-IronPort-AV: E=Sophos;i="5.91,238,1647316800"; 
   d="scan'208";a="71149295"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fe6cXykSyTBwLe9rEBHyqWpEEgUu54RnJAuE4E7WZCxGCks7uT248kjIV0GiDfoI7HLBA+dDI2wcT0TSCYxNqRYiHGI6vpKuHhsgEWV9kepGjvQqxNb/yWB71sV5FiICVJGhvf/SnHVDc2py6g8gFfSPxtPLA11/SqZ1KKo9sBTWlg+/9eka3w9pATh6N54+0z5P4J2hO3xyqXzFaPWSgf6odR9CnJtgTow3yZcCKmxx4aJQTJl8k/8xdUQEWdy5hCtpjfTsLiVWHAKEvpv7sc+hGVvBkiPZNiKzjtbwhSO6haTmQLTqchCFB8qG45IKMIlvEfs76G3K4B6GH8WkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxJSHlIXV2cmu39YQHH4XEkxVJxVrkvXVMjyBXONdCM=;
 b=MRFy7oiaokEB+0mKEOi3lnDqJ2OjaU/x8jAco83uGkpi21nworW2a4g5QHL1lQWctg1cX52SvDCGEIu9993+zfvvaxxCoUSS8AK/mg2QzaFWIM/tCIAx9eww+m+L3FrYC3PfmzvokGHOc2A9NmgusqQYGARbJ55yKeDTZFxla1RdgLxAel/B9NVbWnCY6F6qAd4WEwOo15lJNPYrNez77yOSzYFq5nyOYXr3UuEB4+vy7FCNNz6FNsNuPzStM2SgKkIuRVBtZoFmTpdtIKKP2CAxiP3qUHg3AWsJKZWnEKkL7jqR8Ec1MuQQufkb08BfLqQ5UlkhWW1K4GmbiEnXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxJSHlIXV2cmu39YQHH4XEkxVJxVrkvXVMjyBXONdCM=;
 b=GaTRH1mLOW0WsnKoY8SmEf4xb2Oe8ieBU5I+Hw54DceyqyzLhvDt5OuAP7YODUIdOaRPMdXENvbt27iix38Oyj0Fk5n61XvglNwF25t9j9/89Hhur73Fzs8t2zGjxjFCLoj/IYavtYNLkObw8choi1MQAW/Ih2fk+SBuPo80QeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 12:41:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 19/21] IOMMU/x86: add perf counters for page table
 splitting / coalescing
Message-ID: <YodwXtT/sqPPoBaL@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <cd077dac-c53c-3369-03db-f2e4260ee94f@suse.com>
 <Ynu+qM0o6VsaDEfJ@Air-de-Roger>
 <e13a592e-5405-6a09-a902-51fd3ffe11e3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e13a592e-5405-6a09-a902-51fd3ffe11e3@suse.com>
X-ClientProxiedBy: LO4P123CA0316.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 343bfdaf-2895-4758-23f1-08da3a4d5146
X-MS-TrafficTypeDiagnostic: BY5PR03MB5064:EE_
X-Microsoft-Antispam-PRVS:
	<BY5PR03MB5064FAFBF4BBBABCE36499D38FD39@BY5PR03MB5064.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RJ4KwkPJ/BfiBynzCchGhCzAowt+cNhncS1hSbsebRrhspOuqXQ5rvvIQpEm2u1s4YqQd2blHo4itDucmgaZ9WeQJU6TjlAynravts/jBt8K54llxbojRHumiSrWyX3pTNElv89A7IWXqIm1YjtLiOmzCkOwxNnEyt5/CDBtjilSeNrEKHfYju0/6KcPXqoZwpfC8ROs1KYBE+/IxpyKtQVSP2qI7RF5JK+i+qgI9X47qYdW5vSavvErTQWcEAiPlpg/RHWT/K/e0BVFf9o2fajoRDwOZ/Q0Lx7cnJgofAAsIkCaEqxbV2+jRfr0GZDPp0IIQ7kyyQ7jHhmuX9FD0s6WcsPJX21FW7OIv4PrvlzOCofwapPVKi4WAmNBJR+DVUTR8CkCCU8GI47K6BahRbQvjz7wVH2qlBPiryePABkC4p3zaEf+D92np00cDixdNQvxwy/teWuffOM1OsQq58dNvce6iiDGkKPHE1aiM1UOIho22XMtjDsMuMhhC/uVrkZa+71JnNkDtQ8s90Sd2az0+vdv/vPvAfRFxKVr9v3csPdm83/nBOsRY/QUC940CNJ0V9/XPhlXKRT0x9clvi0NYEWj4M8/dAkhq2p9LZn7B2TaS0jroHqGpSvld3Iu5U1uajTQbbREph4Uv6Fdeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(85182001)(33716001)(38100700002)(2906002)(5660300002)(4744005)(8936002)(66476007)(66556008)(66946007)(4326008)(8676002)(54906003)(6916009)(186003)(9686003)(6512007)(316002)(86362001)(6486002)(6506007)(26005)(508600001)(6666004)(53546011)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDdWKzV3MjNzaFdmTFNEbUhBdDBHWVBJM0NsMVhaeEE2TnFrOUFQZ1B2aW4w?=
 =?utf-8?B?bnIyNjhEMDBjcHhnajhna3pDUks4SjRJb29laUNqUTdBdnpJcEUwUDY3bnY4?=
 =?utf-8?B?ZGVVZnhLU0tRVUlhOURMM3cyUVBySVhIQjNhcXlmSmY4aEppUzUzZllpanBs?=
 =?utf-8?B?aXBOZjNlVUpmMFhnWmgxWmxVQXBCT21LN2ZyQW5jblhxaEpSbklMdit4Wlkw?=
 =?utf-8?B?cHRDeHQyMU1qY3Zham5UYks0S0dFaVdtKzc4N0lIUnM4UHNpeVZkbTlxMzl5?=
 =?utf-8?B?VFNUVjJUdzh3MXpzRHFvSm03bjc5NjNkbDE5TU1NdTJMMUQxRGtHaDN0Ynpn?=
 =?utf-8?B?eFlGNWs0elU0NGk1aTZIcEdJTUtqRmIyN3B4NVZrdzhRbFNORmxmMDFVNXdL?=
 =?utf-8?B?K2xySFdOczBJNlFvZVBuYzVMdjNCcDdXOW51OGtHQTVCSm4wVmgwUklpYy8z?=
 =?utf-8?B?YnE3dmY3M2U1OTRMWjBKSHV1S3hkc09uM0FrdjNnZUg0NEJzY0N3cFlzbTFw?=
 =?utf-8?B?R0dRQmxvd0FqMy9sSDBqVms2Y1pTVW1jN1NKSGVaZERML3h6Uk1iRmthVm5C?=
 =?utf-8?B?dTM1NWcrdTVrYkJ2ci9Fd2MzSy9vcFo3eS80T1ppZk1xaHg2MER2QTRrVVZH?=
 =?utf-8?B?TFdMWUxDeW1OeFBkMGgvUWIydjVMZUdTNzlDS1VKV2RQRE9QUEhRWkF6SG4x?=
 =?utf-8?B?S0p3ZjBxN0x1b2RheXBCdVJuSnBLc0psUDJRT0NpTmk3SFExbTB5MkhhRTRx?=
 =?utf-8?B?SkVUbWpxZ0RaYzNRbEc5VWtSRUJKSDFZYS9tV3YwOVRMT2VKTWh5dlJ6emY5?=
 =?utf-8?B?Um1KeWdjSUc5UkpUNmt3T2dhSHpGc2MxTHpmVDY3eEtoL203YUt1VkMzNEt4?=
 =?utf-8?B?dkRZVVo2TFVLeVZEbmw0b1I5anlTaHJ3VzdKOUJkNGFFaUM4U2ZaVGtrWUM3?=
 =?utf-8?B?VlFqY3ZySTMrS2xOcjRjWStUL0dMQWEwaDBLVFNpSjhIK25aald6Tm5SU3V6?=
 =?utf-8?B?bS9idkFENzd0emhRU21BSkR6ODMxUVZncTgxdzNnUndQdHlQclI2WkdxUnFu?=
 =?utf-8?B?aE1tWGNjQWkxS3IydUdJbTd3eFYvaVZIRkxVMkhvT3NnajFndmxyS0EzVzFL?=
 =?utf-8?B?eU1wTU4vQnRIN2lDbjVoOU5TdGtHcFNVWHVEdksvZFBMNGpxcG1XZlordmps?=
 =?utf-8?B?ZC85U2tCaGpROGpXOEJiSkZ1UE5LVW9HVUlhK2haRWdzQUZBOWFLQ2NLampk?=
 =?utf-8?B?c1k1eXozdjlZeFVRUFVqUkI2UTdJYVNUNzh5WFZvak5wc3A4czJBNU5nWFhy?=
 =?utf-8?B?NzFFQ3Y0Tis5clNYcjB1MUdtUlY1MVR2SDNMSTRNR21FY2FDRWpLMWhxaS8z?=
 =?utf-8?B?clZkc29EK3pJa3NsQm9Udm0xNFpOeGgzaEJJajFTMCtwUGI2eVFJeFZ4czdx?=
 =?utf-8?B?aVhPeGtLRDRaZU03Vng0eldudER6OWI5S2llTGpQQThuL1YvSDYraHVzYzlP?=
 =?utf-8?B?eU1wNVVyMTExOUc4N2lSWGZpRklrMDhuOFlxU2lPSTVGMTFpZTl0NmQ2MEEy?=
 =?utf-8?B?bzBUMHNyc01McUhUU0I5WC82dVJSYUQ5SklFbmlBWmtJQmZsVVZaMmt0akRu?=
 =?utf-8?B?bFFTOUE5YXNlQmpWcWFESW5tSTZUem1Hd08zSU5VSzlGWFZoM01HeENSTXJR?=
 =?utf-8?B?NFYxc1BHOGRPNUYvN01Bb1pBRE8ySjFyYW80ZkJhaHcwYmM2SXppTTZNOVJR?=
 =?utf-8?B?L04yVVhOSldDNmNqSGZlTzM3Z21SRVgraXZ0bmp6dWZwUTV4UnJma05XQjVy?=
 =?utf-8?B?UjBkZ2EwalBVVWx3R0lNc1MzVzAzWkxuWGU0bnl1dGFhMUIvWUcvMWsxT0N1?=
 =?utf-8?B?djUzenBMcXlpMGxwbzJnL2NYQmJ0UFJCWkJTSTZLWjBVZVNjNTU2NHY5RkdU?=
 =?utf-8?B?Y0p0MXNzZ00ycURnL0RJekxMVEdmbHVhSDJVeW53WVJ6dGRocStPUzRvOTdX?=
 =?utf-8?B?OWgwZWlJUHhiUEN5SnprMG5FUVkvVElEZlJHSDhqL2RDRGNwZEJwV0ZaT0Zy?=
 =?utf-8?B?eE1kMExWeW52d1pwY3JJMFBGR3liVThyaEozelFHdXFWWXdMS2ZSZVEwTGho?=
 =?utf-8?B?d3ZFSjdickE2T0NBLzhieEZuQXpzRHVrVDNRT0ZNelNWNkw2T1hxUWd6T0hi?=
 =?utf-8?B?S3lRcXVkY0RoT3lxVUhhQ2hQQkZadlpLYUJRRnNESVN0dU5YbXZiUkVDdm5U?=
 =?utf-8?B?eVhFWXRiZXQxcGFhS3hjK0lSSkdRd0cwZkcxOGUybDQzUzhvUWZ6UmFsNi92?=
 =?utf-8?B?d3p3aUl1T2pLbDMva29HemJtNm5DUWJ4VGZFaW1TRmxydXVuS3ZBVTFSUjZ3?=
 =?utf-8?Q?bTM/VKP7hrkouVEI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343bfdaf-2895-4758-23f1-08da3a4d5146
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:41:37.7767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4uxVq75sj9UW1mQT5CCRQxZjbnxgBOI+B/mpvXPB8X5QHi8mogF0xrlJDvCo20ok6Ab1cgoCK8vCRGjk7X4hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5064

On Wed, May 18, 2022 at 01:39:02PM +0200, Jan Beulich wrote:
> On 11.05.2022 15:48, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 10:44:11AM +0200, Jan Beulich wrote:
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> Reviewed-by: Kevin tian <kevin.tian@intel.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > Would be helpful to also have those per-guest I think.
> 
> Perhaps, but we don't have per-guest counter infrastructure, do we?

No, I don't think so?  Would be nice, but I don't see us doing it any
time soon.

Thanks, Roger.

