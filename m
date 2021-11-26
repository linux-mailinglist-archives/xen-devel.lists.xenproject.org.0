Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2B45E982
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 09:38:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232383.402871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqWkC-0000Ud-Al; Fri, 26 Nov 2021 08:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232383.402871; Fri, 26 Nov 2021 08:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqWkC-0000Sg-6D; Fri, 26 Nov 2021 08:38:08 +0000
Received: by outflank-mailman (input) for mailman id 232383;
 Fri, 26 Nov 2021 08:38:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=liQ5=QN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mqWk9-0000Sa-HE
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 08:38:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a518cf1-4e94-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 09:38:03 +0100 (CET)
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
X-Inumbo-ID: 2a518cf1-4e94-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637915883;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2RM0Ly4xI0KUWuwtCGx4Log679I3QoUBBFrJtMVAMBU=;
  b=IctrhkpgGe8e+aTbRJ7nHOoQJ8MNNy2kXToKt9Z7HqmDJp9K15GZPvwe
   iT6r7y2TJjsVRPfVkIwOGnGC1W7DhGI0w5bJlDDcAPhOqOAxf0DdLyl6f
   y40Cd0NlzA1BJdJn4MrwfGPmGHLX9Ezbd0gq0uzW8hQGT9rAVyjtEdzcZ
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Kht7KxNn02LP5h3Duc4rz/5ru6WPouh9EKCGXWFXOmBECN/R6pbz/V8YfWhW83m7fEyMf27cud
 BBmovsD7ZZljXMcMUd+bZeUM2WOu3S/A/MsNUwCn+qVCzV+9DNswvwcpwuGUUovMJ4YFm93w+Y
 RgBrPqt9l0yPE0TXUAtQi/+jfoiBmDWRvlKIsZpZ/cp5qV5GU666KlYd7MUWRmcXu+y0czPX+j
 BT/vzemPP01kot8dpFmFs4LlgYV/LZm8GvZTAQTlhdRYCqtp3x/Ph9xrybkbQ8ztljytL+ThG5
 LxbwOFR5/PhFYeUcStmr0U5R
X-SBRS: 5.1
X-MesageID: 58682505
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VDV3r6DjtAwi0RVW/9Lkw5YqxClBgxIJ4kV8jS/XYbTApD0lhjQGn
 GsYWmrTa6rcMWH2ftl/OY+/8kpX6JXVy9M3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5400w7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/ug+LwZd68
 fB3n42PUCwDE5HswNoyXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvWUtYUFhGpYasZmLbXhP
 uUfSj1Vcg3STz8MIlM9Grkbg7L97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcIMNFpWo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3EWuRYijdwaiq3DCuBMAM+e8CMVjtlvLkPCNpV/EWC5UFVatdeDKqucHfz50k
 VSwuunDFAN2m5e4dVLFyJib+Gba1TcuEUcOYioNTA0g6tbloZ0ugh+ncuuPAJJZnfWuR2iun
 mniQDwWwuxK0JVVj/nTEUXv2mr0/vD0ohgJChI7t45Pxidwf8abaoOh8jA3Bt4Qfd/CHjFtU
 JXp8vVyDdzi77nRy0Rho81XRdlFAspp1hWH2jaD+LF7qlyQF4aLJ9w43d2HDB4B3jw4UTHoe
 lTPngha+YVeOnCnBYcuPdnuW5p3kvm8S4i+PhwxUjaoSsMqHONg1HszDXN8Iki3yBR8+U3BE
 cvznTmQ4YYyVv08kWveqxY12r433CEurV4/trigpylLJYG2PSbPIZ9caQPmRrlgsMus/VWEm
 /4CZpDi40gOD4XDjtz/rNd7waYidiNgW/gbaqV/K4a+H+aRMD17VqKKn+p+I9cNcmY8vr6gw
 0xRk3RwkTLXrXbGNR+LejZkbrbuVox4tnU1IWonOlPA5pTpSd/HAH43e8RlcL852vZkyPIoH
 fAJd9/ZWqZESyjd+iRbZp749dQweBOujAOIHiykfDlgIMIwG12XoofpLln16S0DLiurrs9i8
 beu4RzWHMgYTAN4AceINP/2lwGtvWIQkf5ZVlfTJoUBY13l9YVncnSjjvI+L8wWBw/Ewz+Wi
 1SfDRsC/LGfqI4p6tjZw6uDqt7xQed5G0NbGUjd7Kq3anaGrjbyn9cYXb/RLz7HVW7y9KGzX
 slvzqnxYK8dgVJHk4tgCLI3n6gw0MTi+u1BxQN+EXSVM1nyUuF8ImOL1NVkv7FWwuMLohO/X
 0+C94UIObiNP8+5QlcdKBB8M7aG3PAQ3DLT8e40MAPx4youpOiLVkBbPh+tji1BLeQqbNN5k
 Ll54MNGuRaijhcKM8qdinEG/muBGXUMTqE7u8xIG4TskAcqlglPbJG05vUaO31ThwGg6nUXH
 wI=
