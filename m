Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315DC3A15E0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 15:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139376.257750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqy6M-0002bF-Sr; Wed, 09 Jun 2021 13:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139376.257750; Wed, 09 Jun 2021 13:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqy6M-0002ZN-PZ; Wed, 09 Jun 2021 13:18:34 +0000
Received: by outflank-mailman (input) for mailman id 139376;
 Wed, 09 Jun 2021 13:18:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Llia=LD=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1lqy6K-0002ZD-If
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 13:18:32 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b762a402-6ce0-4de1-9ebf-e8f31535baef;
 Wed, 09 Jun 2021 13:18:31 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 159DITjv017183; Wed, 9 Jun 2021 13:18:29 GMT
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 391g4g8ynr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Jun 2021 13:18:29 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 159DFei1014735;
 Wed, 9 Jun 2021 13:18:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by aserp3030.oracle.com with ESMTP id 38yyabqp90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Jun 2021 13:18:27 +0000
Received: from BN6PR1001MB2228.namprd10.prod.outlook.com
 (2603:10b6:405:2e::38) by BN0PR10MB5094.namprd10.prod.outlook.com
 (2603:10b6:408:129::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Wed, 9 Jun
 2021 13:18:25 +0000
Received: from BN6PR1001MB2228.namprd10.prod.outlook.com
 ([fe80::ed56:7043:6d81:8547]) by BN6PR1001MB2228.namprd10.prod.outlook.com
 ([fe80::ed56:7043:6d81:8547%4]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 13:18:25 +0000
Received: from tomti.i.net-space.pl (84.10.22.86) by
 AM6PR01CA0071.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Wed, 9 Jun 2021 13:18:24 +0000
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
X-Inumbo-ID: b762a402-6ce0-4de1-9ebf-e8f31535baef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=aWZvyMpXSmm1aqoicaf7ffWPiF/m0Fq3CfRZKcMo76Y=;
 b=Tw9UofTARJ7y0tuOez62YrdrVEvPQdJERQGRLhTTQSb9dTCYgzJVZep1WosVL00S4a/D
 RaCpIKMs5huMHGg2N6GbBg3AKNpnfIgq58MHcfSETqOWXWL5m2cDJG2rnWMdkfACK2Gi
 ZqpluGW1N2wd/Vn1f0Z17H6sEuCuEbhozjNwFy6OU1ZLMcdNdmkxwQNA3wUbIadbndH9
 QOKVuCxoPQXnZyDtVTW4t1R6GCXlgV2Zn2Db0H51yNQVTdAOB5p41yq4ggj+lnuHkGbk
 lAELBJJFpHZYUuc/w26l+OxOSYGLcBWDGWiQvxW0Nw9aZL2u6NaFczIlfDO/VOy4ZkdN tQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxLEuQ0YR+N6YM/PRplVBH5j/cCaYWgano26ZFk2ShJhFFis5Jkh7Edrvh2judbJgZnENAegEjyShs1Lmqf3aCUg+FBUOu3Tp2o4xUmkmO1kr5n2sPkQj3XOolMroOgayc6zvVqw1ErepXpL/YEmotIbQhyXra6MEr3V09nibrmddtDqhAaUP+h78E9gP2U0Z069TYqPlulhQRQshRUN+y8qd9RoG1h5JTdXoCWxUzPoUFXs6GB01zPjUO+IOYNMlvW8RZmnEKCXA5Ug34fpVrZfpULMzfuKCZrlCFueNIhZ3etTvxos/7tWXJaBDbramoOQW00Q+kXLGAGWdQU32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWZvyMpXSmm1aqoicaf7ffWPiF/m0Fq3CfRZKcMo76Y=;
 b=E7/SC+NGqV8Tn2/jRgPIK5vqIgbXwM6GMNp4RV0Ji4P0h/yYzgWa1NKDOOE1dfopxqxIeDstTcc9i8h1V7wI2ZjRYPf6ZjALCzWjghVcKqBLg7EpSxkCHiDhJo/MWR4QIiYR+bQKkNMudL/iZS9+Ghr1O+4RarYI2hZU8u074tfacpKdF8FJdoxyybk9wxjOsYwr/gzVFghWvhI7qcVw94AzP6Jpf90EFgHQEZE0/wrdS9UJe9Me0OYUSjvFtrq9jhf9sRFm0eB0tgEX+tn4KMdJo3uK/fN3lOgbz3dNJOIKnGyFopjZ+nW29VUT/PkjOnir2ZVldxE14f5FBKBGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWZvyMpXSmm1aqoicaf7ffWPiF/m0Fq3CfRZKcMo76Y=;
 b=ZblRIXZsY0fQNRAkmhtSU7rWG5F39IMu0txatRzmqx38gzRrX78+MfUUNwXYaBftHCcillwiIGo4d2pKHNSlNm+5z1Ciy/QSMipriVhNgF59aFDZwShX7lnrORF4E5y18t3Zj8BfAHrMKRAFEqHsAhlKQV5aJLkHvBTDkmb9T1c=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Date: Wed, 9 Jun 2021 15:18:18 +0200
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/5] xen/x86: manually build xen.mb.efi binary
Message-ID: <20210609131818.pkpzbzi7p5x2fu7i@tomti.i.net-space.pl>
References: <28d5536a2f7691e8f79d55f1470fa89ce4fae93d.1611273359.git.bobbyeshleman@gmail.com>
 <3c621726-31c4-6a79-a020-88c59644111b@suse.com>
 <74ea104d-3826-d80d-3af5-f444d065c73f@gmail.com>
 <a183a5f9-0f36-187d-fd06-8d6db99cbe43@suse.com>
 <20210517132039.6czppjfge27x4mwg@tomti.i.net-space.pl>
 <ee89a22d-5f46-51ed-4c46-63cfc60cbafc@suse.com>
 <20210518174633.spo5kmgcbuo6dg5k@tomti.i.net-space.pl>
 <51333867-d693-38e2-bd1c-fce28241a604@suse.com>
 <20210519124846.go3zyqzojsaj35in@tomti.i.net-space.pl>
 <c55f44dd-47bb-8e60-c1a3-446c561d6740@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c55f44dd-47bb-8e60-c1a3-446c561d6740@suse.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Originating-IP: [84.10.22.86]
X-ClientProxiedBy: AM6PR01CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::48) To BN6PR1001MB2228.namprd10.prod.outlook.com
 (2603:10b6:405:2e::38)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4894e9f2-d705-4616-9a7a-08d92b491037
