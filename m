Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2422444C176
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 13:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224274.387491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkmtB-00060g-3n; Wed, 10 Nov 2021 12:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224274.387491; Wed, 10 Nov 2021 12:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkmtA-0005yN-Ve; Wed, 10 Nov 2021 12:39:40 +0000
Received: by outflank-mailman (input) for mailman id 224274;
 Wed, 10 Nov 2021 12:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qBHU=P5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mkmt9-0005yH-Cv
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 12:39:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4291bb7e-4223-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 13:39:37 +0100 (CET)
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
X-Inumbo-ID: 4291bb7e-4223-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636547977;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=v4UGDMgnlnJXudNXKEzt3njJOw9rRi7bfE29/RtOF/g=;
  b=SvRqDagzv52kOdShVLvkHaEDo9IRbpFSME5At0RV7ZoSYO5+gX2sqpfr
   WHstpMIWYwqDbuA/pDpzdHVZmwtoajhxtwafQ9ZG7qzNhkeYa+NgmCvyw
   DZBT+KLuLQ6PiDuukAqQmqnMlF2tecN0Rv1iq+Q6zha5NoUyWExmZLGMW
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +lJUA+s/PftXbE2U5KIMmpiL9pUpLRBmzbfdrJ4yJbVbCUQ0onr/p1Uwszh05rCviLWgnklCOn
 8HHnTpHuFO9fdLBG86vf4/ve8mI51/d8sI2j85vyaP5o+ffAMtC3TkwViQ3vWJVi36876VYZjS
 BW6wJuyveBUhYc/vBY5EEGEDGJZHGadUQSULJUKJjkgEh7NGJ6nHI9n2nKI2PxgWb11Ixnnwxr
 iKJxMeeWLIrexvDxRKoiBXm6ipXqqEWM8tW1Kn59Wr7ovTR/rVTjF42eZcJlCzbMSU6CoSxTRK
 uwMbF0j5ahRJGICHqokTAf7N
X-SBRS: 5.1
X-MesageID: 57524901
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:W7unvaldln9e5N1znf1A+T7o5gxgIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOCjiAM//fY2D3e9BwOou2oxgFu8TTnIJhHFc+/yk0QyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29cw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MV3rreQYl52ApSSsbhFUjwGCHxBMLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpv25oSTK6HD
 yYfQX1gYxucPDxCAAcsKakZpv713GDTdQQN/Tp5ooJoujOOnWSdyoPFMcXXUsyHQ91PmUSVr
 X6A+H72ajkYPtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUq0hqm6oGNvDqgWEFYFj9kNsd7i8IpEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQGmom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CHsp6sz67DFzFtW
 UTofeDFtIji6rnXxESwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJ1aJW+yP
 BKI5V4AjHO2AJdMRfQvC25WI557pZUM6Py/DqyEBjawSsEpHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZPdw1XdiZiWsitwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg6NNsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:5kazTqo3fmDGIKvTD8V75GsaV5vPL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHK9JbjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUaqFh5dL5jUUtMPpZwfSKJMB2+ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.87,223,1631592000"; 
   d="scan'208";a="57524901"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqroA3bcR9adQx5wV2uoCA3s6/Dc/PT/O/kIJ3RUxd7aT1zqjbtzZiS4ZinirxKfgkRG6+ZpEXS93PuYmxwMdj0yGa4oIpllSzGwDkgsCyrg2yRUgxbioLo9QQvLbcHvTr+D4nXEt0/ArMYkl81UMLuwr5CDVikBUADn3+h8cqGRniDwnQX7Z2LOTvcovUUh8aQ9K0DBqoXeKUacaqmQRxsw7eKqJTHC+FC2PDx8auB0fwQVR+3n7sroCzbhN1gXzvqaHLhlvwf153Nax8gZLO14zNMRWCE5EcOKiBvq1Yf9Jv9o5Jm7q3BcCiVQQYiUItbUiYse3vMes+wPzBJNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qpKMFy4TRoXc7OmV+alw9lchQ6vvvfRn9NoZznXQYM=;
 b=HBsPOTLnI/cczcRH/cLuQ8qrSeq96gQ6FwhcdPCAz3VGSbbgoUAnXiCaA/jJNxQpnTW9lXrWZ1+l6qXhP1JA/4NZ8Os4E+Jv+TCnrpmNFVLWMU9PgX7MxlymrbzU+qaGiihHNZhxmK+zweCvlqBukYHykP9AyyOelszfHxi52W3jyjLG/fTOZ6P2byfYIx9qOPPQGaNARAn4r99AiGGlpI+uM2PEc2+KxSOmOMRfwvCgIpYQzYEqEnXCFjPwXkIr8z3FwXDx6+1qkUeQYv0VsIjqyX56IjkjRAhgjaeslrw6oiukDbrPx6puBK1i5j/ffziKkvEY0AlwFtbX6wo3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qpKMFy4TRoXc7OmV+alw9lchQ6vvvfRn9NoZznXQYM=;
 b=bu1HcLgj84tLgHX/4/ewkTYNsa1m8GKaAQ6AoY5YgBgWWWOjn87jEJYHQzoPWG7PHPGyuov6oUecnAszG2gktUKWq1rmafQEEXsxJ52tzm9YPcqf/3QCM3IHL0D/3u+ZtKjj2mCwWCnt79aRdHeSJSn2rWDT3Jo0dXMGhvhM8qg=