IronPort-HdrOrdr: A9a23:H14CFah112GFoTKdwsgsDIE+h3BQX0B13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGIaG52IrT0JcjpzencGOjWubqBJcq
 Z0iPA3wwZJLh8sH7uG7zQ+LqL+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+memsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lodFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNyN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wuJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tAB2nhkjizypSKeGXLzYO9k/seDlGhiXV6UkYoJlB9TpZ+CRF9U1wsK7USPF/lp
 L52+pT5fZzp/QtHNBA7dE6MLyK41z2MGHx2V2pUCHa/YE8SjrwQs3Mkf4IDN/DQu198HJ1ou
 WGbG9l
X-IronPort-AV: E=Sophos;i="5.87,265,1631592000"; 
   d="scan'208";a="58682505"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7wn/VGaHiBEFEhN2So8abG6wea3fh6qbr778YxedDQqMWexl0iulOPmvoaGJi8wF1e6arDSRJJqx5NEOTolcllodZCuJmVKubJsf+QwHdiXQ+PDKVuoA70d0DNGZM3vQiyTis2qKASX9vn/Qy/xEjvBkpYdX/Bb4kgq4NT1qaUV5G9m60HiarZGM4d5MONtszWbSk8RTDCck6IH4woQBDhlrelr4cqfs6/4mrAPlbdtilU3+XO0t3m9KNzpDHJB4h8MwUraKCfd1wIKeHe8KM6rLPzY1WsqSfPz+3kcDGfmg8szC5/q6JcuVxNXKMdPAuIkVetFJq+sqZAmjILb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mpspua+0GLswF9Qn3jLXlfTXrpHhfRx8gki9ukV4AGg=;
 b=cKrjpmDyIdu2y38g9SOW5e7JnF0XyQ06A+yjyH5KRrigQ3hJ320QtDuUt9ce15Z2v5VuWKEAe1j2nCRPAuyXftOgeo313DTqEFejEuoNuFf7c9UIDtbtyuDv7VMkYt+zmrMyZUnvEborEpiRhmGoKxLKh9wvAAcNFQ+a6/XCpsfBAwq8WKhsKNQMlRTFPeE5LxernQch+wW7XYi73/loSgYmvze1H2cidOe57znOHt89Sf7dyogcb2Zs5m5hQNIEAZH2gtbTGUF1OTguzNwUZonGueoVyldpvLKO307hVh8TSbBpvFuibNNt/+c5LDe5Z0PsVj+ixQk4csS1KIiO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mpspua+0GLswF9Qn3jLXlfTXrpHhfRx8gki9ukV4AGg=;
 b=LpWJ4Ojn2Q+Dh3NClN+qc/dBAkwulOcqVlmAs/+PEG2woig1Y8Xendz3v26ooxOHlqGkLtULPvJX0+bOph35biex6+K0gqwiXmo5pBt3KclpSHQri82dvbynT6xrOrMAWqHh/XVU/cBHCkQIClmV9qiUomUTpkM6fjR/M4aUO/k=
Date: Fri, 26 Nov 2021 09:37:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
Message-ID: <YaCc3NI39cZZTTU9@Air-de-Roger>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
 <00c77026-1b65-c73a-b786-0e0b9d22e994@suse.com>
 <YZ9oxXdnAEXaRtAD@Air-de-Roger>
 <00a83850-0aba-a66c-09ed-81204e8cdb3c@srcf.net>
 <b5fc926b-7fbe-b8fc-3271-2423b745b1d7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5fc926b-7fbe-b8fc-3271-2423b745b1d7@suse.com>
