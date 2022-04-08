Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3504F963C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 14:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301539.514637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncoAf-0000wL-3n; Fri, 08 Apr 2022 12:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301539.514637; Fri, 08 Apr 2022 12:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncoAf-0000tq-0n; Fri, 08 Apr 2022 12:57:01 +0000
Received: by outflank-mailman (input) for mailman id 301539;
 Fri, 08 Apr 2022 12:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uR8K=US=oracle.com=konrad.wilk@srs-se1.protection.inumbo.net>)
 id 1ncoAd-0000tR-4p
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 12:56:59 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ebb7b24-b73b-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 14:56:57 +0200 (CEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 238CS1um004892; 
 Fri, 8 Apr 2022 12:56:53 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6d9371vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Apr 2022 12:56:53 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 238BamYp029143; Fri, 8 Apr 2022 12:56:52 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f98057s6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Apr 2022 12:56:52 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by PH0PR10MB4791.namprd10.prod.outlook.com (2603:10b6:510:3a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 12:56:51 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::9c00:2a13:f115:537a]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::9c00:2a13:f115:537a%7]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 12:56:51 +0000
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
X-Inumbo-ID: 5ebb7b24-b73b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=2tMULLAsbjJqyFUalDHVaZPz1XTQyIQQkcroQqZjE+U=;
 b=uj7wd1ti0yKJ9xTpOCbDHkk6tyTGLd12mSIMYflb8egYhDD8PRkE9xCKbga+pXcxZVCP
 LBk/WqDu59JOpd0NirPf/s8KZuubh6/Zf7GGzPCmTnSEGuMwhuDO1uEHccfFyz0mQef+
 sa5UsZzdmSA9rsTqqsmKwOD4J38CVhotWblxjWjxILc4XF0ZssWX0xMLfs++62DN7HFd
 x4T9ievqMiJVrTcMxZBBOVPWjVyLXdXPOZnTwfzzQZU3FieqUK/4L8BdeBRSNsKl30LC
 FNgbv/BefYzWrgZQQnDwpWu1XE1yp1o5tvEvONAhJ0Um/6HIBgSxwxfBIO8fHaaoBfoC 2A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fas4RhK+Lz+tEqQuOV5cd93JeEv2vw6Zq4IJCsdi1diu7uvc+jcdNmeBzqhPMQDdMWOkGBcH3Cy6PmDMXfPVKiGUljW1rXueQjaFUFdwppVgJeV+CSTdUE7oKLlcIFBTkXKX27Aq9walKqJfo2wZ5V/gVTTyqqjjX/tceLLfrJgpu0DOwbgqw8q14TVxRUeKXbA9fUFBmBQPMoqF1N48mLGvk4I7ugUgsgQLwoN3bceCxtl5qwDv+x/5dX4PA/GPz1Ihxta13/vgoON8S/Kc1iT33oc76PXY+Uzi6kjYjtPUTkQnn/kMszMzDHF39qtHPah7hBUHUfpQ/fry7zcOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhU0EhWRD5EtPJRO9+dZowPxPurWnxgiJx8pnKnN5cI=;
 b=V8xV216k8pFigZOPtxXXYIOgQ4OjER4FRvxiRBlL0uttepeXnJu0T0XeHxAJckbD8VEH9QUMYw8OlHGP04aEMgYgq/286EEWaZuG1MhAMzKgm8jtccdrEytKzkA1LU/VCRvHFyNDiLoBgBXn1xJdq4bwJbGhkEbY9cLhpFjiXJOG1ccgzkhdXc8tEB4oS3ccgSEv4ZxoUxJ19HV5PAvISpSzUSseMb2raX3rAwKB5Yx/g/qsOItiG88RB1VTRdJTivNW50PPCjvHOTT6VAgWWHga+bd8pQnqfyM03VYlXsy5RBu6DIZRX5OtRzYOrCb2N4V4cYzce4rBNzI5taGC3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhU0EhWRD5EtPJRO9+dZowPxPurWnxgiJx8pnKnN5cI=;
 b=Y7a+R4uyUTKypk2+QAHQvY5h2JRwOvHrB3TXP/aizIMIYq2ViAqTs3+BYd9mT8We2neI+oo5vXG0ZO6nP8tf/VKvKha1kCU2djSSnwSlrSR2/pd4LC71ngz+pWkY54GHpw++yVzS1MFYpcmZmvXd5dPMMYc4xjYT9zMq6TeW3Go=