X-MS-TrafficTypeDiagnostic: BN0PR10MB5094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN0PR10MB5094A70BB12957680DD86D8BE3369@BN0PR10MB5094.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rio+zWsjCcaGjOS3OYbE5ALnGE9FCsmXbPgO+lcNsyGFEfjgnaleWbSHnddDgELhOs08kVgNmn9tH74JJhh3Z7qtzVZLj55AE7qeVSly6OZqyylv/iQ/vyya+HKuRdTMrc28lxxXk0BclbtpQihWcCBItRo6CGhmCjDEkC06kWTz3t+vBAS7i2astDGrf2hTJDauq6Z+BctlZX11fE0KtMNQr1gY5fIfcguhnjHfn7OMrKXvpMRS4u6oILuGQJgBGttiUErile7ZmlyVlDTT6/7D1m0FtK8Z9EDmqhwj/NzXaVxuRrg1dmSQOu42/ezZWThoyJYXM68EelkgoIJy0ndnrvkDZLyg8eBY8p6SebyAZ5DhlrNOXkdafDzMmPMlhILaJwH9npnwG8DlEWQKn8LiKMN+1n3v7/avJ8TSUz71uFNmP0mlYAs17W1S2rnKe0Q3E5XPgoWHwDV8xaG8x7vM/ZJ1Xw03gMqQBZAjC0YpLXgzpfgTFifQw3e208e3PdfV1KNRObpM+qjgdhLbf/fXs/I76G/cJAW6w10Vr/8cMKvwSD9Q7CgNflYfBpPhqR4MihMxmZwQLfj8KugbCBNwS5Noj5aPHUHOUOQAjVyC9YDJAsV/VzVqVLhjvSZnNrJmHaPGsWZ3sGtZKblzYQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1001MB2228.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(366004)(136003)(39860400002)(9686003)(55016002)(83380400001)(2906002)(5660300002)(44832011)(6916009)(66946007)(478600001)(66556008)(66476007)(86362001)(7696005)(4326008)(54906003)(8936002)(16526019)(8676002)(53546011)(52116002)(316002)(26005)(956004)(186003)(1076003)(38100700002)(38350700002)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vsz79ukWZHI/5CwrWREouw9GXrhn2ZP8NBOHC6WLadXEBeiH6UTzJ7batwZF?=
 =?us-ascii?Q?34P3yJOJQprtqxtwn8IQOsNbkNAHJCjQU3Od9M/8k6TPY1IBtPU7OEZt+aeG?=
 =?us-ascii?Q?LaUvVz81xcCUmsg5Z4PLP2vs2Yryz3QeOq7hbwe34+HGT1D8s5JaZ6ZHF96b?=
 =?us-ascii?Q?rPYoI8i5kubgE14Yxy7dPe5pLGKkpjvPiLEzdpiJYoArsH9CgZQH5GoUt/ZS?=
 =?us-ascii?Q?oIgtV2WD9Z/AljCjRLtFfujV3ybGi8CimsG5rWmLDEdjp7Fb+y2B5papK0JF?=
 =?us-ascii?Q?cSIsQ5MXbNgLsxKVa6PoZYPiWkiGkTZSLB7cawMAKzCdOezjlldpkL3vNCQk?=
 =?us-ascii?Q?oS9QfonY69CF1u9Om9O6SckPY3gKhKzWkeJaHWNUzMG257lGjfxA81w41j+G?=
 =?us-ascii?Q?5uEAryWcityb0kpGSl7p0VZCUpLYIR5ClF2SFztq3Lg+88KFbJfRwHMut1Cc?=
 =?us-ascii?Q?FqDBFVWY0ctV/zB/Tkd3aK0P+nf1FdyJosYGadqMoO7dCipMtHuatYHywNBs?=
 =?us-ascii?Q?jUwswOaIF8DM1QDjPMUxkeZq0v9lYuljSCCenH87Ua3/XwqEu3/xfsA+syQC?=
 =?us-ascii?Q?rqjWC8Q3wwveIVeiI+vKs+VvRJiy5jhAyjgkVSDTCE4dbas2nt+Cw/WoJchj?=
 =?us-ascii?Q?7tuJjFrEpZ9q6sQsw/xGQNAcb3Sc8u8C6CrPvITgs8pdYwxq4+19jl6k3KQr?=
 =?us-ascii?Q?NFJaqBR8ZZf4RZqTHKFDTmyh8mEjStrebMfw5JDv/N4yNtke5d7m9p1UaJH/?=
 =?us-ascii?Q?TDm2LY/upif5ZoagxvoJwPfa4oPvEE4TXu4DC5wVcIj2mKwRrpq7xIVal/zi?=
 =?us-ascii?Q?TXQEQuaM9CZ+xOURGHfUUgkOXX7JvIsaFT34ioI1AKmsfZKLc2JWuUUEaoWN?=
 =?us-ascii?Q?p+yW+MSFjBJSYkJy8+Pw0N6Nbhf8CQssVNWTSpnufMjTEonFrzpfFKbDFtU3?=
 =?us-ascii?Q?aZtFLW40g0YYmHJ7m+Ulqw3Gq7FkymnRixomXZXp+k376vhb/ugjK6h8l0pO?=
 =?us-ascii?Q?0kr9QJoWSB9BGA5/mInKrInXw/9QuBbPF0meLABOQmWTQKh7MmVS8nMYS0e0?=
 =?us-ascii?Q?Q1IK3oJK2L1bpalsRPrRx42wkGGEy1+5ek+u5u03KmW9hgTR5i/subYAOBRd?=
 =?us-ascii?Q?HJiZsSO01tFE+IFMmlHCJU4GpcODzhaGg1WiF20htrspfy5zmzmWTYMdEhP2?=
 =?us-ascii?Q?2Xxle76AwbOe5TGLtdLvc9xQD5WlMEzGAPauHyt5UP3zUeYtaOzAGF+TKrZv?=
 =?us-ascii?Q?oP8ySAGy2YaaeicjGV1jFOcdkoQwQWosZcyUV4QuNDD/gh1pHlKGFt6E+RD2?=
 =?us-ascii?Q?TbjuLFvJGj+YqcsStcSh+9MZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4894e9f2-d705-4616-9a7a-08d92b491037
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1001MB2228.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 13:18:25.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sANRKjskIO0gpdPI4mw3l4P6J8RsTFKNIhKRe9fakWL6J2ZFgkXk2RPtmElJqzEumzu+1XTo93w3I95gzCjJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5094
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10010 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106090066
X-Proofpoint-GUID: JZXLkFih4OPPl-Ln4uPQ1-5JNpMjKM8a
X-Proofpoint-ORIG-GUID: JZXLkFih4OPPl-Ln4uPQ1-5JNpMjKM8a