X-ClientProxiedBy: MR1P264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85284b86-17f0-45a0-b97a-08d9b0b808a1
X-MS-TrafficTypeDiagnostic: DS7PR03MB5605:
X-Microsoft-Antispam-PRVS: <DS7PR03MB56057D0C2E34E30B2199C8218F639@DS7PR03MB5605.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YRXREqXydB6wfMa3rt7VKzrZKeGIK81tU4XSV02GKkT//eHCCiQBNyMDePJcosfasncHD1Tc70sr3lSIzjLDG3MBFVGgk/rr4RCKSroLC5grHnIGut5VFYoeUYZt+M1uThmLXsVjkCwN5IXxtm5rUSjwaIAGBXWCv0JdVf8dE6QQhGPkapfH07utdXSvnmif3N6VcpiT6akGnDIgF21He2exC7ua1ky9wRJD8MDsJUVn7B4Otl7Z86TBs1W1sdojTLE3A5yY6+i9QdOFLQzuDzz0U8jlYIHkmyfm1d5tCCgHSjxHdIrwch1W0XSOs8cm8pxZeFtoZOmQljfdgVX5yqHoUy06yr0OXTXuqSrJG/1XI4nbmDcLi8HNH1v8ZIbL9RLLx34IlD2s1cnBm5AMbAJEKu2ML8etv4f6qsue2n2Y3tA98dI5NKPLbaoYzfbl48kSXjwndp5IFJok8q2OY6ClQmBT8HmrX9am4V3I2txVN/SJowYbuxUzbCfBdre1UiEDqc0SSwUOwwg+b8PEa21VAh9YmqAt7PI7yoYaiGlFu8XmJL8Y/hgIdn92pnSegn/+Feia7n2qCr0p3nHXan3a0YAN8iCeYp1Th6MLsckwv0GyqVIMLYWIUPRZDolmZQSb0+JaAtNqiX8R6CFOEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(8936002)(33716001)(26005)(508600001)(54906003)(85182001)(83380400001)(316002)(66946007)(9686003)(6486002)(6666004)(66476007)(53546011)(38100700002)(8676002)(2906002)(66556008)(5660300002)(86362001)(956004)(82960400001)(186003)(6496006)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXdmS21oQk9qQkdrbkxWd2FOZWVhcDJlWUxYOUVNbk9WTGhNY0pJTFhqT0g4?=
 =?utf-8?B?NHFScGlXeWNrVGt2dlc4M3Y5YW1HYTRGTVROUWovMzJzVG5HQU1HMTNPL0ox?=
 =?utf-8?B?NG5maTdrZ0xhWGlBazdqbk9DaUdwSGpiYXNOb1RGYm42ZHNoUy82QW1Qc2w3?=
 =?utf-8?B?c1VOMzZ0RElzRitqUS80TjI0dGJWa2t2N0N6c2JwbXhqVUt5U2g0VW8rTisz?=
 =?utf-8?B?eTdxQUlXMkJkckdTSWFHWTlFWWZsRVU5bnFBYlVNRnVFNzlBRjBaTHJFM2lz?=
 =?utf-8?B?WUltaUVGMmJYS3hEbVYrbXZLYXF5bFIyb3N2YWZRWHkvQ1lhTWY0cXRoNXcx?=
 =?utf-8?B?V0Y5Slo0bXdDbDk2cnNEeURlYUVOLzV0SHV1c1FzczhSVVgzZGNMWWhvYzI4?=
 =?utf-8?B?WGNyamdnYW1WWmV6cGh1OTkycEVKUW1RSUQxZDJvM2x1eG5YanhyYkMrRjN5?=
 =?utf-8?B?S0hzbjVicGlxQjljcTRKQk9jem5vNnVRSitxZGtQbXZwUWhBaWFqb2hQdmRR?=
 =?utf-8?B?WlpDSHlmRTEvcHJ1Ri9qV0xiYk54S3lIdTlmOFd4TXgyU3dZWHZqUy9OOUhE?=
 =?utf-8?B?NHVMbmYyYUJVaThjMGhrRTlEaC9XMmxXU0RsNTZJaDlqQ0xWRUoxNGRKWEhR?=
 =?utf-8?B?eEZJZVlWRlV4aThjR2FjaEh3dE83ZkNmbitLMG5OanUwUmw0eVZWSm1Qbm1B?=
 =?utf-8?B?cmJQRE84dUhkZkVIeDZrTTJZcFNtamxmZUtVU25VNlk0ZkpNTUk3eUV6WENs?=
 =?utf-8?B?Vk9KclN3enV2ZXZBb0RHTkJSdXFYdEJvMVVpekc1TURVTTcrTDl0UG1NaUxG?=
 =?utf-8?B?VmRKK3BWMHRzUzZPeVBtMDM0SUpyaVZqaCtxd3h0MEZDSXhKNDlCdllOVFBT?=
 =?utf-8?B?V1lzOFUzOUpyeXJRRms2SnU0SEhQUkhmMGRPWFl1VmlTeEdQUlh4S2FmdVhi?=
 =?utf-8?B?RW0rY1B2eHF5bjlGbjhSUy9wOU5HN2pPMXlPZTRFL3dCMytjNnBSdk82dWhE?=
 =?utf-8?B?RUVrcHcrekVqTEtlUXozM1kxRUhiWFBVR2k1WXY4YlZMQVVvVGZkSXJoalVW?=
 =?utf-8?B?RDFnYmhZL2N3UzRhbXVvcWwrd01Db1FBVDJ6Z3I0WDFwdDFDTTlQNFdkR3ZE?=
 =?utf-8?B?QlhPaFArTGNxRUNRVzBtbVhIb3pzYlJCWTVqbHRUeWcwYzFVdmtLUEhyMGFY?=
 =?utf-8?B?QnhqZ0QxWC8yMVJEemtpSkI0dFJER2h0K2ZUVStvL1kzSkE4MUpoUm5ZYkgy?=
 =?utf-8?B?akkxb0hIUUo3eGdXdzk4R3J4aFVzMTBSMDB4REFMZGRUU2Vyazc1U3IxYmxt?=
 =?utf-8?B?WlovS3dBcjR2VVN2ZFg3SllhSzhMNUJEa0I1LzdlS1V3UGJzNU0rVk4zTTlr?=
 =?utf-8?B?b0hrbTNLZDdEcmxCOE95U3hFazgxQlROLzFibzlxbElqUVJIZVJTZXIxMmJG?=
 =?utf-8?B?bE9qTWNqV1YrNWxJSEREN2U0UlFXQ1N6YmFORWUwSFNFeG1SdVNmdTVDYTJT?=
 =?utf-8?B?SGpJUThPNk00SWswdUM2OFRYMGJHbHErZEQreVc0eEU4MS92WGoyb2JLclFV?=
 =?utf-8?B?QlUvdXV4aWtPQnZVa3R0S0NKZUh1djEvcEsxRjVQUm0wMFhlMEl4S3lrUWtE?=
 =?utf-8?B?cGMreDRFZ05ocFZ5MWJVdjFnTTZ1cCtvMWVRdUlYYm1aQ010clFUaFMxNTVU?=
 =?utf-8?B?TmQrZWZrMmMvcDN5R1VxUkQ4R0RZOUluV3hEUlVrYXRzaWZmL1FaT3pBVUVw?=
 =?utf-8?B?S3pKN1ZWQWFKYU5XQk90SWFNV2UvS2VQc201TXhQR29EN082THpaN1NFQ2Vm?=
 =?utf-8?B?QkZZRlA2d2QvUFd4OU5BNkI2R2ZQWDV2dnQ2Tkt1SllUL2lqSEFwcW43MHF0?=
 =?utf-8?B?Z09EUndLLzVGaGhPRFRkR0NoS08reGxTa3drMkNtWnZNZXFzdjIxdTJMUVBv?=
 =?utf-8?B?ZVlpd2ljdHdEeXVEZ1hyNHcyVWFsUXByTHJOSXF1akNCTmljQTBXNzNkdmI5?=
 =?utf-8?B?QUFnYXBmUEJhM0lyanBCQ0c1M0VadjdMSkdSRzYzMEJ4SG1tLzYxQXh6QWtz?=
 =?utf-8?B?UW9MWVRiVXVkbUsvRkI5MS9XRmJQR2g3OFJmaXZDdjFEVWdwSXhVV291RmlH?=
 =?utf-8?B?Wms2cFlwOEhjU2s5dEk2bCtVeXhzbENMSDc0TkprTVNxcXBTaG1KWEJQZXBN?=
 =?utf-8?Q?spz7UBARxVLIz4A5+q8Ambc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85284b86-17f0-45a0-b97a-08d9b0b808a1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 08:37:51.6327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcamTf+Q5pBvvFvpuBq2ge3gTsiHFwhlyWOZOI1ESC/J7Fb7VyZaEvaNXS6jTEpWRW+pLvZymjNPjWxIjYRjXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5605
