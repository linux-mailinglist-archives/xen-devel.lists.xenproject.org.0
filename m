Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7ED89E01F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 18:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702529.1097631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruE6d-00087j-Tm; Tue, 09 Apr 2024 16:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702529.1097631; Tue, 09 Apr 2024 16:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruE6d-00085N-QP; Tue, 09 Apr 2024 16:13:55 +0000
Received: by outflank-mailman (input) for mailman id 702529;
 Tue, 09 Apr 2024 16:13:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqhR=LO=oracle.com=konrad.wilk@srs-se1.protection.inumbo.net>)
 id 1ruE6c-0007w8-Cx
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 16:13:54 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f63cac-f68c-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 18:13:52 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 439BYIcH031281; Tue, 9 Apr 2024 16:13:47 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xax9b5bsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Apr 2024 16:13:46 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 439Fp1o2032367; Tue, 9 Apr 2024 16:13:46 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3xavu7ddpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Apr 2024 16:13:46 +0000
Received: from DM4PR10MB6719.namprd10.prod.outlook.com (2603:10b6:8:111::19)
 by BN0PR10MB5142.namprd10.prod.outlook.com (2603:10b6:408:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 16:13:43 +0000
Received: from DM4PR10MB6719.namprd10.prod.outlook.com
 ([fe80::4581:e656:3f19:5977]) by DM4PR10MB6719.namprd10.prod.outlook.com
 ([fe80::4581:e656:3f19:5977%7]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 16:13:42 +0000
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
X-Inumbo-ID: 26f63cac-f68c-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2023-11-20;
 bh=ytD0acT6fIJrO4Bi2Z/mj/1qK3I8GNPRL9Pp1TSDoks=;
 b=RmejxL5Mn0mVbKvCh0BBdHJy/evt62jye6FK8/2KjinGUa2kehCZ2KGZZprN42v0qA7p
 H71f1u+nPksyejtRV80SEUw9YiOsbUzi0JwdziG/YInrgymSAVM1plMQU2LWLeeVqaIk
 IycrQ3TUnR20xZ7fuptaOZquN1G75jfMDnQJYVngwXM+2Q6PvqCWMtCAXDjwRHlRp8O/
 6nW3TPcn34S6t6Cmnz25KrCr1aDdeOSOI5GQhI2uWvp+bh95UgHiT8KsNn76QA+phmYu
 iQdWc5Q/g/19oFrrCtG92BMFWp+8asn9FhW0Zh4Oc83HqpphqfCASu++FobDjMMSs0gB dg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7UPL+vFCNCCw+IFdsEnIubu2l8Ih4Z1UHJBSgC4INTHvwpqkrOCTyVOVd7MpRhZAQh+duPaIW8wIoYEu7Ji0+bTSb0cZsSyrMYBqJAq+Z/bLbBMmW5HFF82lnCZcint5xedAy7wUr2k54tm3HgjvuSJqMnohIlR4yk3f8wUYCcihrYoh99/cib05qDc/YMFR+zvoUO8ofMy1sNYtgyIcjW1JrdsZvkYujpyVNvj5fCQriZpsOI0uo0N0qmYnTIq8e0tO4uzOCh4f2P4dogBVp1iyUmXG3ozRKLZVB04AFMSZNhPGpOj/m45bjnO7iPVX25WxXcJanKfS42iZy7EVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwpPInyrepjRMFADzdU3PYLX1lVgD/amIQNI+ydRVEE=;
 b=D4KY7UZ+ltOy8gQDtqsyezuoowBgI1LqbO7t18waqG20kxEdVoqNmo+yCyZF5Ahd5/7iJ5JIpsgwwLhp1+8lwZQwgXFUVwDqBTb1SxoP4MRQa2EFTuta0fsUsOg2EEs272wZVowZGKYZK0p2oihSOWX7q5GJwnEMFsLZYoehsP+p3DkZaWzrTqTrLSsxwJWBOfTestT9arBbzoa61No+05d1vCiyriexYLc45AAHdJxsrStgztd+mXc0splqyNEqoS53u253dZVcaKt45kl9hgDatO+LsLu1zQ5UKyTIqiS2r/lRSXBiSgjGkBtIoI/eamONrXV2gDzX2Zr2faWiig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwpPInyrepjRMFADzdU3PYLX1lVgD/amIQNI+ydRVEE=;
 b=svAXEYGM7tlc0d58aB/aXK2958P8RXKPyR5vm1dROCpXH0EDfTWf9GB9EGvbs2J98m0t7Ju+qLewFLgg/OaOgi2qKC8Um2vSz/m6+gGgf+EYlmxlnNdF0d1+4RiNsB/AZNc+oypVZKeko4bB3jfD+cnfOipR4/2E66+4hYq0c4s=
Date: Tue, 9 Apr 2024 12:13:23 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Konrad Rzeszutek Wilk <konrad@kernel.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update livepatch maintainers
Message-ID: <ZhVpIxhOjeRhYflW@char.us.oracle.com>
References: <20240409103208.1641887-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409103208.1641887-1-ross.lagerwall@citrix.com>
X-ClientProxiedBy: PH7P220CA0040.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::24) To DM4PR10MB6719.namprd10.prod.outlook.com
 (2603:10b6:8:111::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB6719:EE_|BN0PR10MB5142:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DN5tBnvztz+5t9uom29TXY7MniNaSScLPGdZAl9vDXmUfvD+zHDOXWnJkXHCzluOY+Th3557JIOyiWn6SVIzv9a/5qpSUSxd6OUAh2k2Y40/pN/viJHTUh5z0dJjDh/SL9WP6ALBSW56GxGWypaqg3au849KMYETOHo9IJ9rUPLBxx84bJ5YpDhJBafYleAopk2BE1PB+cVq4D0dz1uCT/W7E96M3bjNhEAxVGVSeFtSFDbgdK5h52+8lLAUcXGTlrhGrXRyuBiCmkpbhX1G8Zivg0EQB5iBJ2MPiNE4qVym7AUiEOYPjpVFehvsifDaCFpF/lrQFtx8LFCktU32iFJaR+a7FUPkJTuYYJ7O0gWyJh1r3AU+QEEAjaLYSCghgDH54akUnFd7Yts27ukIxGB1q54Gozzqa8Nb83pj7vjtpDuOzQzU30iFWKX4RD2ABrFUZMPS00C4X0zIllgFEGWJh2ESKriIQV+3rXN0slmmzIuyl3JwPvIGGY1OIHYWvXg1OEzSXmG72UEl1qawwXV7WnRN2bUEO6XJbPJqxUeYnarr5LzQvn2JsFWUf3cvGfD1R9PEdwu9JDHMVTt42n9HdixKIINXayayKiJJCCkIXbssAqI4zXauqpr+5ok0JxZZw8zm/42e26RQVXEXHAf40Bcv28cVo9oN23gDaEk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB6719.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?2LfwBAhn+T5faX6GfYueGFoapE+DBYu54u9c0vhvE3dkdtBJrG4demt0Ok?=
 =?iso-8859-1?Q?5u1F/OySx2oidzbVk0ZQ0rdoh5HKoWh6Q606PaJfEoFdPU6mLvrLzSv9bz?=
 =?iso-8859-1?Q?d1GKLDJoKGQYlUJPWPeIx8fxFzH5ZR2Mfj3liYjqJ0u/bjft9SMDtfvnxj?=
 =?iso-8859-1?Q?Niepa2B/afZDncEH/GHg0s9I6xBmf7sNU18T82xKUbf/3NsfgxssBtmytt?=
 =?iso-8859-1?Q?451n8RU42dqFsdoiag45zeTSp061my/HMjBnBINJCRPHF44lkX9Kl+6dI3?=
 =?iso-8859-1?Q?ASasNAOe5d644RLfxxP0idpeiSkHO4LkERPZgrEMwAtfdKKybuOUTL43vT?=
 =?iso-8859-1?Q?OgXGufQ9R4lv55L0kZWrjdQ0rAbxV4OWjWuPbzoFBx+WyJpQnnp50XGqFj?=
 =?iso-8859-1?Q?HSEO1l/6LruUTtq9LHi0tWzlZ3pMQl6XV+AJ6iebpEEFCYhW7jB0E58CIC?=
 =?iso-8859-1?Q?HYw0COcpx0hSNOnATlAYoSINE1otlxDeQXH9ypLYSKNGT/sYzhlxKfNrke?=
 =?iso-8859-1?Q?YelDDwI72QFNcEVZUWC7uS8ENhCWms0AB/w5T5MfsvxKc3Q2F6NL4m6/d2?=
 =?iso-8859-1?Q?5+kehxeGmGdxhDoaiXU9s/nIlYUr/+Q92/J87QdgTJ4AkLltqjePLm0o8E?=
 =?iso-8859-1?Q?+o9xdAm+0cF9y42W+s8nBYjZRsfpUG2SQ1nbiK32thROfD4/Txf94uthCF?=
 =?iso-8859-1?Q?He3nriBnqyHyV/tA2Al0dQ/Vr4b/vgICsI7hyQV8mKdY4+/6oGSY6R8qS8?=
 =?iso-8859-1?Q?7oIbPeqW6ZfA7hFGm7zVxTJsJmvZCpI3Tpom1ADzUOSlUWdj4HUyYm40Lt?=
 =?iso-8859-1?Q?4zIoehNpd8IXqyDV1REJUsi0PCoYdt36G9B+hOeW6jfTNWJWGoISooQnSH?=
 =?iso-8859-1?Q?iPqeKr5qiTaUsh3VbeA7F2aMXbxfXj3RR1AG1OlLjAbxx1aIA1lR7FkyEJ?=
 =?iso-8859-1?Q?mFdeaeoi+UdGB0fuTzK7W7pi+U7BZWZlKvp2Yzgeye8Bl5WPlvIRlmZgNB?=
 =?iso-8859-1?Q?qmTN93AY1FUiEsRSMnDCITUFuXDvHLUtEUDcMkRPYZsmzVQ+R8FktbLm7b?=
 =?iso-8859-1?Q?8YrkPEA3OwLZV4HfV2K5PlTfgUUR0QoU2+6tpEc/OrqZW1L2gIg9DNloE8?=
 =?iso-8859-1?Q?1QBuN+U19qJesc4k3Fh+apqdzXSJmzj+eGLUoCtTW5xOwrrWdgc4Y0ohjw?=
 =?iso-8859-1?Q?AlimeGEXAlU+1mGL0HSl6+7Hvj6G0VvgDoU739JGD0P/8B10/2DGyNotzi?=
 =?iso-8859-1?Q?d9XeWPvPazUOh1+7FnGo2A593j23UfX9qw1e/vhq1hrDXAedqAKzdX1H8N?=
 =?iso-8859-1?Q?y80g4w53uGRM9edhNBQmucnuhUqDOhUlMVVNTZDfjc92k2DsNcGIyCOwDb?=
 =?iso-8859-1?Q?lqp8orhdBNkptXPD3vRoO3ZITXuOaY/LkZsifwPr93wZGrAlY7lHzNDw7k?=
 =?iso-8859-1?Q?cDuporv/eAonyatKmKHsnY2rrpb5pl3iDRqHXLxQI8ypK+2ilTFp199IeI?=
 =?iso-8859-1?Q?NVUuRTULbP/375FGzd0L/6ER54V2GhaJ9ISi3snrxLjcjK7K3SNyvJ01zQ?=
 =?iso-8859-1?Q?hN5e+3mhd9h43vn2vzXkBsJIh7R7m+aPJ+blZ/Z6BpHurJn6sof58i4ojY?=
 =?iso-8859-1?Q?oSyUXkikMR8VW6WBcHV5QBIHINqvburv+buaNnliYlxCLkJ3K7HzqdTw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	edoWk2R/aSzNfEuIMdzm2mjoSvK/Lwo6Bqj1U/YxZwvHcYlH1atu3pgCXIJeu1gxAuYE5obBuwUPz+KU916zWR8UAbthc7uY2sRsVs06lbkihgLVaQE0IdtwjsJC9pp5DtxRLNVDpjvNVdVVZ9QYyoJZPl5zUOAskGfKKXPvJlIrQM6PkYY1LB4nwGqz18JhbHR1NkIvbOQUGUjM8bXHC8VTaNzJmGpiwPJAIcELrBGx0BwqE6yWh0v5oFV98xBrgaGX2+X9530XKzfx2BgyreHWwSpfHHmtEAgO3lwoeEVGBHIHE7uwsoLVHITNI3gi+ZvlF+oaHRRGWCmNikUC0EWfxMbey5xuQm0wg0kXHl4hdSlHSX1koeZBaoDvPTIlrdNJ0WwnQLoIi0Vaj3MWt5g2VNbzB3GRDCgUsEoppISI+0Rl8qsUkVoTFXj/hPQtqnHnmMTiT39uoGjkHQ5TuO672zJ5Sd4MqRH2xNpRx1yCBDR8xYuPG1/T3WyjqtZLtQUkNSas5Y5rZHrJGdX5B/4DIl5tmzcPQkg1atsFrYP2j27EBqj9tq72kTctKe+l86K6sQTYCAVNVilrjk3yQLQRQ+bmksGm2xzfR4NaKo8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ef1182-db7e-43c7-8cc0-08dc58b00508
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB6719.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 16:13:42.5449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDUds40adZ/r62UMdIv7VlDVglKe4BIZJ6OAJcY2Q1GC57OcQgYg0H1t8sobfOrpq7s91xErwwdgugApCjO3fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5142
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_11,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404090107
X-Proofpoint-GUID: -24UPNJ_OTgJCgR_Weq7lRFo2B8k09q1
X-Proofpoint-ORIG-GUID: -24UPNJ_OTgJCgR_Weq7lRFo2B8k09q1

On Tue, Apr 09, 2024 at 11:32:07AM +0100, Ross Lagerwall wrote:
> Remove Konrad from the livepatch maintainers list as he hasn't been
> active for a few years.
> At the same time, add Roger as a new maintainer since he has been
> actively working on it for a while.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

Thank you for picking it up!
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1bd22fd75f0e..4bc45ded4130 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -395,7 +395,7 @@ F:	tools/include/xentoollog.h
>  F:	tools/libs/
>  
>  LIVEPATCH
> -M:	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> +M:	Roger Pau Monné <roger.pau@citrix.com>
>  M:	Ross Lagerwall <ross.lagerwall@citrix.com>
>  S:	Supported
>  F:	docs/misc/livepatch.pandoc
> -- 
> 2.43.0
> 

