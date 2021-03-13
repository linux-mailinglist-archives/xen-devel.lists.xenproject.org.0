Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21A9339D1A
	for <lists+xen-devel@lfdr.de>; Sat, 13 Mar 2021 09:50:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97478.185208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKzxu-0005AC-B8; Sat, 13 Mar 2021 08:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97478.185208; Sat, 13 Mar 2021 08:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKzxu-00059n-7n; Sat, 13 Mar 2021 08:49:42 +0000
Received: by outflank-mailman (input) for mailman id 97478;
 Sat, 13 Mar 2021 08:49:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BJcc=IL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKzxs-00059i-K4
 for xen-devel@lists.xenproject.org; Sat, 13 Mar 2021 08:49:40 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe5ec202-1663-46b1-9d57-c2159c57a447;
 Sat, 13 Mar 2021 08:49:39 +0000 (UTC)
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
X-Inumbo-ID: fe5ec202-1663-46b1-9d57-c2159c57a447
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615625379;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=GYZw0Inn0A+dAA6N63MYM5HJGsFiUCGFIUFAUotoqr8=;
  b=aXFIpYnOC4jd5zab/91fz7s7uAb6nBe4ZMWCPZOKVdDw9p6RQQ3fhhLa
   SQYRpRSnPxKwblEgxspco7eoAobAr6IUO3tjqgvkD4mSHczBEeZUgABJ+
   Kx+IksvI+kQEUfs+oBzHQkC4SiPC+sRmShtOyb+K5+QB47yP3fC2qj2fJ
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QYQqg+/hXoz8wK5jCl0pKX45/Gif8AAovgR/Xu682LZM/D03w58TiQ3BF29baDvKS3PJzH/+Dr
 JJ8pQSYn0nsGXxNFFyA3P9Dtss1X1b27+T3Rsxf5diIxUDuRdIljLwxiVUVeoqZ4MvFjsmvyDP
 NMN/GDP9SayYxvAwT21KiFv7Puwz5Irm2ihazQ4NsaOdF5Z8dYUwiVQvmqi8w89q+CIY+P13aK
 WP2k0pTz+UBTQmhK+CBskWq4LNNVXbi6SR6xhOsvgOkIKNAHpDMDdeG8KU28peh90wpyEKhsw2
 tKQ=
X-SBRS: 5.2
X-MesageID: 39386861
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7XvOdKAovEbheBrlHehRtMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmBEIyycFVB7QxQDKJoiDZ
 yH5tdGoT3IQwVsUu2QAH4ZU+/f4+DajZ6OW298OzcLyimryQmp5rnzDgSC0n4lPQ9n7L8+/Q
 H+4m7Ez4q5tfXT8G6460by6NBslMLl2p9/AqW3+7UoAxHNrirtW4h7Qb2Fu1kO0ZCSwXInis
 PFrRtlH+kb0QKpQkiPrRHg2xbt3V8VgheIoz/o4gqRneXDSD03EMZHj45CGyGpk3YIh91gzL
 lNm1uQqps/N2K/oA3G+9PKWxt2/3DEx0YKrOh7tQ06baIuLJVVrYAZ4XpPFoYBEC/Q+OkcYZ
 ZTJfCZy/BMfVyAaXfF+kFp3dy3R3w2WiyLW04Yp6WuonJrtUE863Fd6N0Un38G+p54Y55Y59
 7cOqAtsL1VVMcZYY90Ge9pe7r7NkX9BTb3dE6CK1XuE68Kf1jXrYTs3bkz7Oa2PLQV0Zobgv
 36IR1lnF93X3irJdyF3ZVN/ByIan66Ry7RxsZX4IU8kqHgRYDsLTaIRDkV4oSdisRaJveed+
 e4OZpQDfOmB3DpA5x10wr3XIQXBmIZVOETp9YnS3ODqs/GMeTRx6zmWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9oBW5YQKvRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbRlLsqk8el
 pCMKrq+5nL51WezCLt1SFEKxBdBkFa7PHLSHVRvzIHNEvybPIlt8iAf3tRmF+KPAV2Qc+TMA
 M3nSU6xYuHa7irgQwyAdOuNWyXy1EJomiRcpsakqqfoeH/ep05CZ4icLdrFRrCEiF0nQoCkh
 YDVCY0AmvkUh/+g6Ssi5IZQMvFccNnvQutKclI7U7EuV6kvsEpTHsDVzuIWcqa6DxeAgZ8tx
 lUyesykbCAkTGgJS8ajP4jOFNBUmiRHYlLFR+IfolSh7DtdjxhVGviv03rtzgDPk7Rs2kCjG
 3oKiOZPcvGBVdQoVh0+Kfn+lEcTBTVQ2tALlRB9aFtH2XPvXh+ldKRbq2oym2Ldx8p2ecGKg
 zIZjMUPyJjz926zwSuhT6HDHkqr69eetD1PfAGSfX01XysIoHTyv1DMP9Q4Zp/NNfh9sUMSv
 mSfgeJLDX+T8Mlsjbl00oNCW1Rkj0Dl/it5TjOqE6f91Q7CeDJIFtnS6oASuvsmVTMdrKt6t
 FBkdkxveGMKW3/Zd6N9LHPY1d4W2HuiF/za9ttlItdsq0zvoZiBpX3UTPH03dcwRU1Rf2E4H
 82ceBe4LrbPJVocNFXUyVF/kAxnNDnFjpijiXGRss/d0oqlXnVIpeg5KfJs6MmBgmkqBHrMV
 eStw1b8PGtZVrJ6ZcqT4YxK39Rck4y9TBL+/6DbZTZDEGSTN54lWDKRUOVQft6U6iKGbIZsx
 Z87ZWppoasBlbF8TGVmyB6LKJI+3ugWuWoDmu3aKl1z+A=