X-OriginatorOrg: citrix.com

On Fri, Nov 26, 2021 at 09:22:50AM +0100, Jan Beulich wrote:
> On 25.11.2021 18:28, Andrew Cooper wrote:
> > On 25/11/2021 10:43, Roger Pau Monné wrote:
> >> On Thu, Nov 25, 2021 at 11:25:36AM +0100, Jan Beulich wrote:
> >>> On 24.11.2021 22:11, Andrew Cooper wrote:
> >>>> OSSTest has identified a 3rd regression caused by this change.  Migration
> >>>> between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron 4133)
> >>>> fails with:
> >>>>
> >>>>   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf ffffffff, msr ffffffff (22 = Invalid argument): Internal error
> >>>>   xc: error: Restore failed (22 = Invalid argument): Internal error
> >>>>
> >>>> which is a safety check to prevent resuming the guest when the CPUID data has
> >>>> been truncated.  The problem is caused by shrinking of the max policies, which
> >>>> is an ABI that needs handling compatibly between different versions of Xen.
> >>>>
> >>>> Furthermore, shrinking of the default policies also breaks things in some
> >>>> cases, because certain cpuid= settings in a VM config file which used to have
> >>>> an effect will now be silently discarded.
> >>>>
> >>>> This reverts commit 540d911c2813c3d8f4cdbb3f5672119e5e768a3d, as well as the
> >>>> partial fix attempt in 81da2b544cbb003a5447c9b14d275746ad22ab37 (which added
> >>>> one new case where cpuid= settings might not apply correctly) and restores the
> >>>> same behaviour as Xen 4.15.
> >>>>
> >>>> Fixes: 540d911c2813 ("x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents")
> >>>> Fixes: 81da2b544cbb ("x86/cpuid: prevent shrinking migrated policies max leaves")
> >>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> While not strictly needed with Roger having given his already,
> >>> Acked-by: Jan Beulich <jbeulich@suse.com>
> >>> to signal my (basic) agreement with the course of action taken.
> >>> Nevertheless I fear this is going to become yet one more case where
> >>> future action is promised, but things then die out.
> >> I'm certainly happy to look at newer versions of this patch, but I
> >> think we should consider doing the shrinking only on the toolstack
> >> said, and only after all the manipulations on the policy have been
> >> performed.
> > 
> > Correct.
> > 
> > The max policies cannot be shrunk - they are, by definition, the upper
> > bounds that we audit against.  (More precisely, they must never end up
> > lower than an older Xen used to offer on the same configuration, and
> > must not be lower anything the user may opt in to.)
> 
> I disagree: For one, the user cannot opt in to anything beyond max policy.
> Or else that policy isn't "max" anymore. The user may opt in to a higher
> than useful max (sub)leaf, but that's independent.

