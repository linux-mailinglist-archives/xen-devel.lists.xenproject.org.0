Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316765158DE
	for <lists+xen-devel@lfdr.de>; Sat, 30 Apr 2022 01:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317874.537397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkZn5-0006wd-0q; Fri, 29 Apr 2022 23:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317874.537397; Fri, 29 Apr 2022 23:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkZn4-0006u4-So; Fri, 29 Apr 2022 23:12:46 +0000
Received: by outflank-mailman (input) for mailman id 317874;
 Fri, 29 Apr 2022 23:12:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GAsh=VH=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1nkZn3-0006ty-NS
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 23:12:45 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df78cc84-c811-11ec-a405-831a346695d4;
 Sat, 30 Apr 2022 01:12:44 +0200 (CEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23TK7lpg025802;
 Fri, 29 Apr 2022 23:12:26 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb1n030y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 23:12:26 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23TNAfD8011477; Fri, 29 Apr 2022 23:12:24 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5yqpsch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 23:12:24 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 23:12:22 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::4455:2c02:503:a182]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::4455:2c02:503:a182%8]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 23:12:22 +0000
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
X-Inumbo-ID: df78cc84-c811-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Lz98BJlElMHq36e9Hz8KKUh019n0TcAOzbEM6bFURX8=;
 b=V5E/9fkBs5tswRDHdco2SnGsBR/ZPlrR3WM8XcqvZKsGkxEPCSjaTvwz1FYY4f8WqiEy
 l6jqnqgT6OVASlnWNd9y78QDUdCF34KREwitDunagX4pFSpCwZKO7Qwo7oH8j4bY+1vK
 Lqu/jQWkNFw5P3UmAJJS8ksXghB5nPMlC22kR0NdfeT5twx+/Iy7EMmvPiQiHY0vTPAu
 9iMp75P0+Xrg0OWkfccstZlFSIBmi7+DBqenT7Ea9rtajOAjiu4Kw3OnpB4URiFcuPng
 2xVAxFRheZvERuYBqdZ/ZOI5le+geUgmYhF7piBtTzOuL8moUmzb8S33fNr3xs8BEMQi 2Q== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJPlUdTVNd+w9JuSiacPs8W06oKuGD5vvxr207QIpztF9/bIx1sPtv1vfba+hFoQHHGQneKR59o72H5qoLsMpfdj1ywROjQYnUJJSOGOHBocfPDwpW9RqWtfbTC8uwOzB2CwIY/T5S+hx9X8cFWWAyTQu6kOiOfJ1ktqAMqmFwW1xr/GD9fm2Wo8M0GFn7QpcfoXf7gF1twQHBQmbxeS+OCh0Yo64/O4TjezxFZO/f3eQphpY7xdxM02leF85lq7naS+q4vMo5uxlTnffGZEeTyFiJgZxmIHh1HEXXxmEsPgaGcjkWTXrWY6/wBz8w0yKuT02WeZsKpZ9OXS0j3xGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lz98BJlElMHq36e9Hz8KKUh019n0TcAOzbEM6bFURX8=;
 b=RmXt58etNZcpQyQYnbr9X/qTx2vvBYV33ee7vrDed4ktaEY4neLl0nD8MKv97/0yaAKUQ9uBicHLVqKR7Oe3ADmIgf2PmgUcdOKHC4D1XnNUosC/p8A08wqlhw4XH8jFhZhbGDXP/NGMSquYp5ShGam8yC8ugdNLDCHLAuJ7QvsAbkvXyV9kIgt9ligBwXIgBVyUAaCucqUM2WNK8hJtMxoICHlSHgdCVlNHUMxds78TwuNc0jrLyoqfa2KZ24lQ86/OPJElrFQN/jpOhZIJdnVwKqPry2uyCyJwcSZA0QvcZ3N9DG27cX9pt4RyUIPSUKeus9NxpoFzRgx8EygIGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lz98BJlElMHq36e9Hz8KKUh019n0TcAOzbEM6bFURX8=;
 b=uHDHNaS+090jkGyQaixWzSXbrbarIZBiAAJJsTMSVeOJx/YjS1MCmdDG1HPmKxqhy+EHVa8XJNQYp37jNMz0Fk3f9f1V4NhDU+kfBH9QDmE0lJ9ZAj52Qa7N1Opzylxme59Jl1AOiyaEYvr2TSh+bh46cI+o4w8/eJoUn3F5dc4=