X-IronPort-AV: E=Sophos;i="5.81,245,1610427600"; 
   d="scan'208";a="39386861"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5wWU5RE2gBBByO8Bq1pN/68VD08qKg9x5t75Knf4T5LVDqD7NZPztfvxLtvtxTl7b+7D9LHbrJEhUvkrE3emn0rOf/uteOf+8XdhaL/ZL5kTzz1Sp15tCXGBpZA0fC4R8/CN7IO9WBFeuWcDI/ct/YlXYyBfJ1rTI+BMsBUtZhbBwHHMspix1mzb9fTr/O1GpCPe2OGY5bLqPSVB6hZozfWV1hOo/BZbZ2lhRVDiztRGMtfzUvxh9KGl63sOsW7SAys0QZa+o63AADfrFPh614TYwc389l2G15G+Cmcqc0Dmcs22RIPwbgzUi/odfJjMIJXoO0JZmPzd7L6GMPVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xH4fv7MBovRaRkdZkZScVDR+CihwIO0TVP4bEb/CRh4=;
 b=jw3THWxXLcDUYLPNKIkXw06qX2QfuFOhChTSSaLbslt3+wMj+pKzgbMrGRod8mI7pjsykuGqP8VMH2AwrVcabamLHurgm0V5as0ED7E/GuYM0cS6MP6PeaOscA73RXxlQibHhl8PRuANceb9UUbhxdlLPV1d2+9osFxIQ1ILWMimuvW2TCNUXmfp0YMPy3aF88klUOBf5edI0xzW9qs+uRtHIbN2/Qv8cR6huOKRe3sJP28LYjZ5trjspBqaafuOeAZxq7vAfb8mHix7467of6icjFM4yKBw9N+o/mgkLuE5XYZjjANIArDTH37ERwEzj3Bf5uEFF30mrOPOrzBZ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xH4fv7MBovRaRkdZkZScVDR+CihwIO0TVP4bEb/CRh4=;
 b=bpth6f5wQpVc3HyHfI1LBXO4vpcNGSoJqPd/hNaWdXTcUUILwe1BbD9pcEKb+5x0uTl19xgXkO7dvSZaF0C6oxk7VcuNimth0AOGb2Gfw15Y3sor8jpbUBPOLqBh6E7B9TQy17LpLQqKnyjPpRY7hE6vKuPYslSULc02p9eNAfs=
Date: Sat, 13 Mar 2021 09:49:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <committers@xenproject.org>,
	<Bertrand.Marquis@arm.com>, <cardoe@cardoe.com>, <fam@euphon.net>
