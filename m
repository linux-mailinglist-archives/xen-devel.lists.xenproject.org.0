Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B733E296
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 01:25:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98521.186944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMJzq-0006u4-ED; Wed, 17 Mar 2021 00:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98521.186944; Wed, 17 Mar 2021 00:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMJzq-0006th-Al; Wed, 17 Mar 2021 00:25:10 +0000
Received: by outflank-mailman (input) for mailman id 98521;
 Wed, 17 Mar 2021 00:25:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tGkP=IP=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1lMJzo-0006tc-8G
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 00:25:08 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e45c40c7-8606-4776-b4df-ff5762b1d9a1;
 Wed, 17 Mar 2021 00:25:05 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12H0Dbdr128230;
 Wed, 17 Mar 2021 00:24:43 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 378p1ntc12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 00:24:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12H0FuaT030472;
 Wed, 17 Mar 2021 00:24:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3030.oracle.com with ESMTP id 3797b0t33a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 00:24:42 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BY5PR10MB4113.namprd10.prod.outlook.com (2603:10b6:a03:20d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 00:24:40 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::50f2:e203:1cc5:d4f7]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::50f2:e203:1cc5:d4f7%6]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 00:24:40 +0000
Received: from
 konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com
 (209.17.40.37) by SJ0PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:a03:331::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Wed, 17 Mar 2021 00:24:39 +0000
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
X-Inumbo-ID: e45c40c7-8606-4776-b4df-ff5762b1d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=ajlBZqg6etRYPnU9lgBgBWTJ3x93HiaJoEjobjGKwIU=;
 b=DEK439wemGAVuqgHCjxBKpe+OiTCLf3GJVoeuVxfVgV7L2xLzJVynSlgWGSuz5UdBTb2
 kZZX15lHwAAFh4sP4Z++almUaiC9WSCeESH4ar6uCcP8env3ZsZBhIqhfx1pfWySQj4b
 oqOofWW1AS1nvTStRdso5o6yVxbC6iZa0nHDiVpLVy1rKVbdmn6opJZbFO6L2GHVY5lY
 sBJRBFO3AR1go4B+6ufZcPPKF9E9UL059zdPnqN9VwlpJNHD/qDHV10aQ2HiGdpNKTHH
 hqPMQBbleT5tCq+rkwxq+LCRtd3+PKPm/tGxDBOH404gENSwg6ogq6yRglwd2Nam/l34 6g== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtUuh9Mhg9F8vSNFzz6E4JBR6RpqXRN/zBsvkR44cz0P05bTD8RoKPBK8YxxIxeI07DnYPJ9YcpTjkyro0Ym1yYwU995y6Mc6KeDgASDSViDoDI4JMInY+TyhOCwQyj+Jx7nqXEkkTtdvEup6NECHUjZeErDtFtp0ZB7vwvF+QN6IWj7JaCmrR3/7qLE/s6G7jf5cNZlr3R7BJYJud7/4En8+OF0/xSPtgIkqdW6c1V8xrikznpGTexZau7xiPERyT9cpQ08TAYph1dNoCayD/0XMPK6ucgaGzQSh4n5shOv4X5zWothUaKu1cU6dJ+Oeke+Pbh9BdSqFEc7gBod1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajlBZqg6etRYPnU9lgBgBWTJ3x93HiaJoEjobjGKwIU=;
 b=dOLDENHauXGEySfMGwA7hcII501RhZeTn7fcKuB90cyywAWg+8fG993YhrvifhG6IFFm5j1ZxnkojfQB+/QeZLwEciouhr8Ulom/85B8P45DRLHNW/0U3g1hWAUaxr2gXjeTH/bbFXjavtkUPlx0DGQxznqqwxLarKXNuhzsBUE7NG0VJeLW9oNU9t6+cZvMaIrQa14oQzQYXkcnqsbgy+fnh7ETVdkkrhRZF73jcsa4HeKKZGNa2PgLNYXwh1yxzl5G/Hjzrtwv0YyOLqC+a8B68qZrTj9f2hOJlngYANY45q9zrRNdxBA/EfkJPW8dYt2zv5NTp/uZsr1kv0O8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajlBZqg6etRYPnU9lgBgBWTJ3x93HiaJoEjobjGKwIU=;
 b=c7cEMMfJAORiEiTH1VG6G6k2QURYByDj4A1VxI50uIp7UAtNPuOv5a9UVkO73B+B3P0WPAR1AH/yxPVq2LiEGAY1QbYRJugk4BMTef0+dyl0uw5Ps8XVs9/iO1mUgmEERFCZb/XnEWS2g65lntoI/WO3ml+37wZUCA5yWSqQhvk=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=oracle.com;
