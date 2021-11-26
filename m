Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF3845F07F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 16:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233177.404469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqczB-0006Nl-RY; Fri, 26 Nov 2021 15:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233177.404469; Fri, 26 Nov 2021 15:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqczB-0006Lp-NA; Fri, 26 Nov 2021 15:18:01 +0000
Received: by outflank-mailman (input) for mailman id 233177;
 Fri, 26 Nov 2021 15:18:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=maq7=QN=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1mqczA-0006LJ-Gl
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 15:18:00 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08c4e679-4ecc-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 16:17:58 +0100 (CET)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AQF5pUw015226; 
 Fri, 26 Nov 2021 15:17:51 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ck1x2r2at-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Nov 2021 15:17:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AQFBQQB027182;
 Fri, 26 Nov 2021 15:17:50 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by aserp3030.oracle.com with ESMTP id 3ceq2k2a2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Nov 2021 15:17:50 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB3010.namprd10.prod.outlook.com (2603:10b6:208:78::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 15:17:47 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12%4]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 15:17:47 +0000
Received: from [10.74.104.211] (138.3.200.19) by
 BY5PR20CA0016.namprd20.prod.outlook.com (2603:10b6:a03:1f4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Fri, 26 Nov 2021 15:17:45 +0000
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
X-Inumbo-ID: 08c4e679-4ecc-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=T2ytXIl5GrMUq6c8ZZho0Z5HcGnofJ55iECblRsRg44=;
 b=aao32CasZdhV3VySYyz+LZY/iZOUc2aOJw3tsERgB9a2B4mHrsmQ5er0Q1fNu0K0ygXO
 3DXTSgSozgR81uTE1flYkvyCf0QeAsy0hnScGkBuIt2ua9GYPlpF1i/i1uFj5fN8LGTC
 /puJ0ZZ5V+kgjRy24jHogaqyTKKwAD6X7fjZk0swVeB+/UTAvI39ohFlDW8ExR3OjMIc
 mSRT6WfUjFkeUpZx49VYXK0TO3uG0UkBd0tLXWnyQ4oPYIzqdOP/TW6lc5PgS4V2mMUd
 5w80cfEl1WKmJVSnUw13pBIDN5oHvTg3wb59ZaUDR1tMXaTYaubrR7ikiORFQ20FKSVS Dg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RK6D0TN4L1XS77cLV+uyQMYF9W58aaSBf2DfSa8l9lKyEHMK0cejDTUdooKaxghd6vESw0YI9KmNnYmyXJIQgjUj+yBskqZA6ejV3vYJ0BNFuGQ1UKKCNXcqYBbTZe/7Uzgor8ZWHC1oPDJIBTiVqAFzQJFrfGXFxqr9jmKSq0Two4V/cFL4yzgF0Cy9QufuKvHs9uZ5IP7xLj7JVV849iKFZpMVrvJP7ieaooKzOJmzKUjYaGLXJ3LVpQwB15US9KMTgBk327D3S+8fbYBoiIacdV747DTiIU8ys1xTJoX3UgPdLPad9BRaUs9YsWFqRl2c2mF1DPnEyTsc62meJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2ytXIl5GrMUq6c8ZZho0Z5HcGnofJ55iECblRsRg44=;
 b=faobUnWgl3R6a3CLtelCvrUVVmv+hRnxQ/5IQd1ZhRCmF20TD5+9HMk/RPNA+w/C7tL5IvsLA0qe43brnXA+HKG7tYnW4EiY0S2OPt6mXunX6J+aoIcCyQ1/wsxuEPKMgUiu/Th1IJSVJ69DwhBBHBWK9DRLKkHfcR+ksxKylrtIr4NXMfaT5MVw4vBrvFCnvuoC0B9GFih44gR01tnqFBTqTEyMCyEj5YzI5ngAZiHDgyy2m48JmRiZ+BNbb7ghHyZXPgm9K7la2BjrOGbzHHMP10cbKYjrj3V/rOhA8beJhawmyDg/pCHwR7zIkuxifkMj+VvcFKFPfThLF5crhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2ytXIl5GrMUq6c8ZZho0Z5HcGnofJ55iECblRsRg44=;
 b=SpuftzkR7u1YBw5zEsv+5mapeNDNXeyhWH5srhBmQVkABm8YdbTnj8pEgFvEMCn37mPU+4foqNTc5Q7TEsEGAUCfJh0JC3QwQH9qzHtl/Pcof+Dr3Lexr6Rpnu4AcMrhNFYN5lbrhBEwjMrVXD1xQvPHfh+sobYPC752QVlC7RE=
Message-ID: <042a46ef-c20f-5cc7-8f9a-75b8731f661f@oracle.com>
Date: Fri, 26 Nov 2021 10:17:43 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH V3 4/6] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
 <1637787223-21129-5-git-send-email-olekstysh@gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <1637787223-21129-5-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::29) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dba044a-e2de-45a0-9172-08d9b0efe746
