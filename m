Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3654378B6F
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 14:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125174.235632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg4lq-0005PE-8l; Mon, 10 May 2021 12:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125174.235632; Mon, 10 May 2021 12:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg4lq-0005NN-5X; Mon, 10 May 2021 12:12:22 +0000
Received: by outflank-mailman (input) for mailman id 125174;
 Mon, 10 May 2021 12:12:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XNES=KF=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lg4lo-0005NH-SG
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 12:12:21 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7c0c8ae-5353-47ac-a2ab-575ec1e45c54;
 Mon, 10 May 2021 12:12:20 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14AC4omh072462;
 Mon, 10 May 2021 12:12:03 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 38e285a8en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 May 2021 12:12:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14AC5kVv174029;
 Mon, 10 May 2021 12:12:02 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
 by aserp3030.oracle.com with ESMTP id 38e5pv281j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 May 2021 12:12:02 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB3889.namprd10.prod.outlook.com (2603:10b6:a03:1b1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 12:11:59 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::819c:ca1f:448d:3024]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::819c:ca1f:448d:3024%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 12:11:59 +0000
Received: from [192.168.1.195] (73.249.50.119) by
 SA9PR13CA0123.namprd13.prod.outlook.com (2603:10b6:806:27::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.11 via Frontend Transport; Mon, 10 May 2021 12:11:58 +0000
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
X-Inumbo-ID: f7c0c8ae-5353-47ac-a2ab-575ec1e45c54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=rIcuE5kOedayuhR3R9WmVjbSFPpiiS9ZXiljrSfR7Z4=;
 b=OQ3NDsGZD+UpM/nL6miAGHoE51IGwL4/qjv+CpAJbppaxYxZ0LnR5lUh0Tqx7VlAr99N
 Wx8UhHH4BsAooIPR/0rQO62bcQJeWN+eNVqVzb4WwBSqnHH7buPAkk6NExJirZyjgQyp
 IwU9M3QnY5miSWEVSzZS/xaN9i2Iyzn2GZnaw+E7E/qZX8NiyFZTSpkx03moV44ej9tP
 hNHwkn5jka1SsFP8w05u+1tQQ4wTgQ1cdlfZO7RstJGJM3cdg131aJzXjllseWUzBJ8i
 1zc0FTYbPaJaNQ6tx5qQ61cEOrltaS9vpZWsDtN7x/QLtZEQwRLNR56SYeH9x1JFo2WU Dg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bq9vy0bcYQM0Rk/Yiq5Yw9SgFpFbKtviHuE7bNZG9yWng76ZbwogdtuelnsvOaSVlcsu5PDF2iqvaSmUgdKUwAtslpX7UfSFmCJpBwF+zlCs2OYLufYqm/PE1Jv3Juh4PB3IK6yGgkm38OTKwjTXMVNlTandXBHU3cGNfId1il5bmM4hW3VOCcretGno7EJr+0IRaat9jtlezDSGoz7gJGBhQ05PP5VbhBmuM76A3ypOOZ1npnYEW0jZX9MOwUoQn8Rrplad1EyqzpFBZjkstnP5rvGxq+2SimPY+uCZ5AkNlFKIyTSvqqciabZ5bWc2Gyndh8P+kuu/R1dcFvnH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIcuE5kOedayuhR3R9WmVjbSFPpiiS9ZXiljrSfR7Z4=;
 b=KMvTFH3UkJ4RIFiSFFZsVtU771rlVg5q3+ds//5aJZ75n/cokvNEX7ss35rfMlT1JkbMU2FXIPfwhLdrWDdJJF7UBkCvsD14+u2q07SMV88tzO166azsdMGvQ1D/cVBbK1lD/75G0aIDxRZXR0a8ZTuZjW4fVNvz5wAeSnmh1WGaaxao52Y1w9LRaJtkWDdyBTZtNzRRaHk/tKb4JoivQTiOL0M+eKvZs55ptL2Wv62vYtNUtQpYyugdolpenmOLyaWUbDrBq/lZtTFLUzPtXLlqxRbM9ZB6faaj4+dyJvJMhIBxsbyk/lQ66b6KBNAKLXDI8Mh8RBhTv2F7+UZ3Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIcuE5kOedayuhR3R9WmVjbSFPpiiS9ZXiljrSfR7Z4=;
 b=sq1b2UC/rvFUSGHijWtVfFZZWnges9C2YBiZcepHCkQ8Vltjc4qgbdYlOAyPh/2JQ5kGGDg/InSrtGPMouKkrDVZ47jh7DgvWPiVfqUgBcaWh9WX+gWP/V4zHhR6C3zBNALVeIVmEGFRqQ+uG6FIYlYy5FOo2/U4/8hpkh/WFa0=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH 1/3] xen: check required Xen features
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
References: <20210422151007.2205-1-jgross@suse.com>
 <20210422151007.2205-2-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <4282bb6f-1d19-4d00-d468-f5d4c7fb0f90@oracle.com>