Wouldn't it be possible for Xen to offer certain features to guests
that are not part of the native CPUID policy, and that thus might
require setting bit(s) on leaves that could otherwise be empty? That
also requires some explicit checks in Xen in order to assert that
leaves above the max one are empty.

TBH I'm not sure what's the benefit of shrinking the max policies, as
those are not to be used as-is by guests. They are an upper bound, but
should be tailored for each guest usage, and should be shrunk before
being used by guests on a case-by-case basis (ie: by the toolstack).

> I'm also not convinced
> older Xen mistakenly offering too much can be taken as an excuse that we
> can't ever go below that. We've done so in the past iirc, with workarounds
> added elsewhere. Older Xen offering too high a max (sub)leaf again is
> independent. Max (sub)leaf requests from the user should, contrary to my
> view when submitting the original change, be honored. This would then
> automatically include migrating-in guests.
> 
> > The default policies can in principle be shrunk, but only if the
> > toolstack learns to grow max leaf too (which it will need to). 
> > Nevertheless, actually shrinking the default policies is actively
> > unhelpful, because it is wasting time doing something which the
> > toolstack needs to undo later.
> 
> I agree.
> 
> > The policy for new domains should be shrunk, but only after every other
> > adjustment is made.  This is one small aspect of teaching the toolstack
> > to properly understand CPUID (and MSR) policies, and has always been on
> > the plan.
> 
> And this not being the case yet is getting too prominent for my taste
> with the need to raise the max Intel leaves we know of for things like
> AMX or KeyLocker. I didn't get shrinking done right; apologies for that.
> But I continue to think that proper shrinking ought to be a prereq to
> that, without delaying that work (effectively complete for AMX, partial
> for KeyLocker) almost indefinitely.

I have to revisit the patches I have pending for CPUID/MSR interface
cleanup on my side, but I think that the shrinking could be easily
done at the tail of that that series.

Thanks, Roger.

