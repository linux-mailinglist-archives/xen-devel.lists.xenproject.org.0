Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFFE3375DC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:38:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96634.183022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMSJ-0006iN-AV; Thu, 11 Mar 2021 14:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96634.183022; Thu, 11 Mar 2021 14:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMSJ-0006hx-7O; Thu, 11 Mar 2021 14:38:27 +0000
Received: by outflank-mailman (input) for mailman id 96634;
 Thu, 11 Mar 2021 14:38:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QxnR=IJ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lKMSH-0006hm-K6
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:38:25 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7752ede3-6ade-49b2-8c67-15ace844955f;
 Thu, 11 Mar 2021 14:38:24 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12BETaGF115251;
 Thu, 11 Mar 2021 14:38:23 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 3742cnerwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Mar 2021 14:38:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12BETbF3021127;
 Thu, 11 Mar 2021 14:38:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by aserp3020.oracle.com with ESMTP id 374kn2kqqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Mar 2021 14:38:21 +0000
Received: from MN2PR10MB3293.namprd10.prod.outlook.com (2603:10b6:208:12b::24)
 by MN2PR10MB3422.namprd10.prod.outlook.com (2603:10b6:208:122::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.29; Thu, 11 Mar
 2021 14:38:20 +0000
Received: from MN2PR10MB3293.namprd10.prod.outlook.com
 ([fe80::b87b:5cdc:87f4:c465]) by MN2PR10MB3293.namprd10.prod.outlook.com
 ([fe80::b87b:5cdc:87f4:c465%6]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 14:38:20 +0000
Received: from [192.168.1.195] (73.249.50.119) by
 BL0PR05CA0030.namprd05.prod.outlook.com (2603:10b6:208:91::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.10 via Frontend Transport; Thu, 11 Mar 2021 14:38:19 +0000
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
X-Inumbo-ID: 7752ede3-6ade-49b2-8c67-15ace844955f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=3zenU6wUI6nu7AkNiLmoOAASqEppMDw7XNV/IEqijYQ=;
 b=aFghWF8ObiBMO6LZzkvlge5hC7tJ1lKM1ufQT9jZ3SFPavAStT4pEl2Np1cs7KlhsVBd
 K70wCYtKDfLb+4BGSgAlX2QA+N7N3VtfUnRAQycVfK/jtwXSEVovdjdnSYni/f/kzXjU
 b68MyuqAzpw9wIvYPTWuFh/75w9bwCRohwbrBccxwhMCEwsUa0bCBHZ6LrGyuvu65F5I
 EB93QWD1oYXOxCPL8cXV08kANSy+RIATbNl/N10ozJcP+baC8ZHGRtM8coar+5JLkPik
 IsvlJoityUNfGjukyb/VrbmqjyZaH3A9ugPAFheQmupUytEqax+vsU18akuTkaqsAwgR XQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5t7QxLLq+qQVC8GwkvE+VpSkazz5BZKfauc0HfX9QAqtn825776qE9hGEG2U/7H3Xe2wB+ae1jv1u5i4GPPcCKbM/wFqY+A2RlaqE1qpD01/z41ikRfoEgkUboEOF3y9aeKSeI6qS2OM+V5nMgwqlSnnN1/IX4tzmyS6A99Vru4k4iyqx7phK77I+9tN7uj0NLosWZ6g/t4QJwMjjaziXweWwC4tSnEhFdDM3iIra+J6PiwzpL/UMPYVSH7KYnrNT8iFGzE4Ein46tc/nUPonF5U2SdfKrpz23jP8UAt79sBNGC7KxJ7c9OYpehgxt4q5wbckRQ7qoIgCcOFrjoJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zenU6wUI6nu7AkNiLmoOAASqEppMDw7XNV/IEqijYQ=;
 b=TklB3qDU/3VZpDFgtbh1hZ3cQnyNX73oUyNlmQaVQTG9+bTNVDtmCdpNarRVVO6WRF1J/UcWDTNGp4CtCeidCrS/V8lyjZJDESc9fa5mHAoAdwHyYN4JaRWLNTnWbiQyIf3S6PaLb7u1s+lLMB9/HAol4sFAw+sTA52bL80Of3OfF++b3+Qj7glPGCzJDheSInuQcN6yXAQkCEJN8IO54S27KY6n5uFmSi3ERYXJYZeDWNx7TjZR9JAMa5hSpL+ZYYCfBHnzir9EdSHA2mQ7RGrDyzgPE/y2r/Qy5oJ9EQjqJeTHqTKHq6/048utOSdHpiIN9iKMtS9Lg/Yoz2bcRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zenU6wUI6nu7AkNiLmoOAASqEppMDw7XNV/IEqijYQ=;
 b=FQeWyspl22JfanHRUWTizE0lyPLVhI39yWs3yJsv+bT31JC0N1t74p7jJRa89q+SdWl7kp+d2z4BxmO7OhmKXPqEX5F3gjLWlQzhrSL4LeneC5GdJLdDTongMdgv4fj3v/U3HIlagh0zsYNOmdFVJJjhE+daPmOALx8Q4dzi/Xw=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH 0/3] Xen: grant table related adjustments following recent
 XSAs
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2b326dc6-c624-c97b-f9c4-4cc68dd013ba@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <9d89a640-3fc2-756a-42f4-873be469f44f@oracle.com>
Date: Thu, 11 Mar 2021 09:38:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <2b326dc6-c624-c97b-f9c4-4cc68dd013ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [73.249.50.119]
X-ClientProxiedBy: BL0PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:208:91::40) To MN2PR10MB3293.namprd10.prod.outlook.com
 (2603:10b6:208:12b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0704257b-090d-42c1-cdba-08d8e49b50d7
X-MS-TrafficTypeDiagnostic: MN2PR10MB3422:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB3422F9CD95756C5CCB45B5148A909@MN2PR10MB3422.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WUz8x79/Al9rspRK845ZYjxt52CD53p8NOeNXKeEvA2bBXTTcxH6AYgWX2WlLS64Agr7vpx36kne0NePDy+BZb+mFyJ4dYon6SrzOs6vPGZvmF/8JsaMBvcbw+DWrUuKIkg1iX+G9gZkUjD6nRiC0E7jCnL71ubvXjAZ59Zdd9dX+u7Nqu/lnMiMrSicApVay5HgVjxwGfEuS8funUa4EeIgioOvfT5CiuKKtR7mV2rdosnLFccTnebbpXuHgrj3yYyzfHy9TW2/4bfds07cWJqdVneGJYHgXsf2xApxlJIjkQTfPz+B0TQ9ZWAm1NNGHMtYqhd/FD4mKtr90IeTVo7HYgFusg+ryyW65LOi9eQqD2sSwnfCnKNLV5zEMIjEe4+7QPz4JIt+xo1uLc6p4U2VHcUVi3O/6Ek2wII94DtLi8L8Qksm68zktdSMAEgkTfnm8LoF8VMrzZtPpjIODbSiiPcy++03MJ90gLgnoVvizvIz4lihuGoiHuG934IoGrRrDY34CQFoBceHyKxVWqZ325O0obpIakNBIvJFIPomnIvL9viJYW+3ucEmUG1avMVBlQvKIymlNB868kC+1+3UkGoTOsYZjkFr5qpvMzM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB3293.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(136003)(346002)(376002)(5660300002)(8676002)(36756003)(16576012)(8936002)(2616005)(83380400001)(956004)(4326008)(110136005)(86362001)(478600001)(4744005)(31696002)(6486002)(16526019)(316002)(44832011)(2906002)(186003)(53546011)(66946007)(66476007)(31686004)(66556008)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bzdlR3F1aWp2UWprNzVwMGpRTTcvM0IvMVkwYk1TWjNrZzVGbnVKREtJcG5i?=
 =?utf-8?B?bldiRVZLVHhBSUlEZDRoMmJTUlpSNGs4OWo1MUpZQlhXanh5bVhoMVQxZHhr?=
 =?utf-8?B?Ni9tRkVKZEEyZWxxZkpMNTFyT0VVazBrM2VBdGpEblZxcWtUZ0xmSGZ0ekhz?=
 =?utf-8?B?Y2YvNSs4aW4zMmJBbm12MkQ0NXgvT2RqZFlZdFBBcjJIaWxTMzVVTlplMVJC?=
 =?utf-8?B?VlNsTEVxL3lkS3BHL2h3b1NCWnl0Q1RqNUN5b1RCS1hNNS9NRUxSeEJLMEY0?=
 =?utf-8?B?L3hIN3JVaGprd2ZKWko1dkhVNGc4RUxQMVlrWDg3THZZZTIyRzZqSlFOQ2Fu?=
 =?utf-8?B?UWdNV043dm14UjdKNk1OaDhiOGdnai9nTFJRVjMxSmR4eW5BOTBMR1kwaEFh?=
 =?utf-8?B?a0pmR1NwYU1ySVVOWFFQWGVlNnpEVlFDcUpwS3dUTzZ3aEtPa2Q4MXR1WkIz?=
 =?utf-8?B?R1JPUHY0ajlmd3U5UTE3Z1JLckFMMEdNRm9ROE93a0Z3WjVpUTloaTJiZWRL?=
 =?utf-8?B?b3ZZWktvaGdsWWd1T3NndnZ0Q05uN2o3QUFlRzN4Ui90N2JzUEUvU2thOW95?=
 =?utf-8?B?TEJ2UDhxV280SytiRkxqV2pac3ovWWN5RXowSC85VVFOYjBRS211bDFXVExz?=
 =?utf-8?B?Z1lGTEFKeGsyd0ZCZHdaQkw2MWpkRzZXKy9pKzlKa3F4QzUweHF6MVdlZjF1?=
 =?utf-8?B?bkdLcGVOd2o2OFZaUHlQVy9vcGh3dk1OTml4WG81MG9BeTkrOGVTMHgwMm16?=
 =?utf-8?B?QWYzTGY3MFRtVVpTNDNaaWpMb3JiWWJEMXlyTjNGajZ4UUlzb3A3WEVDZEVF?=
 =?utf-8?B?RWhUZHVSdTU0RG1CRTREZWUzZ1NkQldBMlhKSmVKblNRQ3pvSmdUTzFOdXdu?=
 =?utf-8?B?QkNYZzYwQTUveW5XQ2hsNFA3V0NsNGQ1WndyM2VJcXozSlgzbXZ5UHRQd013?=
 =?utf-8?B?ZG9FSGlLVTFRVG91TzQrYTZQNDdiQ3FVRTAyV2t3L0dLR2hLcGlDNUJRT3Nr?=
 =?utf-8?B?TmxqT1JjSnRDTWp5K3dSWHhuRkt0K0FWM0dqZUxPRm5WOGt2UUU5b3JoQndR?=
 =?utf-8?B?TXdPYTUrU290Qm1QbERlQUkzTHdmL3J4V1ByTTVlNUEyRkdheWtpS0RCRGxo?=
 =?utf-8?B?Tnp2Y3RpaXBTSFBQeVlERGhOdjFETUc5K3VudU8yWjI4VHlWbjFTMDZ4RlNH?=
 =?utf-8?B?dGppemVTSTF0aGkyWDdSYmhUeE9Yd1g4WW5UM3A5OFdsclo1TGlYS3J6OXVq?=
 =?utf-8?B?SzYwY3ZYS3ZhYUxmVHgxN3BFcWpYc0taT3k3R3gzTnpYYUZxUis0SUhFQWRB?=
 =?utf-8?B?bkIzTTZrbkVpYW9DVU92NkhsZ0Zlai9iMGF0ekgzMU4vd3EvUFBRcnpYRTVp?=
 =?utf-8?B?dWl2T2pzWExKQVNtQ2RCeXF6SG54cHB4MEk1dFBkTUg2TGRocHZNOW9za3NM?=
 =?utf-8?B?MWJmejlzeHVNZGhMdHg5MUNXWDVmVmxHaDFiTkRPdmoyT3NDZXo2SlVpL0R1?=
 =?utf-8?B?WllZRlpRS1JVcHhlak1KemRlVlVkcjlrZXFqcXFzOG96MVhVdDIyeXV1ak5u?=
 =?utf-8?B?RWo2Tk9yWFhhVUNuRFdFN0ZLUEVtY1J0K1BSc1I3ZWtGUElmcEYvclRLSXVT?=
 =?utf-8?B?T2FBMVlpbEZJZGlmOU40Y2dHM3pSMFVLRUt0MmtvLzgvejBuV0dqcTdVdERF?=
 =?utf-8?B?SVdGRGdlR1YvR1FlUnZPOHpYODVkcG5namdoeHpmWmVUeGdOYnE3Z3VvRWtu?=
 =?utf-8?Q?Quv40zk+/eRZEaVxzY6TaCwqUpcrgvuyqewBtcN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0704257b-090d-42c1-cdba-08d8e49b50d7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3293.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 14:38:20.1378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ir6UwA6d9lWN4EqPPNZ3lHqqtgpUGvtbOf/n00qu+pW53fCKMJP78uhGtVoJ/Nzi8w4EmdjgFod/wkTlBV5KK2AV6eq5j1iYE4pmH+bFIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3422
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103110079
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103110079


On 3/10/21 5:44 AM, Jan Beulich wrote:
> While addressing the XSAs a number of further oddities were noticed.
> Try to take care of them.
>
> 1: gntdev: don't needlessly allocate k{,un}map_ops[]
> 2: gnttab: introduce common INVALID_GRANT_{HANDLE,REF}
> 3: gntdev: don't needlessly use kvcalloc()


Applied to for-linus-5.12b