Message-ID: <41c2483c-ab54-41be-7815-9d4a98e0249e@oracle.com>
Date: Fri, 29 Apr 2022 19:12:19 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, jgross@suse.com,
        xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, Rahul Singh <Rahul.Singh@arm.com>
References: <20220423171422.1831676-1-hch@lst.de>
 <alpine.DEB.2.22.394.2204261605420.915916@ubuntu-linux-20-04-desktop>
 <20220428132737.GA13999@lst.de>
 <alpine.DEB.2.22.394.2204281449060.915916@ubuntu-linux-20-04-desktop>
 <27d39d5a-3b79-bdda-b7e4-f4477667919f@oracle.com>
 <alpine.DEB.2.22.394.2204281548320.915916@ubuntu-linux-20-04-desktop>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2204281548320.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0018.namprd18.prod.outlook.com
 (2603:10b6:806:f3::10) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54e65ddd-6345-4410-bf6b-08da2a35b735
X-MS-TrafficTypeDiagnostic: BYAPR10MB3240:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3240369FA95AF7066109C0568AFC9@BYAPR10MB3240.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pcdIrQ+QN9t/dKPwagQLm6siAUG4cTr6Jr8VXBYipTAnvDOUdQt33pUc6qkRr7836lIgipEwkJw1PbmQour2qD/kh+0LkXt8EK+QURy/8c3OOe7nJ2EhD2gq3fmuSXecCy7W0Ai+N8OD8FP2JqbmwBHH9SYue42UkqauCBpAFuLkPFyKxkATbS2+dAAD+Qsvw7yDJAtqRpdYPRsqHcZ9J5phKofIut4FPuFj1o2XF+BIt46hrXuZ8w4VwYLMbyzlw7Br75n6/6bstFHwKKaQNp02tDv0dUxdrPhbANSio9vYiQLbbWZ7eaZSatynzqbrKdF/FfIVr+z7aK5I4PFdiqX1xI9vZQn0flGqnJ6AEXrbilFcXOUo3Fz+9fSzts+HwcMYjGBB7+EyEJYgAn3QHQjvBDSIs/AaDDTt+BSVffnZSB20XiKpx6bFsKZEQ7cqwIGLbA3bLW//g3dAGW0pVatD9tayDFY0DwNvC8Dd/QatFqr6DVNoML/HGWawKa4a9vXJs9zMmLAaMEQYg/uIjwLpYGfuRtwuSma5MRfPh4lWasR78hUsTFYypmA9naBNYwxnh/Z1ayKkT5VETp4pzKbzv90vb0UfvbW+kj5ksHGn2FLynD94veLzJpid/82A4FP1II12m/cvUOFWNFC+K+HsfL+j0E7ioAitV7UxJj24UtPpx1s/z6xz2bak06mR4+ztWSyIlTFG4+ZQq/ZuFyJjpG/CyiiaYwnHIc42U9144ikh54YC8Un/y7BZDsBG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(36756003)(2906002)(38100700002)(5660300002)(53546011)(54906003)(6916009)(316002)(6486002)(508600001)(8676002)(31686004)(26005)(83380400001)(86362001)(6506007)(6512007)(6666004)(8936002)(44832011)(66476007)(66556008)(4326008)(2616005)(186003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aFJhWmJOVnIxLzZzelFHNzBkemp3QjBnSUJwN0ViQnhxcXAwWXNQVG9DTS8x?=
 =?utf-8?B?MWFFQkFiYnNHSUhtclFQVzZCQmJrRWpacFB1ZllvR3hxZ3o4cCs1WlhHUndy?=
 =?utf-8?B?SDA1WmlmUnhjUWR3eGJrbCtUUUNTWlJzeEtOQzA0OWN1Z2xicVNHYUgrWnBM?=
 =?utf-8?B?UWFMbkExWHI0S1B2OGdNL0xHaWNNaThMU0lpYXhQSmVsL2k1OXBGOXFGdGdQ?=
 =?utf-8?B?c3BCOVJZUVBPYThRc2xyd1lpZmJpOGNtK0svRTZ6M2F0QmFrMFZsTVhFbzRR?=
 =?utf-8?B?OEZ2eUhhKzViT2ZlMHpkTEtSTWhCSEo2TUpVcjY2MnIzVlpkQ0VPRGdaZmlW?=
 =?utf-8?B?VTlBM3hpaHdmdWo1SXBReFZPdWtRbk9HeEZMcWQwakx0YU1UQWpDR2dML0gy?=
 =?utf-8?B?R21XODlQSGl4WFFmbGJReVREUDErOWRJbWdsOHQvazZiR3RBWDR4Q0Z5WXpo?=
 =?utf-8?B?UmVsYTBVNDc4VHVZREtIRFZZT1VJOHlsYXE2VkVRcTJsYmdGcXlwY21TTnB0?=
 =?utf-8?B?UHkxODdTektsVzVEMHUwWCs0a2JUdFFNYytKdDV0S216YSszL1lpdlg2b3lR?=
 =?utf-8?B?Tld2T1lmTXVObGx3akhiYWpMOTlpS2tFUkVBOWo2UkRPNHNTMW9wVVExdmJm?=
 =?utf-8?B?c0dacXdpdHdNeGR2c1ZWN2UwU3o1VmtGUUQzVkJoRHN2Q3VEcU14dmpnejlx?=
 =?utf-8?B?NC95dTBHeGswV2kzUkJ6QzRnVDA1SFJpQndubTQvcVRiazRaazkxRDN6Z2Zt?=
 =?utf-8?B?RXYzZWxGUFJLZmU3cFU4WHVhK1JRVit1WTA0Y09OamNYV2g3NWc1L0NBbFBr?=
 =?utf-8?B?a2ZWNjc4NndMRmt5VDdjQmYvcHRNN0tIalJKZnc4VVdrYy9Na3RNTVRYY0dv?=
 =?utf-8?B?TXlYNGNIMHZVMlRMamx5M0lZcWNzeFRtdUxFZXh5dURiaUdtRGZ4RzBQUWtX?=
 =?utf-8?B?V3dHNHdzM2l5Tzd0akQ5ejN2OHczUlFweDF4TThveEhHc2JWcWpJbldJTDl3?=
 =?utf-8?B?ZzlIbFAyZGVJTHpOWC93dThKZUxtQ29Vd3p6dkVGbFF5NzRHZDVZbW0wTnIy?=
 =?utf-8?B?WEw5QUp1T3Zad0o4WVdKOWZqV3oxajZWa1VuUmdLYm5NR1NGalhaZjBoK2VC?=
 =?utf-8?B?dFY3YzJBNFBQUkxwdnpMN2x6TmNxaXFLZzFwOVRBcmd0MU5NQVNWTE0yUGVu?=
 =?utf-8?B?WEFmajRwWXF0VUtOSVFnQnZxTU5NeVh2NXU5ZjVuNWJraU5YdmdXNW5Bd01u?=
 =?utf-8?B?Sjc1M0taZmgzRmVoR1lxL3B1VVV4YW5aQ0NHSnNTUXRMY1k5RUwvaWNQYThz?=
 =?utf-8?B?NE90N3JjOExleUFlamdSU3pSeHJHSEdQSjExWlVDTk1mclNGTExBU3c1K2ZS?=
 =?utf-8?B?Z0J2VDJZRWQ5MWh5eG9udUdIMk94YXh2UEg1THcwcWp5V1BLTjUya2V6bXFJ?=
 =?utf-8?B?TVFHek5RMkI4VUw2Wm83WXNQWUNZZzkySFdXRHBJOW9ER0hRbndNTGFuRDk0?=
 =?utf-8?B?Mkx1bFY1NFd3Y3hyYTljLzRzUmdxTHFDcjgrdkVYd0JpWW1XdHBMSmZPd2c4?=
 =?utf-8?B?d1AvTy9hbDBrTm00VDc5WnFzbVpnWFptcCtqb3Jyb3pzcWtUU3RvVXVxcGNE?=
 =?utf-8?B?QVhWM1NMRFVGVUtHRVM5TndQdFBNMjJLbC8zNWp1RFh6cTJZWi84Z3FRUlQ0?=
 =?utf-8?B?NVRBV2JWZWpSZWFaaW5YZ0M2UEE1eWd5RjZBWDFQTkVqYm1EaHFKUEV0Mmk2?=
 =?utf-8?B?d3JGNFZnSGkySGM3bm5VRmlMVVQvL3RiTGYrNzFUMTlWZjcxRS9oZDYwM0F0?=
 =?utf-8?B?UDJUR3p2Wk0rZ3NjUzR5WnNPM0xhMTNKM0NIV2hCL0FhU2VobWZvRE4yb1Nh?=
 =?utf-8?B?N3RMUzhFNGpPV1VFNEV6VnlPay9nNW1qWkRJSHVNQWRWNzFWTm4wREhsb2p0?=
 =?utf-8?B?d2JYYW9ud0h5YmkzVGNIN1BuR051NWtTeE44YTlqUTNUeSs0d3FEQUtSMkVs?=
 =?utf-8?B?OVRaMkNSYUQ3dlQ1WEtJakVqalp6clMwNWlMbkJsT3FRTGpXdkVPZU14NDhz?=
 =?utf-8?B?MzNmdURNajZmK3ByTTh6WWpuQVZ1V2h1NjNNeStkVzBkYnQvZ28rY1Erb3Fl?=
 =?utf-8?B?Q3kxdWxkUnRBcURvR2pOKzFIRm8wakdkQkp4SGY4ei9UbzFqMlhlY0VpN2tm?=
 =?utf-8?B?UXF4ejd2R2x3cHhaenNtcDgvT2IvT3lkUERaa1d2cDdxbTVjWnJwclp4YmFu?=
 =?utf-8?B?dWlhZSt3Lzl3MDhrSUxqRTc4RGsxcVdOeGpSN0VGOUpUZU1MUXFHRFdHd1Zi?=
 =?utf-8?B?QlRiL2tRTFlMcTF6Nit4Wm5HNURUMnovUi9JRU5IaUlPTlBhSlFYQ3A1QjBs?=
 =?utf-8?Q?UiEUmnlu/p6ljwDc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e65ddd-6345-4410-bf6b-08da2a35b735
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 23:12:22.2982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DE7kAFmT7ScE/HH2p0uJ6vvZ0fcQzg3edZGnLK3WI39PVa+gDGjCEG7atH5KBt7LzoQQu9VAigJ0fRY2rX9G0CS6t8bLiT0k/3S6i2Y1sCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3240
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-29_08:2022-04-28,2022-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=969 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204290124
X-Proofpoint-GUID: 3RMxt3kjG13ZLCVJQXzd6Ph-dzYDBUHx
X-Proofpoint-ORIG-GUID: 3RMxt3kjG13ZLCVJQXzd6Ph-dzYDBUHx