Subject: Re: patchew - gitlab-ci notifications during the Xen 4.16 cycle
Message-ID: <YEx8hW+2StdaUpH8@Air-de-Roger>
References: <alpine.DEB.2.21.2103121236430.18926@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2103121236430.18926@sstabellini-ThinkPad-T480s>
X-ClientProxiedBy: MR2P264CA0050.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a3c7e5b-df64-44d9-cc03-08d8e5fce1b5
X-MS-TrafficTypeDiagnostic: DM6PR03MB4971:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4971D33DFDB6CA6F580CC5BC8F6E9@DM6PR03MB4971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IHayFVwvJ9Ch8oNrwxHAY0JEL/26Cqh9OouEFxkvesFu3+l1zYjr498rqwmAazhGQI7GdyB0DXoE5lch8v3F23E/fBhK8K8jNmNAIK2v1VzhP0ZM4Lo6CNlGUrfZJCgd0jnRVDmEetUeqNyw0/40gRv12PpPZMzPewY59Ul2Q00uJS+tcvCZ3imvCAfN+Q+bNcZMV1z/KLztjdJLG8J5xwuBoIvwyJcoE3zRlfNaEF1lvjMEn5uaEub6CwRsvc/mlvHPzRPF64D6O7AzgBSBCV3KrJDvxvLkjyGNE2q2716iNU0W29BMUz54R7MKvhYuxCYD7ep7jnghOX57NZkAlgYoScINrJfHYXtIhLUz29TMnveIob0si/+6o3Kr+dU4PwBO6q0I9AtLSK4b5giLt1+cKJSOSeLaJZTtMMCTME6u8mIPjzEz1u8nUMRaV1YmSMFLGRyCk3mvjH03zJKSnJqUjVk2CF2OV9WGc1o7ql958nTk7emCtOn2HfaxyduCbhbDVsyZbHDVdm7mLtpO9wonBM9W1PjIqUGKRnGM8T65lcUNPbFP4QzCehliOOLGgGQRejKeOr/Mh+CjEklJCC5dgydkKVjxmDJDt4F6PRjiwN5rU3hWgTDButqpH96DQK7rgngNztLhABK2u+RAk+HEIvYFIhCSLB7F0s43kQOzDMzBaj/3qjvluy/Uetgu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(66556008)(85182001)(66476007)(66946007)(83380400001)(86362001)(16526019)(8936002)(6486002)(478600001)(8676002)(6916009)(5660300002)(9686003)(33716001)(2906002)(6666004)(6496006)(15650500001)(4326008)(26005)(186003)(316002)(966005)(956004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R0psQTFJQW9zL3RxRW5qZUF2TlppbDU2bmhidWhxckMyb1hFQkhVMzRoRC9L?=
 =?utf-8?B?ajhndXozZHBEWHhUekRjdEdXSlkzdG9UVDZqeHVLU3IxdEJCWEpPdU5QNkNB?=
 =?utf-8?B?bjZLallhdXgvZEdBd0wxbkx2S1FET2oyMGJUOGdBc1JZOEFVWSs3SFh2eWxj?=
 =?utf-8?B?M3ZTUEJ1VDAvSFB4N2lIclFueS9Ic3duOFZTQTFDdHl5b2lwWVFraDhydHVk?=
 =?utf-8?B?NEZ2c21hOTYxNHZvTnJOM1hyQUxwMTRteVZUNmxNNjBQaE9idEcyYTU5bkEz?=
 =?utf-8?B?RHlEaGpKMlZVaHQxZWY3STcvOUFFWUJTT1ljSFhTNW1JWndjRjZtbWZlYS9N?=
 =?utf-8?B?NWo3alRCTkZNODBMNzAzaEFYa25zeng3VS92OCtOaGo4LzlxZ0twZm4yR0x5?=
 =?utf-8?B?VkFYakNQbzhwWXViNk12SG13d1JwOW5Vb2ZBR3NRalkwZ2pGVExVbytFNEFs?=
 =?utf-8?B?Q25na2RpUG9MVTMrMFBNUlpxc1puMlBjd1ZmVWdRN3pBUnQ4OUxpODZTaDFR?=
 =?utf-8?B?WVYyKzl1VnhNZlM4RWxRRG9ZbDlLR3RFM3kwZVpRVEIzU2xSWVRIaDlXNGNp?=
 =?utf-8?B?a0xzb1RDVGFQeFJjdVBVQjV5U3NjZE1FL3pOYlA2akZ3NENHb2JZc2RlbVBI?=
 =?utf-8?B?aE13K0xFK0REblJuVHh0RWtLQ2UxTE1ObFZvaXVLeVBNVzBKWXZMSnlBU1RI?=
 =?utf-8?B?Q3JrOXgxeUNkWHZFTFRoY1R2Nm1BR2xxTHJYdFJaQ2pBS1dQRGN5alUydGg3?=
 =?utf-8?B?MjJ4MDF4dHE3Nmo1a2twL0MxZGYxVUFpOVp4NDZ6MW9XYmkyaHJnR0NjcnRz?=
 =?utf-8?B?NkJWM1NqVmlCNjdCTDVzTUJHNkxYaHVEdGFiRUdkVkRkZU5sU1FWRVY0aE1J?=
 =?utf-8?B?enYwMkhnTjRUbnlWOHZtcnBQaDJFOU1DdFI5UkRBT1FMdHM2TzJRQk84ZU1W?=
 =?utf-8?B?Ni8yclhuM3puamNmT0ZGYzBvR0xPZmxSbFJlTUVHNjI1elpnMGNac3RPMG0v?=
 =?utf-8?B?Zi9uQitmK0Z6emsvSDVyT2lnc3AxVTNOaG1QOTA5QU1tV001YUtleVNqMGJ3?=
 =?utf-8?B?UC9IMlNIRkRTYk9IUWh0dWU5bGNoQnY5cDlldGMzZEhZelUySmk1NFdaL1hO?=
 =?utf-8?B?Zk1wVTR4TEJaNjlaTGdMaUJSUHNpeTRncXcwTWZZNkJyeVhFdHNlODVWZGth?=
 =?utf-8?B?R2NZNUN6M0ZSTTRhQ3U1Q2N5STNLWlF6VHF3UHg1clBucmlxSWRSdEk4TmpT?=
 =?utf-8?B?NFRSK3F0Q0MveUFVUjZqbHdGWTFhTVlZQTQ3NllRWlNydmlEMWo3Nmt6N1V5?=
 =?utf-8?B?SFF6U0pyclJFbWdZeGYvd3hUTk1mOG4raTRWZVVJRnFBR3c3ZU5TbkRhVUVi?=
 =?utf-8?B?ZUdYSnJsR2RRT0tXOWVoeHdsL21sTHlnNkVUYUtvNzhYckl4VHhHZC9IMDI5?=
 =?utf-8?B?U1g2YVk2aHNxa0JiNmdHWU1aYXk1K2hhV3d0eVloNnROUlFlV1Q1UFRVMW4r?=
 =?utf-8?B?bjlzSHBWaFlNanoza2doejBoZENKbEc1SjcwRFhEZlM3Wkk1YWhmUy9RVkF0?=
 =?utf-8?B?Y3RjdWNRZ2ZrQXJMVmVxcmdvQk9ObmtKYnNuWCt2TURuczNqY2gvVUI4Nm5Y?=
 =?utf-8?B?d0EyalQwaDJmVElPS2JBZ2syY0ZPYTVRSVNHOUpJOXgwajJYcS9hNGxlUzhC?=
 =?utf-8?B?aXBjK1FKZnJPR09ROEljNTlQMzRmT29yY1R2aXNEYS9lSEhaZXdkcTZVMXJX?=
 =?utf-8?Q?JC2FEPaxFjYf4+WySavw7MsF2DXhf0eoDXM5G6Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3c7e5b-df64-44d9-cc03-08d8e5fce1b5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 08:49:15.6721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmzDocsOvrj4VFcZtXMjEuutcDn9nvvSNOj93s+v3hloqJvP7WcZ4T7rdN/OoGIHjVvLoWfoust5EBWKlEExeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4971
X-OriginatorOrg: citrix.com

On Fri, Mar 12, 2021 at 12:55:38PM -0800, Stefano Stabellini wrote:
> Hi all,
> 
> During the last 6 months we have been working on improving the Xen
> Project gitlab-ci and patchew infrastructure.
> 
> You can see the results from gitlab-ci tests on the staging branch here:
> 
> https://gitlab.com/xen-project/xen/-/pipelines
> https://gitlab.com/xen-project/xen/-/pipelines/269678673
> 
> In addition, and more interestingly, now we have patchew integration.
> Patchew picks up patch series sent to xen-devel by any contributor and
> commits them to branches under this repository:
> 
> https://gitlab.com/xen-project/patchew/xen
> 
> Then, gitlab-ci tests start automatically. Patchew waits for the results
> and send a notification email. You can see patchew pipelines here:
> 
> https://gitlab.com/xen-project/patchew/xen/-/pipelines
> 
> All this typically happens before patches are even reviewed. Today the
> patchew notification emails are only sent to us in the Gitlab-CI working
> group. But the good news is that we think the results got to the point
> where they are reliable enough that it would be good to share them with
> the community.

I'm not opposed to that, but we seem to have some random git clone
failures during builds (at least on the x86 side), that are more
frequent that expected. At least recently I had trouble getting a full
gitlab CI pipeline run that didn't hit one of those.

I will try to figure out what's going on by adding some more debug to
git to see if I can get more verbose information from git on exactly
what's failing.

Thanks, Roger.

