Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC3130C6C6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 18:02:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80661.147680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6z3h-000553-3U; Tue, 02 Feb 2021 17:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80661.147680; Tue, 02 Feb 2021 17:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6z3g-00054e-W3; Tue, 02 Feb 2021 17:01:44 +0000
Received: by outflank-mailman (input) for mailman id 80661;
 Tue, 02 Feb 2021 17:01:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xXB=HE=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l6z3e-00054Z-Oi
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 17:01:42 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88a52f97-ed8e-4d35-a616-f4ae4b13cf18;
 Tue, 02 Feb 2021 17:01:41 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 112GxaLt004533;
 Tue, 2 Feb 2021 17:01:38 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 36dn4whq4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Feb 2021 17:01:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 112H174C141785;
 Tue, 2 Feb 2021 17:01:37 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by aserp3020.oracle.com with ESMTP id 36dhbyjndn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Feb 2021 17:01:37 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4227.namprd10.prod.outlook.com (2603:10b6:a03:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Tue, 2 Feb
 2021 17:01:34 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb%5]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 17:01:34 +0000
Received: from [10.74.98.193] (138.3.200.1) by
 SJ0PR13CA0074.namprd13.prod.outlook.com (2603:10b6:a03:2c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.15 via Frontend
 Transport; Tue, 2 Feb 2021 17:01:33 +0000
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
X-Inumbo-ID: 88a52f97-ed8e-4d35-a616-f4ae4b13cf18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=PIlvO+rgtSQKk4bfc122PlbsI9JtFxoKSIR4QI30r6I=;
 b=paGPN7zBCXoMz3uQ6LNLgHSZbS2QP4/O+mgwiLoLtdLrMeKN4Fr2iia/E6c/avptZHYG
 KqNy/0Y4NeJGirBhVBpc57GwNAI0OVei02nxgWb+JI0Vbefi0CZIL+sbBYilBmYNLeK6
 YQa6IEt7lVjKdOUP2nVJ98agoECvCQ1GWwj3pWguZsvg0JohD9wyva5lmSV+uqva8P2y
 CIQQMhyjOYXvNWKkqUA3idF0z+zz5cqLfeI73mozz5D+4k8pRFOHu4Oi9U9xz4aFJRh6
 UqiJIo7lbv+mwaVaEfnJbEf2ERuqkbvIXTqR+qpI50z+tDgS/To4+Pil7YLqZ+MOxQ7t RQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJJ0pjmVN9/hfxhXbkndi3dcKfNs3KwTazkgqupsHLC8hq/b7FvPgQQthQ6r13KQL5nFItIxMDhi41If3o/9OrgPW44Ql69aFXrMVhYV4Ooi13TqA/qU6aNlFIR+jkQVIkua+b8fCbT2HsLCDaW+TIeA8XbZHV4Vyr2SHJodxoQ0qTcG5aNfufbt3qqrv5g2jmXrfTYwWFRW7E1cF7Dyq/2e0ogZLe0OijXQhZuRGp7xUMqoRojYJYIj6Ng+U2qopzqYCnv9DvWQaqDAzPdGotYvaHodbFCuabFfYTeB1KJzRh7XnWRe9U6i2GhYIm0Kvf91k9a49+LRIWnC+2KnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIlvO+rgtSQKk4bfc122PlbsI9JtFxoKSIR4QI30r6I=;
 b=PoJxpjD/TfCNpvhZRuwxFRNNcVHVOOKCoD5sracG6Vd/xNhkknOhbBgQNBLGHVwX9r4Vk0Tr5AF41qvOGklhXmCcVnpzE7DccznlO2m65mfAGA7b9mQ9uqLoXD2qJ9nB37Qp0di9BEg0jZ81qIAMbfSw1AWAIdGp6fhZ84Dw8edLOzt/c8t6iKFGCeXai365F/LyGbPm14wXOwUsy/tJsAsW2KRv6Y83r2vjuYjMv4riaysUQYraXXme1q+FuCV4C45AKkT2cy+IcjFVYqCw6Lo5VuBkAqqb5R9Su6SODknOTjAf1J/8nmqro2Jg2oS9tqYPIaKIyqgYbArTh79ksg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIlvO+rgtSQKk4bfc122PlbsI9JtFxoKSIR4QI30r6I=;
 b=u7crYMOSBthqxR48syBaKzd0bwJA1SG0ouc9uPFByLGd1x0bsEjofubmPrAIwcoKgeEC5eSOtzHzO/gPGvsaZU6+GeMg52UYuf4PQgAHmSugH3+ukcVFAtD6pjeUhXAxtPndnoyqDhE5KdtZimpAEZ8ImeL7kYUtqNagYYkepkE=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
To: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        roger.pau@citrix.com, jun.nakajima@intel.com, kevin.tian@intel.com,
        xen-devel@lists.xenproject.org
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
 <ba472bc6-a4e4-2e94-6388-0f9bf8eef3b3@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <fe920a45-7a40-5eda-7fbd-06b28fc545a9@oracle.com>
Date: Tue, 2 Feb 2021 12:01:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
In-Reply-To: <ba472bc6-a4e4-2e94-6388-0f9bf8eef3b3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.200.1]
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c11956f6-26a5-4bed-d5e7-08d8c79c3234
X-MS-TrafficTypeDiagnostic: BY5PR10MB4227:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB422711B1102B8B61F16E33438AB59@BY5PR10MB4227.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mn4h2wh9+EoneDDSfsg1CaYjaPK/jc7T9VNnudENdQYoiNqGFVgr7xqMAmPpNqESQnRRN6v+koMt6TX9jU6rwx6KrjLbLIfTrPTCrkA9GYiGqugTZvRhUU+N5ndPwLEqfr16O38SDVlRG7ziSw9cQ94Q45kHLw+D+uOy91Oq8jIfl2NLNqUtpk/NRVI8zVZMm9iY5ujQeYm83C2dinr6ZOQmbSB7mfDGBv0JiA6kcNIVTiMsp1+UNdwqp/q5itjHRhPVzf2AjfYfC5ps0unzzPIPFziQDZP9OBYiDxP0I+6s7KVExcdIautMsR6JV1Q0QwkwKDH6no22cPrkfaBIRybVG3T01Ws4adLXWdr4rtUMmoM6m1c4niKRSFwscFEdikOKazpTDICBJCfk/vwCzYS65kbAOeORH2m6vd1AxpLgGhGDsFg3t2ZUBXBX+VBvzX2Ziqn990QfdxFyQqBZ+e4A638kvrI3K9IjWTNUGDgidh5F5/o3i8stWTAOEY1kLVXCcpNPcOwMh08yZPhaZQbeU0F0JAxgzResNwrEVJVX4m31QzXAnNudc2Pck8i2IQPgFWj90cHA/OoHr/DZvKLPglLv4C4O6q8WZPmNMec=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(346002)(366004)(376002)(36756003)(31686004)(478600001)(16576012)(316002)(31696002)(66946007)(44832011)(86362001)(8936002)(956004)(66556008)(6486002)(26005)(2906002)(16526019)(4326008)(186003)(53546011)(4744005)(5660300002)(66476007)(2616005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?L2dFWnluOU96N011QUYrdkFmK05JVXAreWxIYzAvSG5JTWdISUg2WUJQQm9Y?=
 =?utf-8?B?SjhkbmM5a2h2cWt3aWQyREhWakgrVkUrYjVVUGhwU1UrbTVWTEh6ZkFzR3dV?=
 =?utf-8?B?aUlHQnc4WWY0SnlEYWpQQjVoZDRqV3pjSy9aUmw1KzV5UFM1cFhrcDlBUmVV?=
 =?utf-8?B?STQxVFh5UVB5VW9PdFVqTCt2RTlEMnQ4YmRXdWpJUVZvSW4ycW16OWFYQXRi?=
 =?utf-8?B?V1lwbEdVMUZKUnUxWmRFMlYzMG1YY2pYa0JCbzYxMDRSQWlnRXlVTzR3ZlpU?=
 =?utf-8?B?VGtQQ2tUSjNnOG5Fd1RpOXpEazM3b2lZdnUrSkl1WWZCc0lNSTJZR2hoWFlS?=
 =?utf-8?B?WnEyWHF0Rlg0VmtaT1p4SldNeWcxc2E0ZzlhSE1rVVJNenJZNzl0Zk5yb29t?=
 =?utf-8?B?UkEveXdMbS9ZMlNwLzMwNmEwQXMyK2RJZHU2NWoxVHNnbWFrKzBSOUM4Zkp2?=
 =?utf-8?B?ZXdUeWtjWHo0em5NdEh1U3FWOUhjSzlNSG1ySGUwUUErMnVoMXJJY1JTUU5M?=
 =?utf-8?B?QmpyNjQ5ZU9uQWwwMkhsNnpZZGtacXovTGVWSlJnZGdLMG5hRmhCYStmdmdB?=
 =?utf-8?B?ck1saTZoa2hieGtTVXdRVGlsYkhGa24xb1FkWlcvOWlpL3c4eGdYSHRyYXVa?=
 =?utf-8?B?RU1MUXprOVhDSFYrWGgyS1pUQVZyU002L0ZvT0RwV1NoNUdoUUhEQXBVa2Jw?=
 =?utf-8?B?eTI4RFdTd0hYSXVRZXRFd2xzenJ4Q1BDZFdLQTNkejUybm9rTE9pZk1uWisv?=
 =?utf-8?B?OE4xd0dVZ2MyVXUyZ01DMjF3N0tlWUJnV3VXS3VhYVZ0czlwSWNpSk1KMlA4?=
 =?utf-8?B?MHJQTWxpM2lVcGlPZ2NuUi9GRU91UHh0K0hXSTVNd1NjUUhlU3BzTXo0RzdV?=
 =?utf-8?B?MjdFRHlIRnFPS3dJcGhUa2NmRm9hTnBjVjdSNjFUZ1V5TlNSZ3MyVkZzOG1C?=
 =?utf-8?B?ZXJONXRIYlFYaVBQb1hvUkpPbFVNZnhaUFRKRmF1QnpwaVRzNTlRVEdXQXZE?=
 =?utf-8?B?eWxwYVlkTHhCY0JMVkxHS1Z2dlNGdTNyN2wwa3BDVUFoNWtVbGliUEdSVVMx?=
 =?utf-8?B?Z2gzTm8rSTcra3V2UU11c1piVms3Tit6dkQ2NDJDN1dUY3RYRWcvbGJBNUZD?=
 =?utf-8?B?WmlHTWRrTDB3bVdSVHFabmpYbnNxL2R0cElHNXFSUk9YMnN6Y1Q3Ry84dHRh?=
 =?utf-8?B?T0YwblduZXJlcTkwZk1Cd2ZYZGpxUlpDbFZ3b3FJbWZ2bmJ5Rm5LLzRXM01s?=
 =?utf-8?B?OERlTnkxZ2hnSjVRWTF0OFhWQ29qN0szSlMvcUpsTjBXTkpKckZmeVdOYUIz?=
 =?utf-8?B?UzhRckR5NjM3WGgwZzBaTml1aHJNSDJXdzRKOHpjZ1ZwWmRSN2hsT2crTEt5?=
 =?utf-8?B?WHgzaW1kMzYzUjhMV3AyWXl6WHBXZlFQVVFyZThwQ2szWU5NTU1TbDZIMm41?=
 =?utf-8?Q?nw1k04AW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c11956f6-26a5-4bed-d5e7-08d8c79c3234
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 17:01:34.6103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GT8j19AxwwznKON+i8gIrmhs3TTrhyid/Vrl+JaJQcVUO1Is6oUh6BxTZpKk8YGPh/7bBNB60UshHDdt43GQsPWiudr2MBrkdIruIkrNbk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4227
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9883 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102020112
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9883 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102020112


On 1/22/21 6:51 AM, Jan Beulich wrote:
> Also, Andrew, (I think I did say so before) - I definitely
> would want your general consent with this model, as what gets
> altered here is almost all relatively recent contributions
> by you. Nor would I exclude the approach being controversial.
>

Andrew, ping?


-boris


