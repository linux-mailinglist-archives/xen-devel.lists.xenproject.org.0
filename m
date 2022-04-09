Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A26B4FAAEF
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 23:22:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302279.515900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndIWi-0000ja-1j; Sat, 09 Apr 2022 21:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302279.515900; Sat, 09 Apr 2022 21:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndIWh-0000ga-UG; Sat, 09 Apr 2022 21:21:47 +0000
Received: by outflank-mailman (input) for mailman id 302279;
 Sat, 09 Apr 2022 21:21:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7tuM=UT=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1ndIWf-0000gU-51
 for xen-devel@lists.xenproject.org; Sat, 09 Apr 2022 21:21:46 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d14d6ff-b84b-11ec-8fbc-03012f2f19d4;
 Sat, 09 Apr 2022 23:21:43 +0200 (CEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 239FYCS0032238; 
 Sat, 9 Apr 2022 21:21:33 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb0jd0tkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 09 Apr 2022 21:21:33 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 239LBvrH021102; Sat, 9 Apr 2022 21:21:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fb0k0xjb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 09 Apr 2022 21:21:32 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by CO1PR10MB4612.namprd10.prod.outlook.com (2603:10b6:303:9b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.27; Sat, 9 Apr
 2022 21:21:24 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::4455:2c02:503:a182]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::4455:2c02:503:a182%9]) with mapi id 15.20.5144.028; Sat, 9 Apr 2022
 21:21:24 +0000
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
X-Inumbo-ID: 0d14d6ff-b84b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=kfzCGQd1Nq4aQYkJnXe92vORk9AoNiTf10+KM0SVb7k=;
 b=HxtqDu8AHURDIZ92JNEsLVBO7DOjXlHakdabRqmaTMWKYrDU5id2K/tJJh+8dCq3gjzj
 QtrctouMe+qCwRqOhTxhtAxDBw8nIrlanS2x4iF3Hm+Nq58X1S14snZM/u7DxWEDPu+D
 OwhEnNVr/xuH0bUmbkTEiiG5rlc82lg/fhhjkAOhhYhz9G6dnmNK8n4/9JgCAhoA6vFN
 k7T8doWDBkg0Tyj/CpkRPMYC1nOsAeMqOXnZbn3tkS/TKwcG608M9gH0N9NShfme7W7j
 W+fFC0E0eHARXbc9DR9P0nTk1pclUbTwZ5bXjzcDKT8emfCu1lsPBEv3HzQoDR6okuET ew== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GriJYa4TZtbHtGR8GbvSfXNlTZu7agBnWeGbNWb0YymyBE18yxWvoM1jlmYl8IR04oOmP2DA5Or+ENJInOx5e5oAcgSHp5oTrN/lmXldv2nzJSuK+eCVitNeIkt71IMzrwBJAwgQLnLKdOT1pgfmpo3BtV4ivx1eolwT8A2SNTP/3h9sF9t/5CI6ddIxXBvoGffYrzKNqtlYz2DjjX7J/RyKViEmVVrhvj+VXYTkYzr95ahZiq8lalZcYaV0+W1ajIo917kky6/dcxf1w0hTmhsp5p5ISZgzD8/1ghSgM7WFt06tkEfIHQQSzxap4jJiFzZ2FKzp0YnLTIXkf7kQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfzCGQd1Nq4aQYkJnXe92vORk9AoNiTf10+KM0SVb7k=;
 b=WP6PtMlRGsaq5PTgfhPbIi3GDr98wUMAPa9lLbyGS5C0f8f7V/3EWeUaWVfMuxzgXtzWheqN267wG1yEX/Bek0gXxrldNBCoX5kpg9PVK45QZFQW4W4MYjFn1Ot5QslV3PUU6Iqu83nSP6HJlscAVIAkA4lQYxVZLl+mJx0jtgubdnbADA/Hf+9ndGmBdAanrSa1Z9yZW1kYW+riFrOZeyYL26loL4AWSHyfQmXvBmpwL7cYILFGKugRRv5C+V6leH5xvqEX361EJN0kmCYkOrHSMW4VdJg65Ozi1H2wZSEeUJtcfruO7JWsr2lld9ZkvlncLwd8G7TKd5S3PZnJhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfzCGQd1Nq4aQYkJnXe92vORk9AoNiTf10+KM0SVb7k=;
 b=nOfu6Sue+rJzhjyLRtuh/g1AO4QOF4oiE7eGilZLincqfggq+4WcXvOFn88i6y1aQljUg97XPn2SYrqfhyfn6E73/nhBO49yE17tKyTEjGn/W4OSKgIggBjrT9qRDpigb0Eu2o8WdEWCsEJAQSmXma0HP5AoGOTLJ+pO1Bp7poY=