Date: Wed, 17 Mar 2021 00:24:36 +0000
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
        xen-devel@lists.xenproject.org, Claire Chang <tientzu@chromium.org>,
        linuxppc-dev@lists.ozlabs.org, Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH 02/14] swiotlb: remove the alloc_size parameter to
 swiotlb_tbl_unmap_single
Message-ID: <20210317002433.GA80752@konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com>
References: <20210301074436.919889-1-hch@lst.de>
 <20210301074436.919889-3-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301074436.919889-3-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [209.17.40.37]
X-ClientProxiedBy: SJ0PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:a03:331::16) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 518c6071-4445-4074-d04c-08d8e8db0e25
X-MS-TrafficTypeDiagnostic: BY5PR10MB4113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB41132A1EC72B929F8BD34874896A9@BY5PR10MB4113.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v8J01Q++C1M0bY9xSJV4J6+AMmIvKZFMUnVCgCuaWf62kGns0Jez0Xx2EGsgywoIg+tneE5ji3/c5UfJOHEgQsU+WniYVY88uQSHqy5ARVT3XQYHECzqqLcJsvVTcTgg+Bgsh9UOeggB1pbV4bDWJlby4kkt0yF72BgE1CPob2I4Qm1PLBK06ZO8BCBEclEomevu2R+jnIhEwX4BhUy7r2xt1ZR9WsyeTvxwvXW8N8HxOiA8VcoZMGd2jOiN+0QL8354HmAtWs3JUFPvDb/nwJIi9GoGFfqmorw9CaOxNn4VuB2q27xQhfXfcHNM2e17MAEU20vDn3emIzj6gJcPcjIWt6MhDATq1LwM6l6a1ecFmKPPOhMdlUoPgTVnhMKX0tUeIW8G4DTm7U81x0B5kQthosybzaYdknIfDQcuXFV9mYFfSi7L4CZnNJDiTgZQbsSsbmztSjgdKUjFkKV9t2Lj/vUqr2/VaZJMei/Ed60o8DhRkIEpgfz/D+qHBaGBMk0YU0syZ4bgSjAqGxCyUIPXG6r61P0KZKsTBnMZnpw+/oeZaUTC7qErNZXxrokj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2999.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(346002)(366004)(376002)(136003)(5660300002)(54906003)(478600001)(4326008)(6916009)(316002)(1076003)(9686003)(55016002)(186003)(558084003)(107886003)(8936002)(2906002)(52116002)(7696005)(86362001)(66556008)(66476007)(6666004)(26005)(16526019)(6506007)(956004)(66946007)(8676002)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?2OiDiTVsNE3Hr73ctb1olDqr8owqrPQUiyAYgnup7uKhyW6EEWRLMMODlcOA?=
 =?us-ascii?Q?YNC9ab6QSRIOQUSCk2Cm2hK+3ITqaJhM6O3+Xn3ejKlPREWJDRgfzLniDqFd?=
 =?us-ascii?Q?pQrin8vC737wIi85qXvGL6oVh7lFLfJjoJLR4XwC9MIuJMl6cOUL4vA1pfF9?=
 =?us-ascii?Q?bWLtxrXOj0ccYKeQMxQlRSOXslpFzeqVqK25bZUDw4zalDqfYPGtZwZT4Sg9?=
 =?us-ascii?Q?ROU1mlfXZs1nTt5ianmpATapJowMzGNF+UKX5WaBanWTs9XgH3/c072mKW/c?=
 =?us-ascii?Q?GE9ZWwCQn4tc9qhv6Ym7V+Qf+WAYjHnuB6gKkqRtkvFoHxTCJAJiClr/PKNI?=
 =?us-ascii?Q?gAZUZUhM2e5lPvBdjSApftkBLdvWPTkPjO2BmkwSXXmAa9/LuEeL2Z2jhDDD?=
 =?us-ascii?Q?p6gTAXoWtK+jLZfGvSNHCNJ5SqQJ/6aMWbSF9kqjpzLrI1hydZ/uzhdKxduh?=
 =?us-ascii?Q?PxeX8sXj7xmbygucsKavcBwImKEbpCwg3mbsIQhPZcvq069Cym9dyNoZa3QX?=
 =?us-ascii?Q?TqHacX+CDga/MvVxdfNWt6sVolXruMu1fQ/cOccnnaqgkwc8sKF4jaAC3HMh?=
 =?us-ascii?Q?qnuM3HJgWvkwpKmbWYdW9ZtYkbzUm7RFaZQ+GLMj3kF+AE34ugGs4UckSFbx?=
 =?us-ascii?Q?huDrI9lRvJImAqBueSjjkNXOpnv8pfJGxyANuy7HgCyCYT9qnE5K0cHCwfGH?=
 =?us-ascii?Q?jOL9IP4Eyqr+UEMRVChRiF8kuq4xRGC/gWSznGPCLYrL9pAxTv2HT8kGcl2z?=
 =?us-ascii?Q?TqwpcSwn47qPQZfufMfPN55Z7sydijTwUQkPKTovACVw2PEDmxeIp90OkpoH?=
 =?us-ascii?Q?rx0DaJeOM/N3q6H9oQXKJ5SOtOAtHBY92iVW5FHkXefVP6S8h76iAX450HPX?=
 =?us-ascii?Q?/Jz3mj8s0yemegNyLRcGEqUkGXu5EbIE4+q8eKKWdRH0IuDFtpYxDgc5q0Uk?=
 =?us-ascii?Q?AMJmtiTMG+Sioq4g0ga2/giAHHCJMMRmjhu9TQanJ0l9P+kHnmEAKCDTKKQl?=
 =?us-ascii?Q?SrL3hqmlZXwbxUxJ30iq/SYRVznwMI5xPbkiTb9Mgip1XwZJn4dHpzs42P7k?=
 =?us-ascii?Q?5utDm96Ioo+LyFjJV7ROUAWhQjJK045V5UNrok8rA1DP4QDXyyMDQ8wZTGqq?=
 =?us-ascii?Q?gQpmxSZNup9POK+nfZ8B70Ei2SWFEKS9f3HR2fN84hlHeqlUBPjsipWCfRB3?=
 =?us-ascii?Q?V4qP+tTRwCjIlNLoVejCUWVRN5FQUSsm4eI4eqiJzsWUc0MgJDd71JvahrDG?=
 =?us-ascii?Q?wjFTMewOHbcJF3znkmQzFhzDLlbqT5YJsuOQKHnZ214apA/4R1lp5B9ea1nL?=
 =?us-ascii?Q?t7NgC1H7wAGANFaCOQUpf8p0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518c6071-4445-4074-d04c-08d8e8db0e25
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 00:24:40.7455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGS0AMie1F3nrVReND0XmoKp9saY/bwGAU2qblU3uQNo/h9Q1kpsbl2Yj5cC28bA6+Ec29tb7b6pkhZtJEj6Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4113
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170000
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170000

On Mon, Mar 01, 2021 at 08:44:24AM +0100, Christoph Hellwig wrote:
> Now that swiotlb remembers the allocation size there is no need to pass
> it back to swiotlb_tbl_unmap_single.
Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>


