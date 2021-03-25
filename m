Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E663348C69
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 10:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101332.193732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPM3R-0007R4-Io; Thu, 25 Mar 2021 09:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101332.193732; Thu, 25 Mar 2021 09:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPM3R-0007Qf-Fq; Thu, 25 Mar 2021 09:13:25 +0000
Received: by outflank-mailman (input) for mailman id 101332;
 Thu, 25 Mar 2021 09:13:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WusM=IX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lPM3Q-0007Qa-6K
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 09:13:24 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c9ea82d-93a1-44bb-90ad-99af614c461a;
 Thu, 25 Mar 2021 09:13:23 +0000 (UTC)
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
X-Inumbo-ID: 2c9ea82d-93a1-44bb-90ad-99af614c461a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616663603;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3QGBIwDxSIudNwac8EMQLqvFIk1qfsmsE3bo1R2Lodc=;
  b=ev0DhdGMAqstcww83sGtOVFPUHqSAed91SSSFIPgg61d386LxxCCWWFH
   icTFYTccqxtCbvT6s7mqfwOUFDgjPwoP9es2UE4r301BRbRtdu07IQzJR
   vGqxOtuNqXpCe4ldignxcFLw6PF1biinCp59q2g9drz2MSDYsbh+f9CDw
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vSFjSaYp5itjCOs7bOeFdiMfEdh99xpA4Oq9aYE0hPlK8IoE+piZf72tLqOVcz8OG2my3YmfAm
 ARn+pjbb4RiqSiZx+IBhPPa9twT3RqTPHoxOiI5ScDnYdP9XIC4EmyLqxKIYs/0nuGFmFIxoiz
 rjL4cgNAQOdRpsy1DuLQTyKzYoWyuEAHf9EedZhK+KPyfaGdj5tCgV4dvX67eElDaWJUUtP/s8
 0m0gRn3geqYjmrg0b1YhZbQZe0pMK1pd9rfI6ia6aH3Pchle2Hw5RC56zJF2OGcxtaHDPa+QpB
 PQc=