X-MS-TrafficTypeDiagnostic: BL0PR10MB3010:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB30108ECEC0B7666EEB942CE98A639@BL0PR10MB3010.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YjWjHbLGWqzQr71ozEAmq07DbJfJYAaMYzUuAFkIifTCjVWeqxiHzVlkaPKUTxXuz3bx1lX/MJpmXLijJLg8UJ+J+dxXj9ARwn/7ufaRf2ChdNeAXZGDWEtsWdHf9vYqM8pIN85zf1AiUTrivyYKBCnmd2RuCg2BGyd/ycgOQ5ZWUtTHGTHxBjOz0L9NBgc44dYexdKke9vF+6n6OGoLaSoHKyLApfi51aexPjm6g3TTjWLyz6TI8+GZWH9FL72Rkbd/t7NjYXRN2Fvoe8iuCP3q3Cp3hMX2gY91eQkXrBXBGu8fbrwarvEQf6lrBEKJHZjd2FTbeFNjh1X1JEQBGl7655vJu/jQ4eo9i/iltWaM3CHwnu2XMbH6xs89WqtBS5vLQFVf8vA1SDB3eu+dSaw2xlASJIjjyQysl8AAnqE7q1wfo85b3COlmnakXZVBcGqLCj4yi8yNmQ+h6qf+VnHp76e3Wse5SvGZ41Khmzgc+6cacSjWswXqSOV7+70xRgb/lHfBaN4af2f6dyr3xOhgMsFt9AIsJQa6diK6DHDC8qGRERWh3mEZ+DZDiB3EqxIv3Y/sv7hc51Kg0mB5pOC4ubAeAIEusst17dmgoMEO8pwe1l+ql4Xup87lt+crcJXKNhTN0mLa8NgFVjxUslNPAT/scvMDq1Cvo4/myb6NH3f35zCDuAxbAyt6HV1DqCgGzU/cexsn5S5isQlP74AsYpQs+IeHy++Fh5NHOIuYp0fE6luRnWrzkfbKwsrU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(2906002)(2616005)(44832011)(26005)(186003)(31686004)(4326008)(956004)(36756003)(558084003)(66946007)(53546011)(5660300002)(8936002)(8676002)(66476007)(16576012)(54906003)(66556008)(6486002)(508600001)(31696002)(86362001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3NRd0pOUkZkMElSOWlFK3JqMnFCZUtYYWZJaFVNTFFoRldCU3FXcGxrcVBX?=
 =?utf-8?B?enRGVGdFaUJXc3VQY3N0R3VqNllDZWZuZktQVG9IVkZ0VUROclEvQlh5N1pj?=
 =?utf-8?B?MXhzbjJINmE2SElaM2ZNNDdjbFcxUTFib1hNSFZ5a0ltWUlOZjRBMkJKVC85?=
 =?utf-8?B?eHljOS8yZVluUGNCV2FwVllzSUJHZ0NqanNQYWFJVHYzQzNRQ2FuSWkwMzVX?=
 =?utf-8?B?ODdoQy9LbUNnekJKcmFPdzZuczVrdjVBdGRpT2ZLN21KaEppd1grMEw1Qnpa?=
 =?utf-8?B?cmo2R29HL0ZNM04wai9BeDhLbUZOWEdrR3MrbDBEUUZBTmVlQTkwc2tDWG9z?=
 =?utf-8?B?Zmgwd3RTQ3BhVFc4eFgzQkExZWRkcW5MUGRiaDdHaklmdzgvOTd3UWpzdkpX?=
 =?utf-8?B?TmJyQk9jbVNITjlpZFJMU1VlV2Rlam1WajBVRVBZU2FaSVVEalkwL1Z1SHFy?=
 =?utf-8?B?WENjTktXN2ZWZ3Ixem4vMVlWM0xZNUhJTFdWamJwMEppQWMraisxNUE3VFdz?=
 =?utf-8?B?NFR6SG81a2lnZ3duQXI3cEs1ZXd4dzl5WHp1N3NON2RqRVFPdnFFZ2ZRdFF2?=
 =?utf-8?B?K205NWVZZm5FeHJFTzFCd2Rpc2xSUVFWazhCRjYxS1dsY3FLSWJIUWJuMWZ5?=
 =?utf-8?B?d21FL2JFcTBvcnZwSnNsVjFXQ21NSmo5WWJrYUF3dDdEYzBDVHViZEMvSmY0?=
 =?utf-8?B?NVZKdjZoOHVHYU02VVpDT09CZmxSeVYyV0M4WEE1Y3F5ajBBS0lLUEk1R2Fz?=
 =?utf-8?B?cEQ1VkNDSnNJTnd6S2tDSENJZ1F0ZXk4eXk0THdiZklTcmpKQ0MyQlJRR2Zl?=
 =?utf-8?B?UDEvNVZaemx2VmFrYW1lTG5wdmpiL2xQMm03ZkROQ3NlWXp2a3pCT2pZRWhy?=
 =?utf-8?B?Tnoxci9YQkpUakVOTHg4bmpMOUhuMEJSMUJoazk5eXBqMWExeERVdnpoclpm?=
 =?utf-8?B?MUhMVXNkZlZENjFlYmNoR1haaG9sK2VzRUIvRk9HVWtSalRXcFpQRUxnZUVK?=
 =?utf-8?B?UDUzWlhRYlhlOHdCcm9KeS8weTZKZWgrV1Y1bGQxcHdZb1VLZzFuOWMxTG5U?=
 =?utf-8?B?eURHQ3lkbjJmbkZseWhlcE9zbmlteHlreWxVdi85Unc1L1IrRVdkTDk3ZkV5?=
 =?utf-8?B?THRHRGRuMk91ZVhOZWNFZjMwLzZDRkkwOVdPc05IOFd4MjJGT2NpUUd5TlNa?=
 =?utf-8?B?eUZaOTJ0QlZHT1o2bTFpazgxQXNpYmxRVHNnZGdhNWQwNE9NRlJOaktVc0tY?=
 =?utf-8?B?Q2lDdGZhWm9OOFprbGQ1MlBaS1VlRjMwT0d4NEY4M3pPK0tiT1FkTzZOd0dN?=
 =?utf-8?B?ekVOK25SSS93TmRiaXl2RmNXMDBTa1FvWUpGUXQ4VGJzangySEY5MHNUUnVj?=
 =?utf-8?B?WUpWR1hlU2ZneEpRVWNLVGVHYjVtcGNYVHJKTVNzbFlEWTNRYUFieHNiWVNs?=
 =?utf-8?B?aGd4elQybzZ3VVZQWDdlVjF1dXlJTy96UC9RTWdBcFF2a0p5N2Z0VEpGVXBC?=
 =?utf-8?B?REVyRDNlMUY5VDdpUC9keHllMm5TTFlCcW0wMHhsT3hvZFNMaGJVa2VSK2ZS?=
 =?utf-8?B?dGhZTWErREdKaFNvaXdUL2hwTVRheUNudmhvWW8wRldHYUQ4RWZjTDRNb2dj?=
 =?utf-8?B?TkQvN2NCNFBxNGlsV3BLa1NZLzkxUDFQUzU5WG5TQ3p0SXg4NnJPQzZYM0NL?=
 =?utf-8?B?ZS9tRHlMWVhzeEwzZWN5RjRxR0dMTXNrVGpOV3NEQWw0SXlPc0E3ckc0YlB0?=
 =?utf-8?B?cktTaUFDMHBpNitCd1dqUmVCNW00cjdab3A5VGV6RkgvbEFxQWF0eWM0YlU4?=
 =?utf-8?B?MmxzbnRKaTVOcGlQakJRL1RnQWRPbC9wK1AwQ1pIcGprQ1cxeUdSVDhPaHBL?=
 =?utf-8?B?RjJTcGVIdVlIajhaOTRlL2U3VldFQk5wcTdnNHFIRkZyanVTcktsQlVPU1Fi?=
 =?utf-8?B?Y0NiekUzaUU3STBEdVNJT3EyTk8raWZtREdHYTJZNzVFSVBPenhOSjR0bFoy?=
 =?utf-8?B?VE5DNjRid0ROZ3F6MXVIeXIzaWU3aDZ1VndXby9OazQvampLMU1UcU00ZVRq?=
 =?utf-8?B?aDRLQnZkZVZLOG45WWV2aDhjaGRWQ2ZBbVQrMlBQK2hzQks0ZHZQdzA0bTdB?=
 =?utf-8?B?VXdjRHROR0xKSlNzcWozQVVBV3Axa0NNU2NWaVJZQTJvQmZoUnpCZFNpWkhT?=
 =?utf-8?B?NVp2MFE3aHFhTWtlakpaZFpmaVZPdE1SQmp1a3VhSENmOWpBL2VXVUVCRkQ3?=
 =?utf-8?B?eEhsek9tRXl3eEUrQ1BNSmp0U01nPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dba044a-e2de-45a0-9172-08d9b0efe746
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 15:17:47.5789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2rttfmFHrdEx1qmbfS5FbqF+PmwM+74/7g9tc3GuQOHSlxQyEs/eRNG/HT9QsLtodoFW6VNBf3/85NEAwf2gjWcccyaP1cifbKQiDPwPjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3010
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10180 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=871 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111260089
X-Proofpoint-GUID: Eb5DnLSgO_MFH5cxYu3dLhUBylrSi9j2
X-Proofpoint-ORIG-GUID: Eb5DnLSgO_MFH5cxYu3dLhUBylrSi9j2


On 11/24/21 3:53 PM, Oleksandr Tyshchenko wrote:
> +	if (target_resource != &iomem_resource) {
> +		tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
> +		if (!res) {


If (!tmp_res)


> +			ret = -ENOMEM;
> +			goto err_insert;
> +		}