Date: Mon, 10 May 2021 08:11:56 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <20210422151007.2205-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [73.249.50.119]
X-ClientProxiedBy: SA9PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:806:27::8) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17806bd3-6ce4-41f6-05d4-08d913acd002
X-MS-TrafficTypeDiagnostic: BY5PR10MB3889:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB3889FC6E7DFDFD6745AC8A008A549@BY5PR10MB3889.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f6WQw0UBiS8ehGnaqkq9g+u4jmrCDT1dulzeMYi3fBQi7haXs5qN9tzVMge/uPu7q9UiMRsdIAnY8z06MZxJCIFMO5M6fqVgIPO65XNzV+aWnD1YSYILXTEFQXRcpMKbrDBvQrgKdxWgC8iPh8tal2wLnp9WA+sbHLXV+06CBWDmOlvNcQ2ruxflIe9HBqPtP0zjlcQcXOvwpCPZVKoI7DH/cr9aPAc2t0kpjXIpvcuXEVQcjrDIkIpEBvtYp0yl9p3HoqernDw5hTAPPSeawqATN6BoBCqPAv0OzYH1gmAPAGZ4sxEdC0FVremrWLipchubhpfGa+DrBwm5Hk4ZP4YG3IvDsUSXQTdy4P4rsWd1ulHRhgCPjUHSnH3QWbswTSgeK5MYff/WhhfbQlr16TYoW7zzVp0nNfCe4RZEVYd0U25hSdev1hsYiUgcm/dZZdQ99g/tk2SzBWxeT7kkGxO8lpI/OAmqLV3gfdjSk/blSkQDYRj7Rirv8w14YOKHLZX0AHoXEuIjh4t4i1/lLOOvJp9S6jhky1CMPt/Doq1XtsUVIdAR5O/pRQxfCdtfmjMhZU1nC9MJM0p5FwLkUO4cCn0j0PsctiPoRCuO59tODYD+bjkGxevdOd407/Tz7cLMQExqKKZ77WuRROiaMtyRPmpRyf9s/o8tmZVmWQTH6SRIG6ENhKr3TR9+pzlv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(39860400002)(396003)(136003)(316002)(4326008)(66946007)(16526019)(16576012)(186003)(26005)(5660300002)(36756003)(54906003)(31696002)(6486002)(44832011)(38100700002)(86362001)(31686004)(66556008)(66476007)(2616005)(956004)(83380400001)(478600001)(53546011)(4744005)(8936002)(8676002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eDJxZFRSYi9KeXhDcWJpcHhwc0ptMFVweGdqYXVHakhjRzA1eWp5alBGeVNu?=
 =?utf-8?B?RitQQWFDNVc4VXo4WC82T0tFdVdlYU5lMDZNOCtrZDNLUW9kYnVEalc2TlB5?=
 =?utf-8?B?eHpFTHRzbkhLZlZ2a1ZISisySnIvbGlXL1ZpemxiVDljNnJ5YnpseTlWcUF6?=
 =?utf-8?B?MzUvTUpXOVExbTBzZE5Ja1hmallWVXBGeEpQUTRBb2NVbmxadkpVRGxKTk9o?=
 =?utf-8?B?QnNJTkRJRk9TdWpRUW4yN3J5cDJsem1sMmlLdkJGanFtK0lmaFppTmdrR283?=
 =?utf-8?B?V3BvNGtjbFV5K3Q3WGdZanlyZzEwVVBMZUhveitMWHRMMk1MNG1zQWdvT3E5?=
 =?utf-8?B?WllEbUgvNnBnL0NhVUVMQnRld3NiL2VZZ2JTZ2UwVnlTUEtsdVhJcmcxSkVR?=
 =?utf-8?B?UnQzSzhHVE5rNGNQNzVKSzJSZkYrTHhaUS9SL2RyZWZrMi9jZjhlaER5algz?=
 =?utf-8?B?M3NaQTVKWnR0K0JqMGtOSXozQUlnaVVnY08zNXBDVy9JbUpZWUdmZXFsSGdh?=
 =?utf-8?B?TllOeDdabXFwVHZLeW8xUWxuRzVobzFSTDB6dkFFQ1Bab1h6dkZPcGVtdko0?=
 =?utf-8?B?MkhDd0JtSWZLczhvaUp1STlPYmJ2eDNLeEs4QU9ORmQ5aWpqSWxaY1B3bUdM?=
 =?utf-8?B?K1lKaE5CKzc2NTM0cHo5WGJMNmxTMll5QTRHVTI2VkJDaHBjUWtjdXdNV1h5?=
 =?utf-8?B?ZEJPOHYrZVRsSUpPSElUVUZ5QkpKRXZYbzRPOXZZY1gyN1FaMnZXclBYQkw5?=
 =?utf-8?B?YnBJeldEbExpMFFURTVtM0FLVUsvaStkQzhLbmxkVVhjT0U1NHhGZGp6VE8y?=
 =?utf-8?B?RGpvTFVrTjRzajE0cWpiQWpZNy9RQVplMFFlR1dub1hIaGRZczlCQUNnRXZW?=
 =?utf-8?B?dnJqVExkQ2prdHR5YUN2S3c3Y2syampPUE5vQkcxZjN6eGtVOGt6UDdrWlRY?=
 =?utf-8?B?bVdEWjYwa2JvQ0xsVStsT1ZZL1QyZy9kcXZMUUlLZ0xraHAxSi9pWGkxdld0?=
 =?utf-8?B?Sjh4d2owaEUxSUI0L2YydGdvcTNOelFQNjA2RjhKUjdldVc1YmtSZUVyOTU5?=
 =?utf-8?B?WFdQeHVZdExUOTVaQUJ5UElqeXg4VzJ3OTdyVTIrT2tMZ1MvenhUZG52YWV3?=
 =?utf-8?B?RVJJSzdZRU1nK0dEcG1LSGFlbVRENGYyMW1maEZscUNKNEJUcDhOaE9aZVpZ?=
 =?utf-8?B?WFdsOFZLa09IUXMvTFI1aHVJS0lWem5DLzI5L0NzTTdTRTNRWlJKYXFqNWRI?=
 =?utf-8?B?azBYN0RFeHJxdDgvSW1FUDhYbEF0eDFZekJHOXhrdU1BV3U0aW00UlJDRHRW?=
 =?utf-8?B?Q2ZQbHFobmJtVWxvcCtKKzRQODdrWmJDOU01aVovMGFjTU1QNlBsWnc3VVkv?=
 =?utf-8?B?V2V1b05GVUlCQ1pLYklJUG84WmJSOERpSm1QRnpzeWlKMEJqSzZRN1ZpelYy?=
 =?utf-8?B?OS9iRUdIT2VCWGkrYmJ0VTNuSndORU9jdkVLemJZV2hJZzVqWWZGcDBCU3FN?=
 =?utf-8?B?VTBSZUlORiswOWl4QVgwa1lPVkNWclFQSlR1Nm5oOVFHYVlQSVZxY2xEbG1U?=
 =?utf-8?B?eXZzRkdBb3ZtOC9nVi8vdkQzMlB0L0NYWTZ3ZDNodzY4c3pCZ0JXRnFHS0VG?=
 =?utf-8?B?RHRualJ4eE0yTTRMSHM1K1Q2QlM2dnFIOGxUaHM2N1dVaUk5MnJSOVNLOUs0?=
 =?utf-8?B?ZDNtemNLUTV4cVdjMktRNVIxaDdCNkM1NE5ZT0VEanRFdWdiaXBtbzBkQnZK?=
 =?utf-8?Q?28A3wM0muX0bCyp6+8BAt2jSF/gfDk6nl/+uOtM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17806bd3-6ce4-41f6-05d4-08d913acd002
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 12:11:59.6121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdtap1MUo01iyOxxbDU2jeY+Utlm9nLyZVtmj23zmvc+cdpVuyIx8LiuJ3ow4JZk3d51Fibq8ahaAdPyrNmAXEEj4kiITWqc/jD/50h7Vkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3889
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9979 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100089
X-Proofpoint-GUID: AfmjJP8iHAb3vGWGmOLhqBTsqo9aLmpT
X-Proofpoint-ORIG-GUID: AfmjJP8iHAb3vGWGmOLhqBTsqo9aLmpT
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9979 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100089


On 4/22/21 11:10 AM, Juergen Gross wrote:
>  
> +/*
> + * Linux kernel expects at least Xen 4.0.
> + *
> + * Assume some features to be available for that reason (depending on guest
> + * mode, of course).
> + */
> +#define chk_feature(f) {						\
> +		if (!xen_feature(f))					\
> +			pr_err("Xen: feature %s not available!\n", #f);	\
> +	}


With your changes in the subsequent patches, are we still going to function properly without those features? (i.e. maybe we should just panic)


(Also, chk_required_features() perhaps?)


-boris


> +
>  u8 xen_features[XENFEAT_NR_SUBMAPS * 32] __read_mostly;
>  EXPORT_SYMBOL_GPL(xen_features);
>  
> @@ -31,4 +44,9 @@ void xen_setup_features(void)
>  		for (j = 0; j < 32; j++)
>  			xen_features[i * 32 + j] = !!(fi.submap & 1<<j);
>  	}
> +
> +	if (xen_pv_domain()) {
> +		chk_feature(XENFEAT_mmu_pt_update_preserve_ad);
> +		chk_feature(XENFEAT_gnttab_map_avail_bits);
> +	}
>  }