X-SBRS: 5.2
X-MesageID: 40083900
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ChcYpaGFI0zJX9DEpLqFWJTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYfNi+wFEpqSA5aQbc4Do
 Ob/MpbpzymEE5nFPiTLH8DQuTFupn3j5rgexELHFoK7wOJgDOu5tfBYmWl9z0ZVC5CxqpnzH
 jdn2XCl96emtyY6juZ7W/c6JxKhMDso+EsOOWggtUYQw+c6DqAS59mX9S5zVUIicGprG0nid
 zd5yonVv4Dl0/5WkGQjV/T1xL70DAogkWSuWOwpXf4u8T2SHYbJqN69PtkWyDU4UYho91wuZ
 gjtwny1+s1fGH9tR/w6NTSWxZhmlDcmwtbrccpg2FCSoxbUbdNrOUkjTJoOa0dFyH34p1PKp
 gJMOjg4p9tADenRkGclGxuzNuwZ280DxeLT2MT0/blrQR+rTRXyVAVy9cYmWpF3JUhS4Nc7+
 CBCahwkqpSJ/VmIZ5VNaMke4+aG2bNSRXDPCa7JknmLrgOPzbop4Ts6Ls4yem2cPUzvdQPsa
 WEdGkdmX85ekroB8HL9oZM6ArxTGK0Wimo4t1C5rBi04eMBIbDAGmmchQDgsGgq/IQDonwQP
 CoIq9bBPflMC/HBZtJ5QvjQJNfQENuEfE9i5IeYRajs8jLIorluqjwa/DIPofgFj4iRyfRGX
 0GcD/vJNhRz0yiV3Pi6SKhGU/FSwjax9ZdAaLa9+8cxMwmLYtXqDUYjly/+4WqJFR5w+kLVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ild3tLoAQNIn7laLprgaTaRUlimF+8YjNvRcLfFw
 BS435t/7isEpCWzSc+T/WqL3ydlHlWgH6RVZ8Tlumi6K7eC90FJ6djfJY0ORTAFhRzlwovgn
 xEchU4SkjWES6rr76kgpwSDOT2bMJ9nw+vHM5RpRvkxAahjPBqYkFecy+lUMaRjwprbSFTnE
 dN/6gWh6fFpSyiMlIlgOMzMERFbUOeBL4uNnXDWKxk3pTQPC1gR2aDgjKXzzU+YHDj+Ukpim
 v9FiGMYv3QDl1BundX77by/DpPBxagVnM1Tko/nZx2FGzAtHo26+ONa6ap+0a6a1cJwIgmQX
 r4SApXBjkr68G81RaTljrHKG4vwY82OPfBSJ45davI53+rIIqUtK0PEvNO5qx5PNT2vuJja5
 PYRyalaBfDT8850Q2coXgofBRuoH4/iPXyxVnL6nO70HNXO4ulHH1WA5UgZ/eS4GjvS6zWjN
 FXjdcpsfCxNWu0QNic0q3TZyNCLBSWgWPedZBdlblk+YYJ8J10FN3ndBGN8ldt9hA3Nt31m0
 MTW74T2sGIBqZfO+gpPxtE9V8onumVJEQlsgbKEvYzFGtd+kPzDpes2f70srIhDU2KmRvoNX
 Se+yNb+e3ZXyHr789sN4sAZUBXYlM78nJs4aercJDREhyjc4h4jRCHG074VL9WU66eH7oM6j
 58/tGThueSMw71whrZszc+AqVA9Q+cMI6PKTPJPe5D6NqhP1uQxoOs/c6olT/yDQKBVH5wv/
 wNSWUgKuJZijcji4Ur0i+9DozPy3hV7Gd20HVAjV7i2o+v/WHBO1pJWDep26lrYQ==
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="40083900"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScYLY6NOV0sMmIZLRC32IDZwfwqBA35Ci4wSFo9QCYnzIGRSN20ZYM/wtn2ZoLJD3FieCbPisfFrUP6OldfYPYcLdsFgbsueZTL+T6KeQ+wc0pAMx4LYcc+7gFjddsUNk+MwjYrAl7mBoFCU4KQL1ytEFq0bZL6gu+9DoCCEDGqQJr25ggU8k/QcW5/XvLYHi4d28TrwgdRyUHJRoK7YJkbU/gvW2dN8wMiPMwxkWmB6xaiibh1ZWZclp3wJrZm/VABHile4RfwiDY9mUXokT+JH2CWof3+xcBW5ugiu0ZC5zY24rC+2EDW5EToJh+S5lt7opyffd1f+CdummW5igg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QGBIwDxSIudNwac8EMQLqvFIk1qfsmsE3bo1R2Lodc=;
 b=BxMpvHKSQAepTclV3JjyW5OIsiuGjl1znWhxZj4PZnnnmiM32wTpd14hQ7UoMLK5tgaqMqu+0Hwx9e1tw1fqxJt7l+NeQMR+Z2lR84wyB1cGZet1oCYoB4yFYz7F9bFPDOJHhI7ReLoAFsgrvy+JHjgN9uD2mjnGwsXB6Zb4JVvUQFO9p0GGdBQtejrEpTRSKljoDy+w8ZvS80sB1duwmadcOqpO/q6DIsiPCKh7zoweirwrYTFTFcLJDEYNrs+OUKEN8asOQPyQQQBdk2N9/HzLapfI0HxqLWLUi+2vjFG0QYgljyW1LeNwTHpA+kp4GEgkeILBuoXGN970Jmbu1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QGBIwDxSIudNwac8EMQLqvFIk1qfsmsE3bo1R2Lodc=;
 b=fgYGz6mP+Wcf/Ak1Y6wli34FCa6McHp3OEyz/DP5hZn8AqVZ4Mt61K2LkqQNrp+sX7BaMVmt+iyt5A/vh0AEaZshxr4MewuIw72JKrteFTZ7625oPaD2YLZYDvbZ8sv9v9iqSv45+4oR4NnNiEUmKvOSxnA7cXLUqh9JqJNTo3A=
Date: Thu, 25 Mar 2021 10:13:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 4/6] CHANGELOG.md: NetBSD lib/gnttab support
Message-ID: <YFxUJwF45F1HD2jU@Air-de-Roger>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
 <20210324164407.302062-4-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210324164407.302062-4-george.dunlap@citrix.com>