Date: Wed, 10 Nov 2021 13:39:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo
 status
Message-ID: <YYu9eYxIYs5gol5q@Air-de-Roger>
References: <20211110091935.16906-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211110091935.16906-1-jane.malalane@citrix.com>
X-ClientProxiedBy: MR2P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc40aca8-dd01-4aff-51e7-08d9a447221d
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:
X-Microsoft-Antispam-PRVS: <DM4PR03MB6192B7539EEBE3E76E762F868F939@DM4PR03MB6192.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QWqh65+DdqEq1K1Ie1fq8f5U38a610YcRpv9SN4622o89oeBzoSNg5hBAZIQBYkbTV6p0wEO+nJH8P80CaJtzBywH+CF7vi/bLCtkhRMWb6ghnB+CZEPDSv8FquUcjWMEmJyDoU3T2HufuUEgwxeTw3Gi2t0CCDv2q3HX67ZPHp6Ot18TCqPY8nJggmfvvkI1g7/t4/47Js+NvKdpO1gqoLpFdQrKPd98T4nyofZ6alerwW3dfEhN34vmptTUf3EbObgkFr3fh+i886nJoXWGfx+3dSt53DXdUm6x2Tx6ACPfXDCGwsD2pYEZD/zX5d8vxl+Ki4PiZTERYPNmAkIXIhqh620O0UloByfLzplx0EBNbOAdJFJzHpKSIRN1A9Kq4UPjaeQ4T3nFw33JqwwmB/7kT9kA0+E78Roq0Cz9NeB/PM/dEYrWLDrc+hw7k/HvbLMSGfLsbzv05jM8DtcHDJ7u+L+LhLaj7/auajU2sY170FOKqLp4A+fn0HsfQvEp4Pa+pxA2hkEY3viNrNuNGWE2QMEAf1sV/0aJIeTJg8WENxptT5GHJt+ntrnfIsxSbsrYC1yAlPFgoyfRkoeOJoKDuAEH5QRC8WylUvlGPGT8Qmz03iqIUQJ4+GfoxRnZNXzAzSdpBGg4tssP1EIeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66946007)(26005)(38100700002)(316002)(6666004)(33716001)(508600001)(956004)(82960400001)(186003)(86362001)(8676002)(83380400001)(6496006)(6636002)(85182001)(4326008)(9686003)(2906002)(6486002)(5660300002)(8936002)(66556008)(54906003)(66476007)(6862004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGM1V1h4SzA3Rys1QStoU0thdjBkZTRFdnBva29UdmR6RHJxOURLbFJIRyta?=
 =?utf-8?B?QWJoVW1JMVEwRzVQMWFXN3BjcUxpUlJCVmFWMEVmNFQrbHpkNi9uRUx5ZE5N?=
 =?utf-8?B?LzMxOWsvMlB3bUUyZ3U1MkhzYXlJbVBhNnpsQVJRN2dKSVdmUTZIRm1XT2xD?=
 =?utf-8?B?ei8yZVE3eTE4UkR3em1odXpIUHg0V01vanQraXhzRFNPdERwaHRqQ2pVVXB0?=
 =?utf-8?B?cDhpa0FUK0xMUCtpbDd1TDl4TitnNG5QRHM3aGdGQTIxODFzWm9USmkxTkFj?=
 =?utf-8?B?QmRTT2NTTWNSOGFDdm9LZ0laMStCSHcyM1p5bklzY2FNTUpVZ2lYb2NnSWx0?=
 =?utf-8?B?ZkMwNkhsSy9Xb081SFJuNDBybTNnbTVQeGRjRkloYTBPNlNnS3ZNTGRqamZ1?=
 =?utf-8?B?M0llakJSbjZtVjJSVlR3NVQ1ZGZURTRUOWZHYlpaV3BMZHdaU1VIeGN0ZDVW?=
 =?utf-8?B?aXUwWTZZdFA4NTNzT1NqaFExV1lvQ3lqajUxcnphL0U0VURMQXZMNVYyY29M?=
 =?utf-8?B?ZERucGdWQVMvaTdkaksxWEx5NXExMFdmQUxqWkZNUVBQYTkvWEpObW0xVkVN?=
 =?utf-8?B?YmZLT21ULzZuY0dXdmRnQ1VTVnlGMFdQNG54T0tOUVp4K0hDb21WeFlKSlpX?=
 =?utf-8?B?Vm5CMVlDQWVrcmMrZ2tJeEw3bkZNcmN5cm5OcmxIRVUvanl5Z1hLbmFBQWZQ?=
 =?utf-8?B?eHIvaVBxTGxIanhkT3dpOHdaSUNRY1plaW5oaE1hMjFYNStLSHBHL0JHYnFS?=
 =?utf-8?B?cTBCdS8wSExQVmhHcnNMUmR0VTZNdWppVkUxRlFEU3IxRWdSSW4xTXhZR3Ux?=
 =?utf-8?B?VjN0YjBGaG5sbDVSN3JzS2Q4UmtYRFV2VHJVUUU2R3F2N0QxajZYNEErZExX?=
 =?utf-8?B?OEdUMEEvdCt1MUFBQnBUeXRrSmNnT1BNbGlQWUhkNXl1cEZya244NDRpMTZh?=
 =?utf-8?B?VjVkS2hoekFNb29qMzBUUWZxbTJ1cVBodlk2QXVnaFBZY015OW91ODF5YkRx?=
 =?utf-8?B?bjRGalU3T2RZYkZPRjlvQmxhM0NWRlI0Q3gwMWQxd0l1cWJIdndXbUVxVnI1?=
 =?utf-8?B?a3ZWdVEveURERGlWNXZwNzI4OVJJTlhSM1psUFUzSjl6S2FWUUtLUXJKY1Jw?=
 =?utf-8?B?cXU0VmtXOWJRUFdIWm1vU0VxUU9OcFVSeXFHNFA4R0Eva2Fkay80ODYxeitw?=
 =?utf-8?B?S0RBb1lIcTdkdWRldlVibWRkYXVDT2dSS0d4M3JZeDRkZEhuaFpDVnZpMUhv?=
 =?utf-8?B?dmFwL0RyalhUNTk3ODFyODBkN0RQOGNnYkhTcTYxWHYrRCtpZElPVkdPU0RF?=
 =?utf-8?B?VXNVYm1xZkFTQUhzdXlNMXBYMEZmbnM1dWNOdEVSUGhXaHA0S3NKb0dGUm5j?=
 =?utf-8?B?SVJGTytERU9NbEdNMWduN2VlZ3ozUnhCTDdoam5SSmxNSHVpV3ZtN05vYXB5?=
 =?utf-8?B?WFFvR0ZmanYzSkVmaUJkbTZubC9ZZUZxbklPdml0UjdRNTRGYlZrMUJhT1ZZ?=
 =?utf-8?B?VC8xVklDdm1mclB3RHFuN3ZjRncwL0FGL1dkRjJsbmtMRHNpeHZMd0N0a28w?=
 =?utf-8?B?bkpLVXJXaEpUMUhVWXhESzVFN0Erd0FKQ3MyQWxqaUJleHB6eUJpU3lodHFw?=
 =?utf-8?B?d1BMVENxdEljVzJSN0tmWEttdFRXRysvR2poZWtQczIrOU1sSFFTa2F4UVZG?=
 =?utf-8?B?MnM2TGJYZU1nNzFlUjBPeTdzRFUyV3hRbW42STJrelFVUUYwV0dFMm5PbmJj?=
 =?utf-8?B?TmVmbTBSVVNEUWpUbzBGTGRJd3ZZSTF5OEtZbDJkcnZXNGgyYTdXMDFGOVJ6?=
 =?utf-8?B?SVEvbkJVaDhORVJQMXdtZmltQS8wcHluVkdLcXFVQVdFKytsQnNEakJYbnJi?=
 =?utf-8?B?aElTMjVhL3VUQTM3OEF2WTd2MUxVUE9MOFRTOGlzbVlqdk5PLzcxcGJIb0pD?=
 =?utf-8?B?czVKK1dicHBDR0lMZ1MyakxKL2tPT2FDeC9CL2pBOXl0MksyU0oyUzJvcnla?=
 =?utf-8?B?Wm5vdnh5bGxMWUlwQjl0V3lxdGxqaGRtTEpRa2xPcGdSMmptZ29uVllHM1Vm?=
 =?utf-8?B?cVBXell5Yk1mYUpGY1c4MnVjemtYYmlsSHd5OWhUMUZGNmlDQUl2ODFDNjlU?=
 =?utf-8?B?My9KcVcxcW8xaVRRb2xCbjRVQkU2bVB6L3VwQWp1bllOQ2ttUERwYkZPK3Ax?=
 =?utf-8?Q?40yHfW4FB7CF0P+c2IAvFAs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc40aca8-dd01-4aff-51e7-08d9a447221d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 12:39:27.3806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rf0GUjc191fuQPmxhq32AYtOTnVlnOGvvRsozC1TKk5HP4MPfKq1Owu/F22t2E/2IyfboBJZVTDjeiGD+PzBMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6192
X-OriginatorOrg: citrix.com

On Wed, Nov 10, 2021 at 09:19:35AM +0000, Jane Malalane wrote:
> Before, user would change turbo status but this had no effect: boolean
> was set but policy wasn't reevaluated.  Policy must be reevaluated so
> that CPU frequency is chosen according to the turbo status and the
> current governor.
> 
> Therefore, add __cpufreq_governor() in cpufreq_update_turbo().
> 
> Reported-by: <edvin.torok@citrix.com>
> Signed-off-by: <jane.malalane@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Ian Jackson <iwj@xenproject.org>
> ---
> 
> Release rationale:
> Not taking this patch means that turbo status is misleading.
> 
> Taking this patch is low-risk as it only uses a function that already
> exists and is already used for setting the chosen scaling governor.
> Essentially, this change is equivalent to running 'xenpm
> en/disable-turbo-mode' and, subsequently, running 'xenpm
> set-scaling-governor <current governor>'.
> ---
>  xen/drivers/cpufreq/utility.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
> index b93895d4dd..5f200ff3ee 100644
> --- a/xen/drivers/cpufreq/utility.c
> +++ b/xen/drivers/cpufreq/utility.c
> @@ -417,10 +417,14 @@ int cpufreq_update_turbo(int cpuid, int new_state)
>      {
>          ret = cpufreq_driver.update(cpuid, policy);
>          if (ret)
> +        {
>              policy->turbo = curr_state;
> +            return ret;
> +        }
>      }
>  
> -    return ret;
> +    /* Reevaluate current CPU policy. */
> +    return __cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);

Do you need to revert the policy->turbo value to the previous one if
the call to __cpufreq_governor returns an error? (much like it's done
for the .update call above).

Thanks, Roger.