On 4/28/22 6:49 PM, Stefano Stabellini wrote:
> On Thu, 28 Apr 2022, Boris Ostrovsky wrote:
>> On 4/28/22 5:49 PM, Stefano Stabellini wrote:
>>> On Thu, 28 Apr 2022, Christoph Hellwig wrote:
>>>> On Tue, Apr 26, 2022 at 04:07:45PM -0700, Stefano Stabellini wrote:
>>>>>> Reported-by: Rahul Singh <Rahul.Singh@arm.com>
>>>>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> Do you want to take this through the Xen tree or should I pick it up?
>>>> Either way I'd love to see some testing on x86 as well.
>>> I agree on the x86 testing. Juergen, Boris?
>>>
>>> I'd say to take this patch via the Xen tree but Juergen has just sent a
>>> Xen pull request to Linux last Saturday. Juergen do you plan to send
>>> another one? Do you have something else lined up? If not, it might be
>>> better to let Christoph pick it up.
>>
>> We don't have anything pending.
>>
>>
>> I can test it but at best tomorrow so not sure we can get this into rc5. Do
>> you consider this an urgent fix or can we wait until 5.19? Because it's a bit
>> too much IMO for rc6.
> On one hand, Linux doesn't boot on a platform without this fix. On the
> other hand, I totally see that this patch could introduce regressions on
> x86 so I think it is fair that we are careful with it.
>
>  From my point of view, it might be better to wait for 5.19 and mark it
> as backport.


No problems uncovered during testing.


-boris