Date: Fri, 8 Apr 2022 08:56:44 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
        Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        Bjoern Doebel <doebel@amazon.de>
Subject: Re: [PATCH v3] livepatch: account for patch offset when applying NOP
 patch
Message-ID: <YlAxDEYL/ZOVd2Oh@char.us.oracle.com>
References: <8db632ef-9d9c-d17a-54fd-49912d88d599@suse.com>
 <YkVko/vqhfAfS5Jb@Air-de-Roger>
 <ef884c3c-26b4-1bde-9344-aa9be30c1cbc@suse.com>
 <PH0PR03MB638290EA5503FE0FED792C44F0E69@PH0PR03MB6382.namprd03.prod.outlook.com>
 <Yk/wKp3XyAAPbqgc@Air-de-Roger>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yk/wKp3XyAAPbqgc@Air-de-Roger>
X-ClientProxiedBy: DM6PR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:5:120::33) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f153a00f-ac4e-4c23-c942-08da195f3fab
X-MS-TrafficTypeDiagnostic: PH0PR10MB4791:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR10MB4791D3E0661BFF0949CE319989E99@PH0PR10MB4791.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qyaukqDaWoCmWUUFDhfluI8ODMAz0CMgNEEG3C8MV4aDlmZlj542+k/w9hxPl+J9k8lLGifdBEjrBpI6BaehzZncVobeXlE0dM8U2DzNv88Jc0oX7tK2/bKED43d3RcFavMzNQXIclC2RBkMe6HE42o5A0HZ7yPrkOAOuYDDBA9zrgnR40wyc7pQ9J9ErOKwzqsYzO73UuEVWqP5bnrZM4veC7epEWrORsVBMWPGH58VlNgcnu3EPPsUII6UHdPSTG5J1x+o56I2JsGtgXqiJ6W96iH+zYfiViX9BbETYHKVuowX03ftXFju9ONm8C6UEb/p0z0GkSQRFTUUI541MRCIXJUKTXicSze25lZKQuKEwQBWhtwkcYtZK9UVUUtiiD4leNlEl666y12cRu3MDTU5Cm/5/Vc2Zovd4smYvLbIMLvrVQ65mrMdsZz1dATuzYBGSt2b5y5PJis68AdPJqfoEEhT9dmqQaGsQiP97+VCIUvc5cMUayjR+5uwCxnm8rmdHFt361ljdL31hpxdlxj2+BpLsCtBNxlGfP4AJJmWu1mQOTyVwL1q31Mx+h04f2tS16wGZDiuOJ2bVdU5qryS5gmwu4y31Fj0zQhAObhgaVieoBo/K9A8q+WZWOx85bnbYajuMZ6tvDNJnw+q5+6xT9np6ocs9iKLnqXwQcmAWjqCJnysk9BkcS25TZ6rZnFIaSiVHG54s+W118e9xw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2999.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(316002)(38350700002)(38100700002)(54906003)(4326008)(66946007)(66476007)(66556008)(53546011)(86362001)(83380400001)(6506007)(6512007)(6916009)(508600001)(186003)(15650500001)(6486002)(2906002)(6666004)(8936002)(26005)(5660300002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?Px405TECkJytZul9XqTL/sZm3xRehN2ABhUXmYTMZu66y0AENcmF44AN3b?=
 =?iso-8859-1?Q?XmXaCTdWEd4NiGTyLr6eV7tVaPHOfNUQyq5kAwzkRtAC+6Cb51FHoQuIpa?=
 =?iso-8859-1?Q?T/Y9xud+296kc2bX2elepeiLJSVwJW1m/2VIV8Xg0W+60j9jOVjFwvvhQw?=
 =?iso-8859-1?Q?p0azSh6RKa2VV8y42r46BVaxwWS2bMNexBtBznpD5g5ZYBg+mADJfz7fYg?=
 =?iso-8859-1?Q?+npFMBj2AysLH9E9spIOUzfv++t+lh2eg+folqWs7ESBBH/Klxl7spDvL9?=
 =?iso-8859-1?Q?AX9TgQj7/bpFZNJV/0u6PCQSSYo7nAfxKgwK1Z2akeE3t6hBYts+VoahQ7?=
 =?iso-8859-1?Q?ACRPHF6QdO09phxqfWaOOgqQpfIl4QYGX6jNxIaXaBDp5JL2pqoZbQG0Q5?=
 =?iso-8859-1?Q?b2q98q8eAbCoLtxurfCrfGzayJO42SyBJ5cpk/agv5mnS8a5GrJ2YZFGU0?=
 =?iso-8859-1?Q?qfslEBfXnlxCr16uUHthzuODZIBhrK1qS/foT95D09Ca4oNyOguHEaFXMZ?=
 =?iso-8859-1?Q?sgVC8JHuOaK06HNthzBo+i6vRpfn8bFBkBi0GVu2ufzIPJLEI0htJ+H0/g?=
 =?iso-8859-1?Q?oV85p16PTSoi3Oq9nrjZReLuyC+B5rg3NN2j3S+4kZgJdYlbdioxNy7r11?=
 =?iso-8859-1?Q?l2ZHQO4UD1fTdZMF+Zb7sje5NNwqe2uJmY+r5G8xqT39yvFC3YMTwx+K8H?=
 =?iso-8859-1?Q?B4KjrQBv3Q84WOP4iEM98RAjl1je12w/zQCH8pKjWahVXp2BJP/NsY2821?=
 =?iso-8859-1?Q?aiSQbAac45WaZt21jNUWvBvKLlQwQscpBLK47ARYuXjS+AxAHJour76OLN?=
 =?iso-8859-1?Q?8PIwNwccOEOPhFGxasde29T0WAa5Qz1dJjzuLZYFEoF9eQsCSyWtWrQWCe?=
 =?iso-8859-1?Q?QG4c/pBY35+jBq8MnHkazlI42565bddLos4dO52usd0gkFWguCOZaAXbMO?=
 =?iso-8859-1?Q?TL4HOmjzE2qkKx1HgOOW7KD55ygPuokP0c7NqeNLdYNcT3b05nHau1+JIB?=
 =?iso-8859-1?Q?MRJpkOwkMmQb8TAD0zeJbxailcsMYzhid9PJPTmkGTj7oDsgTVpE68iDgE?=
 =?iso-8859-1?Q?SfXY/75/gnr53KvudcbVP9kZxWyc1OYAx6pCN3hQoqLIfHMzdB1Jh8meKr?=
 =?iso-8859-1?Q?yWr0SmlixgYXy0uXAqXsWWikz4VxfD1pDx37asVEISBf5oR4buO4EFUyzu?=
 =?iso-8859-1?Q?HzkODsCYwkSMEhm+7MXmz0baXgIM7BIESKUSppxln45J7ANp2jioTGRB4r?=
 =?iso-8859-1?Q?z+1cRlP/fuOWTAkQnlkgvay5Mb8gF2JamKTTRDHYA1n89+6ncinGmWiEfr?=
 =?iso-8859-1?Q?HSLnz7dHXcJU364+7zijyYQ0LY35jXXQu0+Fb4KrDPSMtQejHhZS/J5TyD?=
 =?iso-8859-1?Q?DiTiXQZfTzK77yDG+gGYxd7jc5BGJ8xJWujlETp2PNSpK9MBxamXgTFurQ?=
 =?iso-8859-1?Q?e1/r2fHsv05KttHKFuhwyNzbV5gIBe6fUD/kDNpcxhG94ovx/+QQf7mTSY?=
 =?iso-8859-1?Q?A9AKa6fYa+zLQ0He9Em8WQLLINsUqOu2OATpoWbxGaPgACY/gXHmNpkwrL?=
 =?iso-8859-1?Q?8mSSTfBIB8ygrkEDevqkuFSCXieUcGtAScBcRCCNFTgHcSyR7+u+v9lKzp?=
 =?iso-8859-1?Q?HYxixXRDGGo+J3uYZHHfDFOOVnApsGIy5NYD2kBcetpb8OtMG/J95v4qhn?=
 =?iso-8859-1?Q?CxrkP8xzM1HQbmN2rufsdgAaEiXJfFdClcHAV9Mhkl9WitPlGOvB0POY12?=
 =?iso-8859-1?Q?d95K7kmc5siM4ct2F8lbcpxTDD80q7dheY2Co5Nkpiy6x0ipVCmbcAus6k?=
 =?iso-8859-1?Q?s4STDXDc/+Vl2egu3Az3dkuZhGpplDk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f153a00f-ac4e-4c23-c942-08da195f3fab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 12:56:50.9344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1Zunrr2MEYry/4oq9smV5GHGBNxDpLy+S3bmbm3C2QNOJohETF2FyYxF7yvHa0Q95xpLoifoALbx3H0lbUSWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4791
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.858
 definitions=2022-04-08_04:2022-04-08,2022-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204080058
X-Proofpoint-ORIG-GUID: lXNOn_KpkuhvteZQtTxFKE-vtC5aejng
X-Proofpoint-GUID: lXNOn_KpkuhvteZQtTxFKE-vtC5aejng

On Fri, Apr 08, 2022 at 10:19:54AM +0200, Roger Pau Monné wrote:
> On Thu, Apr 07, 2022 at 03:44:16PM +0000, Ross Lagerwall wrote:
> > > From: Jan Beulich <jbeulich@suse.com>
> > > Sent: Thursday, March 31, 2022 9:42 AM
> > > To: Roger Pau Monne <roger.pau@citrix.com>
> > > Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; Ross Lagerwall <ross.lagerwall@citrix.com>; Konrad Wilk <konrad.wilk@oracle.com>; Andrew Cooper <Andrew.Cooper3@citrix.com>; Wei Liu <wl@xen.org>; Bjoern Doebel <doebel@amazon.de>
> > > Subject: Re: [PATCH v3] livepatch: account for patch offset when applying NOP patch 
> > >  
> > > [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> > > 
> > > On 31.03.2022 10:21, Roger Pau Monné wrote:
> > > > On Thu, Mar 31, 2022 at 08:49:46AM +0200, Jan Beulich wrote:
> > > >> While not triggered by the trivial xen_nop in-tree patch on
> > > >> staging/master, that patch exposes a problem on the stable trees, where
> > > >> all functions have ENDBR inserted. When NOP-ing out a range, we need to
> > > >> account for this. Handle this right in livepatch_insn_len().
> > > >>
> > > >> This requires livepatch_insn_len() to be called _after_ ->patch_offset
> > > >> was set.
> > > >>
> > > >> Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced functions")
> > > >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > > > 
> > > > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > > 
> > > Thanks.
> > > 
> > > As a note to the livepatch maintainers: I'm going to put this in
> > > without further waiting for suitable acks. Just in case I'll put
> > > it on the 4.16 branch only for starters, to see that it actually
> > > helps there (it's unusual to put something on the stable
> > > branches before it having passed the push gate to master).
> > 
> > Thanks (was on PTO and away from email).
> > 
> > > 
> > > > Albeit I don't think I understand how the in-place patching is done. I
> > > > would expect the !func->new_addr branch of the if in
> > > > arch_livepatch_apply to fill the insn buffer with the in-place
> > > > replacement instructions, but I only see the buffer getting filled
> > > > with nops. I'm likely missing something (not that this patch changes
> > > > any of this).
> > > 
> > > Well, as per the v2 thread: There's no in-place patching except
> > > to NOP out certain insns.
> > 
> > Correct. FWIW I'm not really aware of a valid use case for this
> > 
> > > 
> > > > I'm also having trouble figuring out how we assert that the len value
> > > > (which is derived from new_size if !new_addr) is not greater than
> > > > LIVEPATCH_OPAQUE_SIZE, which is the limit of the insn buffer. Maybe
> > > > that's already checked elsewhere.
> > > 
> > > That's what my 3rd post-commit-message remark was (partly) about.
> > 
> > old_size specifies the length of the existing function to be patched.
> > 
> > If new_addr is zero (NOP case), then new_size specifies the number of
> > bytes to overwrite with NOP. That's why new_size is used as the memcpy
> > length (minus patch offset).
> 
> Sorry, maybe a naive question, but why not use old_size directly to
> overwrite with NOPs?
> 
> Is this because you could generate a patch that just removed code from
> a function and then you would ideally just overwrite with NOPs the
> section to be removed while leaving the rest of the function as-is (so
> no jump added)?
> 
> I wonder whether we exercise this functionality at all, as I would
> imagine is quite hard to come with such payload?

The original idea behind this was to do any type of changes - not just
nop but other instructions too. Aka inline assembler changes. It is not
something livepatch-build supports but you can handcraft those if you
are in a pinch.

And the test-cases just do nop as that was the easiest one to create.
> 
> Thanks, Roger.