X-ClientProxiedBy: MR2P264CA0076.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47566690-ba5e-4a50-fee2-08d8ef6e3ae1
X-MS-TrafficTypeDiagnostic: DM6PR03MB3945:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB39451360C9F47F11F49A64958F629@DM6PR03MB3945.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BkkkMykju/+ZuRLg4uHsuxr69ZEX1R7aTtRkCfViBGD7MPaVLDSyq+7GElU4/33hE8fkss34F6g8pPVfWL1sfVUU2gqXakD/y34DNBYfUOeBrjSEE7uBFiDHImsEdkNDwhygiA2K9i8bC7iPim921QtgEc0s4k6TPiRJJhvyO1qmaeY5sLsb8eWGKbIW4+glhufXofhpRBqGnsQRM5h3uLYto/p0WKFP11oDzJHOBCsB/HgRAk0ufXNeShG2a8mqf4F6L7QbbHh51SMk8W+4FxPXD8mPyftPA9j/z7h20Y1AyGZm80LqsMNSq6oYiWrYZib7Xj79ofsQuxuC+7w5sOescBTZut9INICKNiUcsIbMCqrtjXrn19JH6Sy0G618kfGjHPXr+rfRNOoTtVJqF0gtC1D9RmXjk9so0qW+1qz5+iDqcERYbZSPdL1SUXBLuNtJVoM2MELqll7utlzEsLHJHJyRmyrWovPEA68wcslWmElhGC4dGczQo/3fwDTJUyMIHZXIGGC9TxLjQIcuh+EVMpsjCOupNbZS3DVDhix0AvY1wqGRqmoeur2eUbZyDVbC/1o8V1YCVN0bS7kZbcjjK1mPKYIe0C4QpXVLhziiHQ++uVAtIlTZuhviFyJypW1p3L3o/4RatQUJMAC6ACX0ddr1uNU/y+8k9tv9JuXJnDo5Xrc5w4hjJ4AwI8B0UGNgYMacpJgzChbCc/OiJBmiMwKlHPQcj3/q6IwNYO5jX6WPmu41miYaAhB099Rn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(346002)(136003)(39860400002)(396003)(8676002)(107886003)(66946007)(6862004)(66476007)(66556008)(85182001)(558084003)(6666004)(86362001)(8936002)(4326008)(9686003)(5660300002)(6496006)(2906002)(26005)(316002)(956004)(478600001)(6636002)(16526019)(6486002)(54906003)(38100700001)(186003)(33716001)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NXl1ZmlPYkZmYW1RUjh4TUhzTFhBa3FSdVVjRDJEUXR2QzdUcms2ZkZWS1pU?=
 =?utf-8?B?TllnK0RxR09RbWVpaEVUWWxMZWhacWx0YXZuTXZZWUhrU3h5MVN2RWsvVENy?=
 =?utf-8?B?V2tpaU9QUG1uazJETDBSS0dvbWxIUHBLUkFEbW80Q3hIWDh0c1RPNzBZUnd5?=
 =?utf-8?B?TFcxV0FvbnBTZ1VRRkZINStnNzlRTFZOYlVSTTRjWDBqRnRnRExTNjhZY1Za?=
 =?utf-8?B?L2JMV0xrdm9heVJ1dmczb0R2MUQ4dTJDUytzbVhGNGx6a1d3bTFCNTFxeEJ0?=
 =?utf-8?B?L2ZzcGRkSTRNMnF2MnVxWjM3QlBUcVQ4OThCNllEQlBWbTVWRXh2TlhWVzhm?=
 =?utf-8?B?NXlrci9vVkF0dEtvelFEOU42WkRNTFRYSEdVeHpRdnJRZlBwWXphQ0Q3cno0?=
 =?utf-8?B?VzJVekk3dEVtRncyeXdtOTVXMGZxNlRQTVk2dTJ3Y0NvRTh6MTlNdmFxRU5s?=
 =?utf-8?B?K1hCcG5iQUtjM1BXa1JySndoK1psNkpuWDFrbVp2Y0RwN1FzNFQ5alZLeURO?=
 =?utf-8?B?NzB4VDRieEJuOUdMSml6RG5jRkdhYnFDSWZHbnVFL0J5MFU3c1VkNk13dGk0?=
 =?utf-8?B?YU5Bb0lURW9ibTYwazRnTG81aW1NaGUyUHRraThlUnNXQjVNN01SaDRQNDFN?=
 =?utf-8?B?THQxNDBiT201Q3FFL1dZaHhFdVQ0T0hXM0diTStFb29vZzgzTkNnbnpQN2pN?=
 =?utf-8?B?RitGMVpXSXp3Tk84eUwwWEFQc3h3bk5JaCthOEpnTWZnc21HQnhVVVliUERm?=
 =?utf-8?B?dk1GdDVQYjIyTjdZQUx0SitIcS8wNExWdW8yVmpTbDd2bGNDSExOUGtCMkdG?=
 =?utf-8?B?bGdYT0J0cms2ZFJ2SHp5L3NLQ0NGNUU5VkJMY01ycThSVjRvU1F6UEtiNU56?=
 =?utf-8?B?TXhOTExtNzB6dlZzSzFaeUtwYUJkanVCTVBpejBhclNZMFlueW1DMEVPZ01H?=
 =?utf-8?B?eHVGLzZDK2FLT1JmTlpQSGs5dXUxTkthS0ptcWYrSVdObWVJNU03ejVCTDRv?=
 =?utf-8?B?QTgvRnByb2FuRzFSK3o5ODQ1S0FKb0NwZ0V6R044UzhOQ05DZWYxODNRc210?=
 =?utf-8?B?UzJ1elFpUnc5ZUNablFxTk12cVRWalQxNlg0K2VqRnN4d2xnM0diZ09wM1Ja?=
 =?utf-8?B?SFVha1JyT1BYUGJ2VGVLOXJtU3VmTE9YbXhmWFJ6aUlHa2NVcWhKUTBOUUZn?=
 =?utf-8?B?dUpveTFWclI3OHVHUnJaWGRBQ3c2eE02N1lKTmo1VDI5OTUzMVE3dkREMzFj?=
 =?utf-8?B?YVkyM3V4R1E3SUdWNTRHK0N2MXhyRU5HOWVlbVFsbGxScmFadElyL3B3QUU2?=
 =?utf-8?B?WGVXMXZOVjJjaHJLakZlQ3lRdmNyY05xaGlmZUkvODhZZ3lic3RTUXN2OWk5?=
 =?utf-8?B?QlF1QU1lanJ6enNtTUdzYnVGVGIyNVgzUFBpanRPQWpnSlkzZDYzU21kNXpD?=
 =?utf-8?B?WkVjc0NRcUxmMWRlL1oxOGRHVGhRcE9pOXVRUTc4SkszczVvaFBEZXpaTDFU?=
 =?utf-8?B?YlBjRVNKWEtVNHk2VnVabWIwUkxldkN1TlZPdUpZS0pBUUQraW1yRTQ0WHBN?=
 =?utf-8?B?Ym1hTW1aZ2dPTUQ5K3BEcTEvQlYzVFJnZzcyVnkwcE9PYXNjaXJkZW9uUUlE?=
 =?utf-8?B?SnNuRXNJWUNZUnlGUm9JcGNpeHBJVWF5a1FjeHZLTlByNWNYUEVRcUdFU2V1?=
 =?utf-8?B?TkovQ0RrNGRveFhlTmQzQmYyOW53VEpDWG5RK0tNdVFFbVcwOEZhd0hHQTdr?=
 =?utf-8?B?czZncHBVQks3UVZjR2hKVDFzeFpwenkyNkhhRHA4bjdsYUlKbVVHVlRNeUVo?=
 =?utf-8?B?aGM0SHJ2ZDJHQXBXRzBLUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47566690-ba5e-4a50-fee2-08d8ef6e3ae1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 09:13:18.7380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNyvUGm7wwONoXGjHjtZWYrgxHhnI5hDsMx2imodGLCjnr4epdLn2kA96o27KS6N5xoVAS2CwXF2WdWTSYjwIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3945
X-OriginatorOrg: citrix.com

On Wed, Mar 24, 2021 at 04:44:05PM +0000, George Dunlap wrote:
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

LGTM, maybe Manuel has something else to add.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