On Wed, May 19, 2021 at 04:35:00PM +0200, Jan Beulich wrote:
> On 19.05.2021 14:48, Daniel Kiper wrote:
> > On Wed, May 19, 2021 at 11:29:43AM +0200, Jan Beulich wrote:
> >> On 18.05.2021 19:46, Daniel Kiper wrote:
> >>> On Mon, May 17, 2021 at 03:24:28PM +0200, Jan Beulich wrote:
> >>>> On 17.05.2021 15:20, Daniel Kiper wrote:
> >>>>> On Mon, May 17, 2021 at 08:48:32AM +0200, Jan Beulich wrote:
> >>>>>> On 07.05.2021 22:26, Bob Eshleman wrote:
> >>>>>>> What is your intuition WRT the idea that instead of trying add a PE/COFF hdr
> >>>>>>> in front of Xen's mb2 bin, we instead go the route of introducing valid mb2
> >>>>>>> entry points into xen.efi?
> >>>>>>
> >>>>>> At the first glance I think this is going to be less intrusive, and hence
> >>>>>> to be preferred. But of course I haven't experimented in any way ...
> >>>>>
> >>>>> When I worked on this a few years ago I tried that way. Sadly I failed
> >>>>> because I was not able to produce "linear" PE image using binutils
> >>>>> exiting that days.
> >>>>
> >>>> What is a "linear" PE image?
> >>>
> >>> The problem with Multiboot family protocols is that all code and data
> >>> sections have to be glued together in the image and as such loaded into
> >>> the memory (IIRC BSS is an exception but it has to live behind the
> >>> image). So, you cannot use PE image which has different representation
> >>> in file and memory. IIRC by default at least code and data sections in
> >>> xen.efi have different sizes in PE file and in memory. I tried to fix
> >>> that using linker script and objcopy but it did not work. Sadly I do
> >>> not remember the details but there is pretty good chance you can find
> >>> relevant emails in Xen-devel archive with me explaining what kind of
> >>> problems I met.
> >>
> >> Ah, this rings a bell. Even the .bss-is-last assumption doesn't hold,
> >> because .reloc (for us as well as in general) comes later, but needs
> >> loading (in the right place). Since even xen.gz isn't simply the
> >
> > However, IIRC it is not used when Xen is loaded through Multiboot2
> > protocol. So, I think it may stay in the image as is and the Mutliboot2
> > header should not cover .reloc section.
> >
> > By the way, why do we need .reloc section in the PE image? Is not %rip
> > relative addressing sufficient? IIRC the Linux kernel just contains
> > a stub .reloc section. Could not we do the same?
>
> %rip-relative addressing can (obviously, I think) help only for text.
> But we also have data containing pointers, which need relocating.