Message-ID: <5a1aa65d-1abf-6489-867b-fb84de804de2@oracle.com>
Date: Sat, 9 Apr 2022 17:21:17 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] xen/balloon: don't use PV mode extra memory for zone
 device allocations
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <20220407093857.1485-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220407093857.1485-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::13) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed109f35-c0a5-44e7-378a-08da1a6ee60f
X-MS-TrafficTypeDiagnostic: CO1PR10MB4612:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB46128D9E34F39E3B4776E74E8AE89@CO1PR10MB4612.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zzNhnZakHQJ9mXH9meRrYNbmGdGlTOJa2HcioZuK/68SkhCk8nWEFEPiYMKpIH54v3LceqM0ns5I1pH0g+IVOsuBndts99fGrk15dndOJtANukPIfl59JpuulDuoAfvbaZHduZ2Yr45rPrIv3g2zIqnm5VBx8dq1Tpx2pEBMXG6vUXGhZj0c8FYTHQc4KIDc6vkEjXOm5vjcRkUC+UaBVdHRK1qK1cxg4g207BH5FVSkJGLFA1w14JKyLAJyxnky0Yiq557j5ZH2J0PmH0KjolaQJFQPahKODxqPFU+7lHlnZOkYpb9QQbw0OikzqxXp9aP6FLe2cnMlVuV0VNfSDUPFw2DZTTZsfxsvIQOdre+k0e9GmPnBlsWmEHGhjsczBGGXe2w0JQc0k9vb419koMlqw1vmO521oXuoSVp0mclBAXmppm8bxep/JkmwV6AftMpRAnjiR02YJ4071O7TqmAkI11RtydFOYgb83a/CGH8T71pCW+1fHPiWxlGAYW7QfElbx9dWX1i3C6jQQv2QomtkV5tKEjDhS1hyYITVVlrdKnWAdtXmYLuhU0wrnoYbBt3xdTnqM0KmEijnA/i52d6S6wpr6DM/a9DJgeepoDUH+7aS+jNGSvhuv6a7J5qYg0+DkpyU955loOliGART5xmX4J7oCLXKN9uHz+l7Mqnwd2617+jAFGAHsLl4tadR2y1ioNFPaNoCMDBIbWu/xcpfr9IMsw45wl+E5ntGBE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(31696002)(6506007)(86362001)(6666004)(53546011)(31686004)(8676002)(44832011)(36756003)(38100700002)(5660300002)(66476007)(66946007)(66556008)(4744005)(8936002)(316002)(508600001)(4326008)(26005)(186003)(2906002)(6486002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dk53MnI0UkdaemZIbXI1TWFkYmlKZC9EU2xBU0JGRll4Z2NGZmYyUktCbytW?=
 =?utf-8?B?cmRrVkt3eHpBeGdJK25QUVJsUEhSWDg5RWl4VCtzZDBVQ3YwRGFGLzA4amhP?=
 =?utf-8?B?dkw4TmtLRmpMNHNsWGZwTWcvTFArWkgvU0N4MnFYc3VZcHdWRllwaHFocFds?=
 =?utf-8?B?Rk5XYytwVEtLSTEyekltbjVhZzk4Y29sWWtTbHZTbHhETDVEYTBXY09DYkFi?=
 =?utf-8?B?MFNjc2ptczFYVlVINWcxRUZPN2NPa3JUSXJLWlpOekNnNjlLUWJqTDFhWFRh?=
 =?utf-8?B?ejNtMWE4ckF1dTRCTjI4VHJJU3RIUUhhaTlQeGRTTHN3OUpNQ0lQR0JXYS9E?=
 =?utf-8?B?VlNUVFNSNmFxVUxyRC90dncxQTlpNkpLd2ltNmlFL2FBZjNVUFErSFFHWHFy?=
 =?utf-8?B?R3BiWEFvRWM3OGtXUk9FTXNMWGJiL1N6VHZoS25GWDZ1K0Y2eitlWVIrdkdo?=
 =?utf-8?B?aUJaUy9PeUtPQ2tuamZJT3pFVW42S1FQR0ZNVllLclR0OGdtMGFZRnVpZTVT?=
 =?utf-8?B?YUJ3ZnZybWVBN05xVEZQV09qZm5YU2RVZE5jb2VyZ2xPR1FoeTNielZoMGVr?=
 =?utf-8?B?WWVpTGkvSEpEMGJ4MzQzUUtlT2JHMnlzZzV4cXUzM05pRWdIZ0tTQXY5TkpQ?=
 =?utf-8?B?N1YwRkQ5SXZET0NoS0lSa1FvaFhUTTk2NEw3a1hVbUtYYThZUzlEbXpJeUNk?=
 =?utf-8?B?UmR1UGlyWThOQWRZeWlUamk1dTc5S2xUcHczbDNuM21ZSUw3VjFIRFZtS1JJ?=
 =?utf-8?B?aUo3NkFhMFg5OEsvQXpMb0t5eFN3ZU90NFR1WjNpcVBLUGhuQWZKemlPTWZu?=
 =?utf-8?B?YWJBdW5iSEViNmxMTU9qV2phWDY2dzZyTWVVUHlYdElQUFQ1WGdkNzBwM0E4?=
 =?utf-8?B?QiswMnhRMitYem9oaUZmcklxT0ovVFlSR1pYcDNSWUg0YjRkTkRFSGU5WmFp?=
 =?utf-8?B?S2txTFkyRUtRZERtOXpwa2VGL1RTT21ORVRYUzNkanBlaVI5c2d2WUprVmx1?=
 =?utf-8?B?RWtkcTh5MHRJci9FN3pSUGpFQ01aZGlaQWc0cDR5emJIbWN0bXJ6V2hEVTMz?=
 =?utf-8?B?MElKZkFWUzMwaFRXRmhRd05yVlFkV2lmMWxqdTZvYTNGaWFML3VybDZvTTJG?=
 =?utf-8?B?RXJTd213OXltY3JxTDdqZVAwRkFINUxScm9ZbDhmU2tlY3RBeUNuWEk5S0Zy?=
 =?utf-8?B?NElGYk55REVHTEZ5NStpbjBMK0QzWjVoaWFteVdsbkwwVUVNSkNwTVdzWjgy?=
 =?utf-8?B?eTFkMTRQUGJoMms4c3R3dzFNR3diUDkxSVZzcFhINlc2b2U4L1EyM01wK0NX?=
 =?utf-8?B?RkFmV05CaGdlVG9BT3RGeGlMazBXMGp5RmZvZHFoczNCUjBQT2lndnc3TzlM?=
 =?utf-8?B?MCtIS0lac2dVazJvVmNTV1ZVT0RqSnBZQlVWTFc4TmpIazFMajUrRng0dzNt?=
 =?utf-8?B?azVDWHlaaE9CVzlpakYxSzhnVjh4OFdPc0VOWDJLNVY1TVpmVVFnSkdEMTRE?=
 =?utf-8?B?SnFneGNGNlVoR3docWRvdGhkTXI5a0o4dlcrNndNRGRhYmRxTGF0Y1R5YUo3?=
 =?utf-8?B?ME82MHlJLzV4aWNoaFQ2d2RIT2NTMFFZcHNvYmpvOEtaYk4rMkplVnlTcUJs?=
 =?utf-8?B?RXZEOXZ2dk43ZGxObmpOQTdsWnZGOG12bWxYUS81THI0UzNhMDFoWElQSFFt?=
 =?utf-8?B?WEZqc0dtUDd4Y0pJN3lSbGJaMWlVVFlzMVIrMGR6R2xObnRycGFqSEZQRnJQ?=
 =?utf-8?B?bVJIWG5oTEdRSVJpc2prN1B3ZUdCdW1BV284T1Y4Z1B3UkVVSit5QUxvQ0xQ?=
 =?utf-8?B?L3ZDR1NzWFl3MkgvOXR5Um8vakNQdDBGN00xUldhNWZLRjEyT0NJMmUvVnNV?=
 =?utf-8?B?L29CY25EK05SUmxhM0kzUGp2aENXcXFLdHlVOTdLdGU3aFBTYUM3NEpUNjZp?=
 =?utf-8?B?VUZxd21SRFNpamhWaWsrQ0xXaUxtQnVzYkVRbXVlTDg4cno1c0pmRTU2QzFX?=
 =?utf-8?B?Z2ZhU2QySDhCbnBnekVZYUZKcmNTdE9ielUzVG00TituVERuS0hPRTFDd2Y0?=
 =?utf-8?B?bmtnMWIyYmlGZGdSRXdyZWNWMUtnS2Uxek83eXZNbjUxMTk0dThjTUlVdWRm?=
 =?utf-8?B?TzBaMWlZazZwajk5R0gwR0RTeHREMEh1MzI2dGdXM0RzRFYzT05XQ1Z6K3Fp?=
 =?utf-8?B?V2JLL0JHaUYwYk1wMUxNRVdHTGxBN0pnSnZES2xDL2dwUXdQZW9McTg3bXB6?=
 =?utf-8?B?M213eUNheEdjZmRST2dLSVhNamVhNy9Tb0V5bzJZWmQwWEVWMnpKZEo3eHBH?=
 =?utf-8?B?SGxJcVFhN1NBOEFNM0x2M2lBR0o0YmZVckhUKzFpMFdrRzI1STQ0eGRwdy94?=
 =?utf-8?Q?8OKW+GcDNoh7F44c=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed109f35-c0a5-44e7-378a-08da1a6ee60f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2022 21:21:24.1882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+BM8asI0s3nAV3ufWVkwA6wOPVlJ0vYbpPOfh1hfmRAooElOndmlKXuhr9gJV8ImA+dvJv5kVDzWoR9d3YpUlyww8rQH80M1VzoY04HkhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4612
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.858
 definitions=2022-04-09_25:2022-04-08,2022-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=952 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204090139
X-Proofpoint-ORIG-GUID: HnalseiX_rKz-v5OlGIQf8n0VZ2JDZxU
X-Proofpoint-GUID: HnalseiX_rKz-v5OlGIQf8n0VZ2JDZxU


On 4/7/22 5:38 AM, Juergen Gross wrote:
> When running as a Xen PV guest use the extra memory (memory which isn't
> allocated for the guest at boot time) only for ballooning purposes and
> not for zone device allocations. This will remove some code without any
> lack of functionality.
>
> While at it move some code to get rid of another #ifdef.
>
> Remove a comment which is stale since some time now.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>



Applied to for-linus-5.18


-boris