Ahhh, right, I totally forgot about it.

> >> compressed linker output, but a post-processed (by mkelf32) image,
> >> maybe what we need is a build tool doing similar post-processing on
> >> xen.efi? Otoh getting disk image and in-memory image aligned ought
> >
> > Yep, this should work too.
> >
> >> to be possible by setting --section-alignment= and --file-alignment=
> >> to the same value (resulting in a much larger file) - adjusting file
> >
> > IIRC this did not work for some reason. Maybe it would be better to
> > enforce correct alignment and required padding using linker script.
>
> I'm not convinced the linker script is the correct vehicle here. It
> is mainly about placement in the address space (i.e. laying out how
> things will end up in memory), not about file layout.

OK but at least I would check what is possible and do it then.

> >> positions would effectively be what a post-processing tool would need
> >> to do (like with mkelf32 perhaps we could then at least save the
> >> first ~2Mb of space). Which would still leave .reloc to be dealt with
> >> - maybe we could place this after .init, but still ahead of
> >> __init_end (such that the memory would get freed late in the boot
> >> process). Not sure whether EFI loaders would "like" such an unusual
> >> placement.
> >
> > Yeah, good question...
> >
> >> Also not sure what to do with Dwarf debug info, which just recently
> >> we managed to avoid needing to strip unconditionally.
> >
> > I think debug info may stay as is. Just Multiboot2 header should not
> > cover it if it is not needed.
>
> You did say that .bss is expected to be last, which both .reloc and
> debug info violate.

The .bss section has to be last one in memory from Multiboot2 protocol
point of view. However, nothing, AFAICT, forbids to have something
behind in the file. Of course if you ignore the data at the end of file
when you load the image using Multiboot2 protocol.

Daniel

